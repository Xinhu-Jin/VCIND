function [GLM_T,GLM_P,partial_R,partial_P]=plot_lm_version2(model,X_name_real,X_name_model,contextFtitle,outpath,prefix,adjustedCV_ind,paper_ind)

if ~exist(outpath,'dir')
    mkdir(outpath);
end

% obtain X_data
tableX=model.Variables;
designM=myDesignMatrix(tableX,model.PredictorNames,0);
coefName=model.CoefficientNames(2:end);% get rid of intercept
coef=model.Coefficients.Estimate(2:end);% get rid of intercept
ind_X=find(strcmp(coefName,X_name_model));
X_data=designM(:,ind_X);
% obtain the Y_adjusted
eval(['Y_data=tableX.' model.ResponseName]);
if adjustedCV_ind==1
    ind_CV=find(~strcmp(coefName,X_name_model));
    CV_coef=coef(ind_CV);
    CV_designM=designM(:,ind_CV);
    CV=(CV_coef'*CV_designM')';
    c=nanmean(CV_designM,1);
    c=repmat(c,size(CV_designM,1),1);
    c=(CV_coef'*c')';
    Y_used=Y_data-CV+c;
elseif adjustedCV_ind==0
    Y_used=Y_data;
    c=0;
end
figure('visible','on');
plot(X_data,Y_used,'ko','markersize',5,'MarkerFaceColor','r');
coef=model.Coefficients;
slope=table2array(coef(X_name_model,'Estimate'));
intercept=table2array(coef('(Intercept)','Estimate'))+mean(c);
lm_line=refline(slope,intercept);
set(lm_line,'color','black');
set(lm_line,'LineWidth',2);
GLM_T=table2array(coef(X_name_model,'tStat'));
GLM_P=table2array(coef(X_name_model,'pValue'));

tmp=length(contextFtitle);
    Y_name=model.ResponseName;
    ind_CV=find(~strcmp(model.PredictorNames,X_name_model));
    CV_names=model.PredictorNames(ind_CV);
    [partial_R,partial_P]=myPartialCorr(tableX,X_name_real,Y_name,CV_names);
    contextFtitle{tmp+1}=['partialCorr:' num2str(partial_R) ' P:' num2str(partial_P)];
contextFtitle{tmp+2}=['Sub:' num2str(length(model.Fitted)) '  T:' num2str(GLM_T) ' P:' num2str(GLM_P)];
title(contextFtitle);
if paper_ind==1
    print(gcf,'-depsc2','-r600',[outpath '/' prefix '.eps']);
else
    saveas(gcf,[outpath '/' prefix],'jpg');
end
close(figure(gcf));