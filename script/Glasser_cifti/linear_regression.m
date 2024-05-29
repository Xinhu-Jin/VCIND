% bl = table(Intra,Age,covarate(:,1),covarate(:,2),covarate(:,3),'VariableNames',{'Intra','age_scan','FCS','Sex','age_birth'});
% lm = fitlm(bl,'Intra~age_scan+FCS+Sex+age_birth');
% plotAdjustedResponse(lm,'age_scan');
% x1=covarate(:,1);
% x2=covarate(:,2);
% x3=covarate(:,3);
% 
% AdjustedIntra=Intra-b1*x1+b1*mean(x1)-b2*x2+b2*mean(x2)-b3*x3+b3*mean(x3);
[ID,is,iS]=intersect(behav(:,5),FCS_om.subid);
Age=behav(is,7);Music=behav(is,4);Sex=behav(is,6);Education=behav(is,11);FCS=FCS_om.global(iS);
for i=1:7
LI=OMsubFCS.he(:,i);
bl = table(LI,Age,Sex,Education,FCS,'VariableNames',{'LI','Age','Sex','E','FCS'});
lm = fitlm(bl,'LI~Age+E+FCS+Sex');
cov=table2array(lm.Coefficients);
b1=cov(3,1);b2=cov(4,1);b3=cov(5,1);
AdjustedLI(:,i)=LI-b1*Sex+b1*mean(Sex)-b2*Education+b2*mean(Education)-b3*FCS+b3*mean(FCS);
end

bl = table(VI,Seg,covarate(:,1),covarate(:,2),covarate(:,3),covarate(:,4),covarate(:,5),'VariableNames',{'VI','Seg','FCS','Age','Music','Sex','Education'});
lm = fitlm(bl,'VI~Seg+FCS+Age+Music+Sex+Education');
plotAdjustedResponse(lm,'Seg');
x1=covarate(:,1);
x2=covarate(:,2);
AdjustedHo=Ho-b1*x1+b1*mean(x1)-b2*x2+b2*mean(x2);