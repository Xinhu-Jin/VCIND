% calculate the interaction of betweent the treatment type, and treament
% time using the mixed linear model

%% load data
clear;clc 
datalist = { 'FCS_VCIND1', 'FCS_VCIND2','FCS_VCIND3';'FCS_VCINDcog1','FCS_VCINDcog2','FCS_VCINDcog3'};
filelist = [{'behav140'};{'FD'};datalist(:) ];

for i = 1:length(filelist)
    load([filelist{i} '.mat']);
end


%% construct a table that contains all subject-depend variables and y

%get the behavioural data and control varaibles 
n_parcel = 180;
treatment = [0,1];
time = [0,3,6];
df_behav = array2table(behav(:,1:6),'VariableNames',{'treatment', 'time', 'subid', 'sex', 'age', 'edu'});
df_behav.treatment = categorical(df_behav.treatment);
% df_behav.time = categorical(df_behav.time);
df_behav.subid= categorical(df_behav.subid);
df_behav.sex = categorical(df_behav.sex);

df_data= df_behav;
df_data.fd = fd(:,2);


%% retrieve the y variables
y_vars = {'intra_LI', 'he_LI', 'inte', 'seg', 'homo'};
x_vars = {'treatment_1', 'time', 'treatment_1:time'};
T_coef =  array2table(zeros(n_parcel,5), 'VariableNames',{'Estimate', 'SE', 'tStat', 'DF', 'pValue'});
formula = 'y~treatment*time+sex+age+edu+fd+global+(1|subid)';
Results = struct();
for yi = 1:length(y_vars)  %loop through each y_variable  
    y_var = y_vars{yi};
    
    Coef = struct();
    Coef.treatment = T_coef;
    Coef.time = T_coef;
    Coef.interaction = T_coef;
    for pi = 1:n_parcel  % loop through each parcel
        df_data1=df_data;
        df_data1{:,'global'}=0;
        df_data1{:,'y'}=0;
        for x1 = 1:length(treatment) 
        for x2 = 1:length(time)
            Y = eval(['getfield(' datalist{x1,x2} ', y_var);']);
            cov_global = eval(['getfield(' datalist{x1,x2} ', ''global'');']);
            index = df_data1{:,'treatment'}==categorical(treatment(x1)) & df_data{:,'time'}==time(x2);
            df_data1{index, 'global'}  = cov_global;
            df_data1{index, 'y'}= Y(:,pi);
    
        end
        end
        lme1 = fitlme(df_data1, formula, 'FitMethod','REML');Fvalue=anova(lme1);
        Coef.treatment{pi,:} = lme1.Coefficients(2,2:6);
        Coef.time{pi,:} = lme1.Coefficients(3,2:6);
        Coef.interaction{pi,:} = lme1.Coefficients(9,2:6);Coef.interaction{pi,3}=Fvalue(9,2);Coef.interaction{pi,5}=Fvalue(9,5);
    end
    Coef.treatment = add_fdr_correction(Coef.treatment);
    Coef.time = add_fdr_correction(Coef.time);
    Coef.interaction = add_fdr_correction(Coef.interaction);
    Results.(y_vars{yi}) = Coef;
    
end

%% save all result
filename = [strrep(formula, '~', '_by_'), '.mat'];
save(filename, 'Results');


%% functions 
function T = add_fdr_correction(T)
    T{:,'qValue'} =0;    
    p = T{:,'pValue'};
    q = mafdr(p, 'BHFDR', true);
    T{:,'qValue'} = q;


end

