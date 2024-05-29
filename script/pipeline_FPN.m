% Two groups(VCIND,VCINDcog),Three timepoints(0,3,6)

%% step1 LI
clear;clc;
Glasser_NGR_VCIND1=g_ls('/data3_node2/workingFolder/jinxinhu/results/36P/VCIND/ses-1/*.mat');
Glasser_NGR_VCIND2=g_ls('/data3_node2/workingFolder/jinxinhu/results/36P/VCIND/ses-2/*.mat');
Glasser_NGR_VCIND3=g_ls('/data3_node2/workingFolder/jinxinhu/results/36P/VCIND/ses-3/*.mat');
Glasser_NGR_VCINDcog1=g_ls('/data3_node2/workingFolder/jinxinhu/results/36P/VCIND_cog/ses-1/*.mat');
Glasser_NGR_VCINDcog2=g_ls('/data3_node2/workingFolder/jinxinhu/results/36P/VCIND_cog/ses-2/*.mat');
Glasser_NGR_VCINDcog3=g_ls('/data3_node2/workingFolder/jinxinhu/results/36P/VCIND_cog/ses-3/*.mat');

FCS_VCIND1=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_VCIND1,[]);
FCS_VCIND2=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_VCIND2,[]);
FCS_VCIND3=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_VCIND3,[]);
FCS_VCINDcog1=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_VCINDcog1,[]);
FCS_VCINDcog2=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_VCINDcog2,[]);
FCS_VCINDcog3=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_VCINDcog3,[]);


%% step2 Baseline
filepath=g_ls('/data3_node2/workingFolder/jinxinhu/results/36P/baseline/*/');
genbaselinemap(FCS_VCIND1,FCS_VCIND1.subid,filepath,'VCIND1');
genbaselinemap(FCS_VCIND2,FCS_VCIND2.subid,filepath,'VCIND2');
genbaselinemap(FCS_VCIND3,FCS_VCIND3.subid,filepath,'VCIND3');
genbaselinemap(FCS_VCINDcog1,FCS_VCINDcog1.subid,filepath,'VCINDcog1');
genbaselinemap(FCS_VCINDcog2,FCS_VCINDcog2.subid,filepath,'VCINDcog2');
genbaselinemap(FCS_VCINDcog3,FCS_VCINDcog3.subid,filepath,'VCINDcog3');


%% step3 Difference between time (3-0,6-0)

[ID_V12,is_V12,IS_V12]=intersect(FCS_VCIND1.subid,FCS_VCIND2.subid);[ID_V13,is_V13,IS_V13]=intersect(FCS_VCIND1.subid,FCS_VCIND3.subid);
[ID_C12,is_C12,IS_C12]=intersect(FCS_VCINDcog1.subid,FCS_VCINDcog2.subid);[ID_C13,is_C13,IS_C13]=intersect(FCS_VCINDcog1.subid,FCS_VCINDcog3.subid);
inte_VCIND12=FCS_VCIND1.inte(is_V12,:);seg_VCIND12=FCS_VCIND1.seg(is_V12,:);intra_VCIND12=FCS_VCIND1.intra_LI(is_V12,:);he_VCIND12=FCS_VCIND1.he_LI(is_V12,:);homo_VCIND12=FCS_VCIND1.homo(is_V12,:);
inte_VCINDcog12=FCS_VCINDcog1.inte(is_C12,:);seg_VCINDcog12=FCS_VCINDcog1.seg(is_C12,:);intra_VCINDcog12=FCS_VCINDcog1.intra_LI(is_C12,:);he_VCINDcog12=FCS_VCINDcog1.he_LI(is_C12,:);homo_VCINDcog12=FCS_VCINDcog1.homo(is_C12,:);
inte_VCIND2=FCS_VCIND2.inte(IS_V12,:);seg_VCIND2=FCS_VCIND2.seg(IS_V12,:);intra_VCIND2=FCS_VCIND2.intra_LI(IS_V12,:);he_VCIND2=FCS_VCIND2.he_LI(IS_V12,:);homo_VCIND2=FCS_VCIND2.homo(IS_V12,:);
inte_VCINDcog2=FCS_VCINDcog2.inte(IS_C12,:);seg_VCINDcog2=FCS_VCINDcog2.seg(IS_C12,:);intra_VCINDcog2=FCS_VCINDcog2.intra_LI(IS_C12,:);he_VCINDcog2=FCS_VCINDcog2.he_LI(IS_C12,:);homo_VCINDcog2=FCS_VCINDcog2.homo(IS_C12,:);
inte_VCIND13=FCS_VCIND1.inte(is_V13,:);seg_VCIND13=FCS_VCIND1.seg(is_V13,:);intra_VCIND13=FCS_VCIND1.intra_LI(is_V13,:);he_VCIND13=FCS_VCIND1.he_LI(is_V13,:);homo_VCIND13=FCS_VCIND1.homo(is_V13,:);
inte_VCINDcog13=FCS_VCINDcog1.inte(is_C13,:);seg_VCINDcog13=FCS_VCINDcog1.seg(is_C13,:);intra_VCINDcog13=FCS_VCINDcog1.intra_LI(is_C13,:);he_VCINDcog13=FCS_VCINDcog1.he_LI(is_C13,:);homo_VCINDcog13=FCS_VCINDcog1.homo(is_C13,:);
inte_VCIND3=FCS_VCIND3.inte(IS_V13,:);seg_VCIND3=FCS_VCIND3.seg(IS_V13,:);intra_VCIND3=FCS_VCIND3.intra_LI(IS_V13,:);he_VCIND3=FCS_VCIND3.he_LI(IS_V13,:);homo_VCIND3=FCS_VCIND3.homo(IS_V13,:);
inte_VCINDcog3=FCS_VCINDcog3.inte(IS_C13,:);seg_VCINDcog3=FCS_VCINDcog3.seg(IS_C13,:);intra_VCINDcog3=FCS_VCINDcog3.intra_LI(IS_C13,:);he_VCINDcog3=FCS_VCINDcog3.he_LI(IS_C13,:);homo_VCINDcog3=FCS_VCINDcog3.homo(IS_C13,:);

intraVCIND2_1=intra_VCIND2-intra_VCIND12;intraVCIND3_1=intra_VCIND3-intra_VCIND13;intraVCINDcog2_1=intra_VCINDcog2-intra_VCINDcog12;intraVCINDcog3_1=intra_VCINDcog3-intra_VCINDcog13;
heVCIND2_1=he_VCIND2-he_VCIND12;heVCIND3_1=he_VCIND3-he_VCIND13;heVCINDcog2_1=he_VCINDcog2-he_VCINDcog12;heVCINDcog3_1=he_VCINDcog3-he_VCINDcog13;
inteVCIND2_1=inte_VCIND2-inte_VCIND12;inteVCIND3_1=inte_VCIND3-inte_VCIND13;inteVCINDcog2_1=inte_VCINDcog2-inte_VCINDcog12;inteVCINDcog3_1=inte_VCINDcog3-inte_VCINDcog13;
segVCIND2_1=seg_VCIND2-seg_VCIND12;segVCIND3_1=seg_VCIND3-seg_VCIND13;segVCINDcog2_1=seg_VCINDcog2-seg_VCINDcog12;segVCINDcog3_1=seg_VCINDcog3-seg_VCINDcog13;
homoVCIND2_1=homo_VCIND2-homo_VCIND12;homoVCIND3_1=homo_VCIND3-homo_VCIND13;homoVCINDcog2_1=homo_VCINDcog2-homo_VCINDcog12;homoVCINDcog3_1=homo_VCINDcog3-homo_VCINDcog13;

VCIND2_1.intra_LI=intraVCIND2_1;VCIND2_1.he_LI=heVCIND2_1;VCIND2_1.inte=inteVCIND2_1;VCIND2_1.seg=segVCIND2_1;VCIND2_1.homo=homoVCIND2_1;VCIND2_1.subid=ID_V12;
VCIND3_1.intra_LI=intraVCIND3_1;VCIND3_1.he_LI=heVCIND3_1;VCIND3_1.inte=inteVCIND3_1;VCIND3_1.seg=segVCIND3_1;VCIND3_1.homo=homoVCIND3_1;VCIND3_1.subid=ID_V13;
VCINDcog2_1.intra_LI=intraVCINDcog2_1;VCINDcog2_1.he_LI=heVCINDcog2_1;VCINDcog2_1.inte=inteVCINDcog2_1;VCINDcog2_1.seg=segVCINDcog2_1;VCINDcog2_1.homo=homoVCINDcog2_1;VCINDcog2_1.subid=ID_C12;
VCINDcog3_1.intra_LI=intraVCINDcog3_1;VCINDcog3_1.he_LI=heVCINDcog3_1;VCINDcog3_1.inte=inteVCINDcog3_1;VCINDcog3_1.seg=segVCINDcog3_1;VCINDcog3_1.homo=homoVCINDcog3_1;VCINDcog3_1.subid=ID_C13;

%% step4 Ji network
%% step4.1 FCS_ji
load('D:\paper\cognitive training\36P\FPN\ji_label_360.mat')
load('D:\paper\cognitive training\36P\FPN\ji_label_180.mat')
for i=1:12
group=find(label(2,:)==i);Group=find(label_360(2,:)==i);

ji_inte_VCIND3(:,i)=mean(FCS_VCIND3.inte(:,group),2);ji_seg_VCIND3(:,i)=mean(FCS_VCIND3.seg(:,group),2);
ji_intra_VCIND3(:,i)=mean(FCS_VCIND3.intra_LI(:,group),2);ji_he_VCIND3(:,i)=mean(FCS_VCIND3.he_LI(:,group),2);
ji_inte_VCIND2(:,i)=mean(FCS_VCIND2.inte(:,group),2);ji_seg_VCIND2(:,i)=mean(FCS_VCIND2.seg(:,group),2);
ji_intra_VCIND2(:,i)=mean(FCS_VCIND2.intra_LI(:,group),2);ji_he_VCIND2(:,i)=mean(FCS_VCIND2.he_LI(:,group),2);
ji_inte_VCIND1(:,i)=mean(FCS_VCIND1.inte(:,group),2);ji_seg_VCIND1(:,i)=mean(FCS_VCIND1.seg(:,group),2);
ji_intra_VCIND1(:,i)=mean(FCS_VCIND1.intra_LI(:,group),2);ji_he_VCIND1(:,i)=mean(FCS_VCIND1.he_LI(:,group),2);
ji_inte_VCINDcog3(:,i)=mean(FCS_VCINDcog3.inte(:,group),2);ji_seg_VCINDcog3(:,i)=mean(FCS_VCINDcog3.seg(:,group),2);
ji_intra_VCINDcog3(:,i)=mean(FCS_VCINDcog3.intra_LI(:,group),2);ji_he_VCINDcog3(:,i)=mean(FCS_VCINDcog3.he_LI(:,group),2);
ji_inte_VCINDcog2(:,i)=mean(FCS_VCINDcog2.inte(:,group),2);ji_seg_VCINDcog2(:,i)=mean(FCS_VCINDcog2.seg(:,group),2);
ji_intra_VCINDcog2(:,i)=mean(FCS_VCINDcog2.intra_LI(:,group),2);ji_he_VCINDcog2(:,i)=mean(FCS_VCINDcog2.he_LI(:,group),2);
ji_inte_VCINDcog1(:,i)=mean(FCS_VCINDcog1.inte(:,group),2);ji_seg_VCINDcog1(:,i)=mean(FCS_VCINDcog1.seg(:,group),2);
ji_intra_VCINDcog1(:,i)=mean(FCS_VCINDcog1.intra_LI(:,group),2);ji_he_VCINDcog1(:,i)=mean(FCS_VCINDcog1.he_LI(:,group),2);
ji_homo_VCIND1(:,i)=mean(FCS_VCIND1.homo(:,group),2);ji_homo_VCIND2(:,i)=mean(FCS_VCIND2.homo(:,group),2);
ji_homo_VCIND3(:,i)=mean(FCS_VCIND3.homo(:,group),2);ji_homo_VCINDcog3(:,i)=mean(FCS_VCINDcog3.homo(:,group),2);
ji_homo_VCINDcog2(:,i)=mean(FCS_VCINDcog2.homo(:,group),2);ji_homo_VCINDcog1(:,i)=mean(FCS_VCINDcog1.homo(:,group),2);

ji_difintra_VCIND2(:,i)=mean(VCIND2_1.intra_LI(:,group),2);ji_difintra_VCIND3(:,i)=mean(VCIND3_1.intra_LI(:,group),2);
ji_difintra_VCINDcog2(:,i)=mean(VCINDcog2_1.intra_LI(:,group),2);ji_difintra_VCINDcog3(:,i)=mean(VCINDcog3_1.intra_LI(:,group),2);
ji_difhe_VCIND2(:,i)=mean(VCIND2_1.he_LI(:,group),2);ji_difhe_VCIND3(:,i)=mean(VCIND3_1.he_LI(:,group),2);
ji_difhe_VCINDcog2(:,i)=mean(VCINDcog2_1.he_LI(:,group),2);ji_difhe_VCINDcog3(:,i)=mean(VCINDcog3_1.he_LI(:,group),2);
ji_difinte_VCIND2(:,i)=mean(VCIND2_1.inte(:,group),2);ji_difinte_VCIND3(:,i)=mean(VCIND3_1.inte(:,group),2);
ji_difinte_VCINDcog2(:,i)=mean(VCINDcog2_1.inte(:,group),2);ji_difinte_VCINDcog3(:,i)=mean(VCINDcog3_1.inte(:,group),2);
ji_difseg_VCIND2(:,i)=mean(VCIND2_1.seg(:,group),2);ji_difseg_VCIND3(:,i)=mean(VCIND3_1.seg(:,group),2);
ji_difseg_VCINDcog2(:,i)=mean(VCINDcog2_1.seg(:,group),2);ji_difseg_VCINDcog3(:,i)=mean(VCINDcog3_1.seg(:,group),2);
ji_difhomo_VCIND2(:,i)=mean(VCIND2_1.homo(:,group),2);ji_difhomo_VCIND3(:,i)=mean(VCIND3_1.homo(:,group),2);
ji_difhomo_VCINDcog2(:,i)=mean(VCINDcog2_1.homo(:,group),2);ji_difhomo_VCINDcog3(:,i)=mean(VCINDcog3_1.homo(:,group),2);
end

jiFCS_VCIND1.he_LI=ji_he_VCIND1;jiFCS_VCIND1.intra_LI=ji_intra_VCIND1;jiFCS_VCIND1.inte=ji_inte_VCIND1;jiFCS_VCIND1.seg=ji_seg_VCIND1;jiFCS_VCIND1.homo=ji_homo_VCIND1;jiFCS_VCIND1.global=FCS_VCIND1.global;jiFCS_VCIND1.subid=FCS_VCIND1.subid;
jiFCS_VCIND2.he_LI=ji_he_VCIND2;jiFCS_VCIND2.intra_LI=ji_intra_VCIND2;jiFCS_VCIND2.inte=ji_inte_VCIND2;jiFCS_VCIND2.seg=ji_seg_VCIND2;jiFCS_VCIND2.homo=ji_homo_VCIND2;jiFCS_VCIND2.global=FCS_VCIND2.global;jiFCS_VCIND2.subid=FCS_VCIND2.subid;
jiFCS_VCIND3.he_LI=ji_he_VCIND3;jiFCS_VCIND3.intra_LI=ji_intra_VCIND3;jiFCS_VCIND3.inte=ji_inte_VCIND3;jiFCS_VCIND3.seg=ji_seg_VCIND3;jiFCS_VCIND3.homo=ji_homo_VCIND3;jiFCS_VCIND3.global=FCS_VCIND3.global;jiFCS_VCIND3.subid=FCS_VCIND3.subid;
jiFCS_VCINDcog1.he_LI=ji_he_VCINDcog1;jiFCS_VCINDcog1.intra_LI=ji_intra_VCINDcog1;jiFCS_VCINDcog1.inte=ji_inte_VCINDcog1;jiFCS_VCINDcog1.seg=ji_seg_VCINDcog1;jiFCS_VCINDcog1.homo=ji_homo_VCINDcog1;jiFCS_VCINDcog1.global=FCS_VCINDcog1.global;jiFCS_VCINDcog1.subid=FCS_VCINDcog1.subid;
jiFCS_VCINDcog2.he_LI=ji_he_VCINDcog2;jiFCS_VCINDcog2.intra_LI=ji_intra_VCINDcog2;jiFCS_VCINDcog2.inte=ji_inte_VCINDcog2;jiFCS_VCINDcog2.seg=ji_seg_VCINDcog2;jiFCS_VCINDcog2.homo=ji_homo_VCINDcog2;jiFCS_VCINDcog2.global=FCS_VCINDcog2.global;jiFCS_VCINDcog2.subid=FCS_VCINDcog2.subid;
jiFCS_VCINDcog3.he_LI=ji_he_VCINDcog3;jiFCS_VCINDcog3.intra_LI=ji_intra_VCINDcog3;jiFCS_VCINDcog3.inte=ji_inte_VCINDcog3;jiFCS_VCINDcog3.seg=ji_seg_VCINDcog3;jiFCS_VCINDcog3.homo=ji_homo_VCINDcog3;jiFCS_VCINDcog3.global=FCS_VCINDcog3.global;jiFCS_VCINDcog3.subid=FCS_VCINDcog3.subid;


VCINDji2_1.intra_LI=ji_difintra_VCIND2;VCINDji2_1.he_LI=ji_difhe_VCIND2;VCINDji2_1.inte=ji_difinte_VCIND2;VCINDji2_1.seg=ji_difseg_VCIND2;VCINDji2_1.homo=ji_difhomo_VCIND2;VCINDji2_1.subid=ID_V12;
VCINDji3_1.intra_LI=ji_difintra_VCIND3;VCINDji3_1.he_LI=ji_difhe_VCIND3;VCINDji3_1.inte=ji_difinte_VCIND3;VCINDji3_1.seg=ji_difseg_VCIND3;VCINDji3_1.homo=ji_difhomo_VCIND3;VCINDji3_1.subid=ID_V13;
VCINDcogji2_1.intra_LI=ji_difintra_VCINDcog2;VCINDcogji2_1.he_LI=ji_difhe_VCINDcog2;VCINDcogji2_1.inte=ji_difinte_VCINDcog2;VCINDcogji2_1.seg=ji_difseg_VCINDcog2;VCINDcogji2_1.homo=ji_difhomo_VCINDcog2;VCINDcogji2_1.subid=ID_C12;
VCINDcogji3_1.intra_LI=ji_difintra_VCINDcog3;VCINDcogji3_1.he_LI=ji_difhe_VCINDcog3;VCINDcogji3_1.inte=ji_difinte_VCINDcog3;VCINDcogji3_1.seg=ji_difseg_VCINDcog3;VCINDcogji3_1.homo=ji_difhomo_VCINDcog3;VCINDcogji3_1.subid=ID_C13;

%% step4.2 Interaction and Group effect
load('D:\paper\cognitive training\36P\FPN\Figure\behav141.mat');
datalist = { 'VCINDji2_1', 'VCINDji3_1';'VCINDcogji2_1','VCINDcogji3_1'};
filelist = [{'behav'};datalist(:) ];
%get the behavioural data and control varaibles 
n_parcel = 12;
treatment = [0,1];
time = [3,6];
df_behav = array2table(behav(:,1:8),'VariableNames',{'treatment', 'time', 'subid', 'sex', 'age', 'edu','fd','global'});
df_behav.treatment = categorical(df_behav.treatment);
% df_behav.time = categorical(df_behav.time);
df_behav.subid= categorical(df_behav.subid);
df_behav.sex = categorical(df_behav.sex);
df_data= df_behav;

% retrieve the y variables
y_vars = {'intra_LI', 'he_LI', 'inte', 'seg', 'homo'};
% y_vars = {'timescale'};
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
%         df_data1{:,'global'}=0;
        df_data1{:,'y'}=0;
        for x1 = 1:length(treatment) 
        for x2 = 1:length(time)
            Y = eval(['getfield(' datalist{x1,x2} ', y_var);']);
            cov_global = eval(['getfield(' datalist{x1,x2} ', ''global'');']);
            index = df_data1{:,'treatment'}==categorical(treatment(x1)) & df_data{:,'time'}==time(x2);
%             df_data1{index, 'global'}  = cov_global;
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

%% 4.3 LI_differencexbehavior/behav_diffrence--partial correlation
% difference of behav
behav_VCIND=behav(1:74,:);behav_VCINDcog=behav(75:end,:);
[ID_V12,isb_V12,IS_V12]=intersect(behav_VCIND(1:28,3),FCS_VCIND2.subid);[ID_V13,isb_V13,IS_V13]=intersect(behav_VCIND(1:28,3),FCS_VCIND3.subid);
[ID_C12,isb_C12,IS_C12]=intersect(behav_VCINDcog(1:28,3),FCS_VCINDcog2.subid);[ID_C13,isb_C13,IS_C13]=intersect(behav_VCINDcog(1:28,3),FCS_VCINDcog3.subid);
Behav_VCIND21=behav_VCIND(30:53,:)-behav_VCIND(isb_V12,:);Behav_VCIND31=behav_VCIND(54:74,:)-behav_VCIND(isb_V13,:);
Behav_VCINDcog21=behav_VCINDcog(30:52,:)-behav_VCINDcog(isb_C12,:);Behav_VCINDcog31=behav_VCINDcog(53:66,:)-behav_VCINDcog(isb_C13,:);

%%% MoCA
[rhe_VCIND12_MoCA,phe_VCIND12_MoCA]=partialcorr(VCINDji2_1.he_LI(:,7),behav(30:53,10),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[rhe_VCIND13_MoCA,phe_VCIND13_MoCA]=partialcorr(VCINDji3_1.he_LI(:,7),behav(54:74,10),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[rhe_VCINDcog12_MoCA,phe_VCINDcog12_MoCA]=partialcorr(VCINDcogji2_1.he_LI(:,7),behav(104:126,10),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[rhe_VCINDcog13_MoCA,phe_VCINDcog13_MoCA]=partialcorr(VCINDcogji3_1.he_LI(:,7),behav(127:end,10),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);


%%% TMT
[rhe_VCIND12_TMTA,phe_VCIND12_TMTA]=partialcorr(VCINDji2_1.he_LI(:,7),behav(30:53,17),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[rhe_VCIND12_TMTB,phe_VCIND12_TMTB]=partialcorr(VCINDji2_1.he_LI(:,7),behav(30:53,19),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[rhe_VCIND12_TMTBA,phe_VCIND12_TMTBA]=partialcorr(VCINDji2_1.he_LI(:,7),behav(30:53,27),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[rhe_VCIND13_TMTA,phe_VCIND13_TMTA]=partialcorr(VCINDji3_1.he_LI(:,7),behav(54:74,17),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[rhe_VCIND13_TMTB,phe_VCIND13_TMTB]=partialcorr(VCINDji3_1.he_LI(:,7),behav(54:74,19),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[rhe_VCIND13_TMTBA,phe_VCIND13_TMTBA]=partialcorr(VCINDji3_1.he_LI(:,7),behav(54:74,27),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);

[rhe_VCINDcog12_TMTA,phe_VCINDcog12_TMTA]=partialcorr(VCINDcogji2_1.he_LI(:,7),behav(104:126,17),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[rhe_VCINDcog12_TMTB,phe_VCINDcog12_TMTB]=partialcorr(VCINDcogji2_1.he_LI(:,7),behav(104:126,19),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[rhe_VCINDcog12_TMTBA,phe_VCINDcog12_TMTBA]=partialcorr(VCINDcogji2_1.he_LI(:,7),behav(104:126,27),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[rhe_VCINDcog13_TMTA,phe_VCINDcog13_TMTA]=partialcorr(VCINDcogji3_1.he_LI(:,7),behav(127:end,17),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[rhe_VCINDcog13_TMTB,phe_VCINDcog13_TMTB]=partialcorr(VCINDcogji3_1.he_LI(:,7),behav(127:end,19),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[rhe_VCINDcog13_TMTBA,phe_VCINDcog13_TMTBA]=partialcorr(VCINDcogji3_1.he_LI(:,7),behav(127:end,27),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);

%%% AVLT
[rhe_VCIND12_Imm,phe_VCIND12_Imm]=partialcorr(VCINDji2_1.he_LI(:,7),behav(30:53,22),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[rhe_VCIND12_Delay,phe_VCIND12_Delay]=partialcorr(VCINDji2_1.he_LI(:,7),behav(30:53,23),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[rhe_VCIND12_Recog,phe_VCIND12_Recog]=partialcorr(VCINDji2_1.he_LI(:,7),behav(30:53,24),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[rhe_VCIND13_Imm,phe_VCIND13_Imm]=partialcorr(VCINDji3_1.he_LI(:,7),behav(54:74,22),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[rhe_VCIND13_Delay,phe_VCIND13_Delay]=partialcorr(VCINDji3_1.he_LI(:,7),behav(54:74,23),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[rhe_VCIND13_Recog,phe_VCIND13_Recog]=partialcorr(VCINDji3_1.he_LI(:,7),behav(54:74,24),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);

[rhe_VCINDcog12_Imm,phe_VCINDcog12_Imm]=partialcorr(VCINDcogji2_1.he_LI(:,7),behav(104:126,22),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[rhe_VCINDcog12_Delay,phe_VCINDcog12_Delay]=partialcorr(VCINDcogji2_1.he_LI(:,7),behav(104:126,23),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[rhe_VCINDcog12_Recog,phe_VCINDcog12_Recog]=partialcorr(VCINDcogji2_1.he_LI(:,7),behav(104:126,24),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[rhe_VCINDcog13_Imm,phe_VCINDcog13_Imm]=partialcorr(VCINDcogji3_1.he_LI(:,7),behav(127:end,22),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[rhe_VCINDcog13_Delay,phe_VCINDcog13_Delay]=partialcorr(VCINDcogji3_1.he_LI(:,7),behav(127:end,23),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[rhe_VCINDcog13_Recog,phe_VCINDcog13_Recog]=partialcorr(VCINDcogji3_1.he_LI(:,7),behav(127:end,24),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);

%%% Control
[rhe_Control_TMTA,phe_Control_TMTA]=partialcorr(jiFCS_Control.he_LI(:,7),behav_Control(:,13),[behav_Control(:,2:5),jiFCS_Control.global]);
[rhe_Control_TMTB,phe_Control_TMTB]=partialcorr(jiFCS_Control.he_LI(:,7),behav_Control(:,15),[behav_Control(:,2:5),jiFCS_Control.global]);
[rhe_Control_TMTBA,phe_Control_TMTBA]=partialcorr(jiFCS_Control.he_LI(:,7),behav_Control(:,22),[behav_Control(:,2:5),jiFCS_Control.global]);
[rintra_Control_TMTA,pintra_Control_TMTA]=partialcorr(jiFCS_Control.intra_LI(:,7),behav_Control(:,13),[behav_Control(:,2:5),jiFCS_Control.global]);
[rintra_Control_TMTB,pintra_Control_TMTB]=partialcorr(jiFCS_Control.intra_LI(:,7),behav_Control(:,15),[behav_Control(:,2:5),jiFCS_Control.global]);
[rintra_Control_TMTBA,pintra_Control_TMTBA]=partialcorr(jiFCS_Control.intra_LI(:,7),behav_Control(:,22),[behav_Control(:,2:5),jiFCS_Control.global]);
[rhe_Control_Imm,phe_Control_Imm]=partialcorr(jiFCS_Control.he_LI(:,7),behav_Control(:,10),[behav_Control(:,2:5),jiFCS_Control.global]);
[rhe_Control_Delay,phe_Control_Delay]=partialcorr(jiFCS_Control.he_LI(:,7),behav_Control(:,18),[behav_Control(:,2:5),jiFCS_Control.global]);
[rhe_Control_Recog,phe_Control_Recog]=partialcorr(jiFCS_Control.he_LI(:,7),behav_Control(:,19),[behav_Control(:,2:5),jiFCS_Control.global]);
[rintra_Control_Imm,pintra_Control_Imm]=partialcorr(jiFCS_Control.intra_LI(:,7),behav_Control(:,10),[behav_Control(:,2:5),jiFCS_Control.global]);
[rintra_Control_Delay,pintra_Control_Delay]=partialcorr(jiFCS_Control.intra_LI(:,7),behav_Control(:,18),[behav_Control(:,2:5),jiFCS_Control.global]);
[rintra_Control_Recog,pintra_Control_Recog]=partialcorr(jiFCS_Control.intra_LI(:,7),behav_Control(:,19),[behav_Control(:,2:5),jiFCS_Control.global]);
[rhe_Control_Moca,phe_Control_Moca]=partialcorr(jiFCS_Control.he_LI(:,7),behav_Control(:,7),[behav_Control(:,2:5),jiFCS_Control.global]);
[rintra_Control_Moca,pintra_Control_Moca]=partialcorr(jiFCS_Control.intra_LI(:,7),behav_Control(:,7),[behav_Control(:,2:5),jiFCS_Control.global]);

[rhe_Control_TMTA,phe_Control_TMTA]=partialcorr(jiFCS_VCIND1.he_LI(:,7),behav(1:28,17),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rhe_Control_TMTB,phe_Control_TMTB]=partialcorr(jiFCS_VCIND1.he_LI(:,7),behav(1:28,19),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rhe_Control_TMTBA,phe_Control_TMTBA]=partialcorr(jiFCS_VCIND1.he_LI(:,7),behav(1:28,27),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rintra_Control_TMTA,pintra_Control_TMTA]=partialcorr(jiFCS_VCIND1.intra_LI(:,7),behav(1:28,17),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rintra_Control_TMTB,pintra_Control_TMTB]=partialcorr(jiFCS_VCIND1.intra_LI(:,7),behav(1:28,19),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rintra_Control_TMTBA,pintra_Control_TMTBA]=partialcorr(jiFCS_VCIND1.intra_LI(:,7),behav(1:28,27),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rhe_Control_Imm,phe_Control_Imm]=partialcorr(jiFCS_VCIND1.he_LI(:,7),behav(1:28,22),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rhe_Control_Delay,phe_Control_Delay]=partialcorr(jiFCS_VCIND1.he_LI(:,7),behav(1:28,23),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rhe_Control_Recog,phe_Control_Recog]=partialcorr(jiFCS_VCIND1.he_LI(:,7),behav(1:28,24),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rintra_Control_Imm,pintra_Control_Imm]=partialcorr(jiFCS_VCIND1.intra_LI(:,7),behav(1:28,22),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rintra_Control_Delay,pintra_Control_Delay]=partialcorr(jiFCS_VCIND1.intra_LI(:,7),behav(1:28,23),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rintra_Control_Recog,pintra_Control_Recog]=partialcorr(jiFCS_VCIND1.intra_LI(:,7),behav(1:28,24),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rhe_Control_Moca,phe_Control_Moca]=partialcorr(jiFCS_VCIND1.he_LI(:,7),behav(1:28,10),[behav(1:28,4:7),jiFCS_VCIND1.global]);
[rintra_Control_Moca,pintra_Control_Moca]=partialcorr(jiFCS_VCIND1.intra_LI(:,7),behav(1:28,10),[behav(1:28,4:7),jiFCS_VCIND1.global]);

[rhe_Control_TMTA,phe_Control_TMTA]=partialcorr(jiFCS_VCINDcog1.he_LI(:,7),behav(75:102,17),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rhe_Control_TMTB,phe_Control_TMTB]=partialcorr(jiFCS_VCINDcog1.he_LI(:,7),behav(75:102,19),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rhe_Control_TMTBA,phe_Control_TMTBA]=partialcorr(jiFCS_VCINDcog1.he_LI(:,7),behav(75:102,27),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rintra_Control_TMTA,pintra_Control_TMTA]=partialcorr(jiFCS_VCINDcog1.intra_LI(:,7),behav(75:102,17),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rintra_Control_TMTB,pintra_Control_TMTB]=partialcorr(jiFCS_VCINDcog1.intra_LI(:,7),behav(75:102,19),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rintra_Control_TMTBA,pintra_Control_TMTBA]=partialcorr(jiFCS_VCINDcog1.intra_LI(:,7),behav(75:102,27),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rhe_Control_Imm,phe_Control_Imm]=partialcorr(jiFCS_VCINDcog1.he_LI(:,7),behav(75:102,22),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rhe_Control_Delay,phe_Control_Delay]=partialcorr(jiFCS_VCINDcog1.he_LI(:,7),behav(75:102,23),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rhe_Control_Recog,phe_Control_Recog]=partialcorr(jiFCS_VCINDcog1.he_LI(:,7),behav(75:102,24),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rintra_Control_Imm,pintra_Control_Imm]=partialcorr(jiFCS_VCINDcog1.intra_LI(:,7),behav(75:102,22),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rintra_Control_Delay,pintra_Control_Delay]=partialcorr(jiFCS_VCINDcog1.intra_LI(:,7),behav(75:102,23),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rintra_Control_Recog,pintra_Control_Recog]=partialcorr(jiFCS_VCINDcog1.intra_LI(:,7),behav(75:102,24),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rhe_Control_Moca,phe_Control_Moca]=partialcorr(jiFCS_VCINDcog1.he_LI(:,7),behav(75:102,10),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
[rintra_Control_Moca,pintra_Control_Moca]=partialcorr(jiFCS_VCINDcog1.intra_LI(:,7),behav(75:102,10),[behav(75:102,4:7),jiFCS_VCINDcog1.global]);
%% 4.4 LI_difference/timescale_differencexbehavior/behav_diffrence--plot correlation linear model
%%% TMT
[TMTAxintra_VCIND2_adjusted]=plot_correlation('TMTAxdifintraVCIND2',VCINDji2_1.intra_LI,behav(30:53,17),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTAxhe_VCIND2_adjusted]=plot_correlation('TMTAxdifheVCIND2',VCINDji2_1.he_LI,behav(30:53,17),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTAxdisintra_VCIND2_adjusted]=plot_correlation('difTMTAxdifintraVCIND2',VCINDji2_1.intra_LI,Behav_VCIND21(:,17),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTAxdishe_VCIND2_adjusted]=plot_correlation('difTMTAxdifheVCIND2',VCINDji2_1.he_LI,Behav_VCIND21(:,17),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTAxintra_VCIND3_adjusted]=plot_correlation('TMTAxdifintraVCIND3',VCINDji3_1.intra_LI,behav(54:74,17),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTAxhe_VCIND3_adjusted]=plot_correlation('TMTAxdifheVCIND3',VCINDji3_1.he_LI,behav(54:74,17),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTAxdisintra_VCIND3_adjusted]=plot_correlation('difTMTAxdifintraVCIND3',VCINDji3_1.intra_LI,Behav_VCIND31(:,17),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTAxdishe_VCIND3_adjusted]=plot_correlation('difTMTAxdifheVCIND3',VCINDji3_1.he_LI,Behav_VCIND31(:,17),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTAxintra_VCINDcog2_adjusted]=plot_correlation('TMTAxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,behav(104:126,17),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTAxhe_VCINDcog2_adjusted]=plot_correlation('TMTAxdifheVCINDcog2',VCINDcogji2_1.he_LI,behav(104:126,17),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTAxdisintra_VCINDcog2_adjusted]=plot_correlation('difTMTAxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,Behav_VCINDcog21(:,17),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTAxdishe_VCINDcog2_adjusted]=plot_correlation('difTMTAxdifheVCINDcog2',VCINDcogji2_1.he_LI,Behav_VCINDcog21(:,17),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTAxintra_VCINDcog3_adjusted]=plot_correlation('TMTAxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,behav(127:end,17),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[TMTAxhe_VCINDcog3_adjusted]=plot_correlation('TMTAxdifheVCINDcog3',VCINDcogji3_1.he_LI,behav(127:end,17),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[TMTAxdisintra_VCINDcog3_adjusted]=plot_correlation('difTMTAxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,Behav_VCINDcog31(:,17),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[TMTAxdishe_VCINDcog3_adjusted]=plot_correlation('difTMTAxdifheVCINDcog3',VCINDcogji3_1.he_LI,Behav_VCINDcog31(:,17),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);

[TMTBxintra_VCIND2_adjusted]=plot_correlation('TMTBxdifintraVCIND2',VCINDji2_1.intra_LI,behav(30:53,19),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTBxhe_VCIND2_adjusted]=plot_correlation('TMTBxdifheVCIND2',VCINDji2_1.he_LI,behav(30:53,19),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTBxdisintra_VCIND2_adjusted]=plot_correlation('difTMTBxdifintraVCIND2',VCINDji2_1.intra_LI,Behav_VCIND21(:,19),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTBxdishe_VCIND2_adjusted]=plot_correlation('difTMTBxdifheVCIND2',VCINDji2_1.he_LI,Behav_VCIND21(:,19),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTBxintra_VCIND3_adjusted]=plot_correlation('TMTBxdifintraVCIND3',VCINDji3_1.intra_LI,behav(54:74,19),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTBxhe_VCIND3_adjusted]=plot_correlation('TMTBxdifheVCIND3',VCINDji3_1.he_LI,behav(54:74,19),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTBxdisintra_VCIND3_adjusted]=plot_correlation('difTMTBxdifintraVCIND3',VCINDji3_1.intra_LI,Behav_VCIND31(:,19),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTBxdishe_VCIND3_adjusted]=plot_correlation('difTMTBxdifheVCIND3',VCINDji3_1.he_LI,Behav_VCIND31(:,19),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTBxintra_VCINDcog2_adjusted]=plot_correlation('TMTBxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,behav(104:126,19),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTBxhe_VCINDcog2_adjusted]=plot_correlation('TMTBxdifheVCINDcog2',VCINDcogji2_1.he_LI,behav(104:126,19),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTBxdisintra_VCINDcog2_adjusted]=plot_correlation('difTMTBxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,Behav_VCINDcog21(:,19),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTBxdishe_VCINDcog2_adjusted]=plot_correlation('difTMTBxdifheVCINDcog2',VCINDcogji2_1.he_LI,Behav_VCINDcog21(:,19),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTBxintra_VCINDcog3_adjusted]=plot_correlation('TMTBxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,behav(127:end,19),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[TMTBxhe_VCINDcog3_adjusted]=plot_correlation('TMTBxdifheVCINDcog3',VCINDcogji3_1.he_LI,behav(127:end,19),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[TMTBxdisintra_VCINDcog3_adjusted]=plot_correlation('difTMTBxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,Behav_VCINDcog31(:,19),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[TMTBxdishe_VCINDcog3_adjusted]=plot_correlation('difTMTBxdifheVCINDcog3',VCINDcogji3_1.he_LI,Behav_VCINDcog31(:,19),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);

[TMTBAxintra_VCIND2_adjusted]=plot_correlation('TMTBAxdifintraVCIND2',VCINDji2_1.intra_LI,behav(30:53,27),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTBAxhe_VCIND2_adjusted]=plot_correlation('TMTBAxdifheVCIND2',VCINDji2_1.he_LI,behav(30:53,27),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTBAxdisintra_VCIND2_adjusted]=plot_correlation('difTMTBAxdifintraVCIND2',VCINDji2_1.intra_LI,Behav_VCIND21(:,27),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTBAxdishe_VCIND2_adjusted]=plot_correlation('difTMTBAxdifheVCIND2',VCINDji2_1.he_LI,Behav_VCIND21(:,27),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[TMTBAxintra_VCIND3_adjusted]=plot_correlation('TMTBAxdifintraVCIND3',VCINDji3_1.intra_LI,behav(54:74,27),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTBAxhe_VCIND3_adjusted]=plot_correlation('TMTBAxdifheVCIND3',VCINDji3_1.he_LI,behav(54:74,27),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTBAxdisintra_VCIND3_adjusted]=plot_correlation('difTMTBAxdifintraVCIND3',VCINDji3_1.intra_LI,Behav_VCIND31(:,27),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTBAxdishe_VCIND3_adjusted]=plot_correlation('difTMTBAxdifheVCIND3',VCINDji3_1.he_LI,Behav_VCIND31(:,27),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[TMTBAxintra_VCINDcog2_adjusted]=plot_correlation('TMTBAxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,behav(104:126,27),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTBAxhe_VCINDcog2_adjusted]=plot_correlation('TMTBAxdifheVCINDcog2',VCINDcogji2_1.he_LI,behav(104:126,27),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTBAxdisintra_VCINDcog2_adjusted]=plot_correlation('difTMTBAxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,Behav_VCINDcog21(:,27),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTBAxdishe_VCINDcog2_adjusted]=plot_correlation('difTMTBAxdifheVCINDcog2',VCINDcogji2_1.he_LI,Behav_VCINDcog21(:,27),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[TMTBAxintra_VCINDcog3_adjusted]=plot_correlation('TMTBAxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,behav(127:end,27),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[TMTBAxhe_VCINDcog3_adjusted]=plot_correlation('TMTBAxdifheVCINDcog3',VCINDcogji3_1.he_LI,behav(127:end,27),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[TMTBAxdisintra_VCINDcog3_adjusted]=plot_correlation('difTMTBAxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,Behav_VCINDcog31(:,27),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[TMTBAxdishe_VCINDcog3_adjusted]=plot_correlation('difTMTBAxdifheVCINDcog3',VCINDcogji3_1.he_LI,Behav_VCINDcog31(:,27),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);

%%%AVLT
[Immxintra_VCIND2_adjusted]=plot_correlation('ImmxdifintraVCIND2',VCINDji2_1.intra_LI,behav(30:53,22),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Immxhe_VCIND2_adjusted]=plot_correlation('ImmxdifheVCIND2',VCINDji2_1.he_LI,behav(30:53,22),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Immxdisintra_VCIND2_adjusted]=plot_correlation('difImmxdifintraVCIND2',VCINDji2_1.intra_LI,Behav_VCIND21(:,22),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Immxdishe_VCIND2_adjusted]=plot_correlation('difImmxdifheVCIND2',VCINDji2_1.he_LI,Behav_VCIND21(:,22),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Immxintra_VCIND3_adjusted]=plot_correlation('ImmxdifintraVCIND3',VCINDji3_1.intra_LI,behav(54:74,22),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Immxhe_VCIND3_adjusted]=plot_correlation('ImmxdifheVCIND3',VCINDji3_1.he_LI,behav(54:74,22),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Immxdisintra_VCIND3_adjusted]=plot_correlation('difImmxdifintraVCIND3',VCINDji3_1.intra_LI,Behav_VCIND31(:,22),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Immxdishe_VCIND3_adjusted]=plot_correlation('difImmxdifheVCIND3',VCINDji3_1.he_LI,Behav_VCIND31(:,22),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Immxintra_VCINDcog2_adjusted]=plot_correlation('ImmxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,behav(104:126,22),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Immxhe_VCINDcog2_adjusted]=plot_correlation('ImmxdifheVCINDcog2',VCINDcogji2_1.he_LI,behav(104:126,22),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Immxdisintra_VCINDcog2_adjusted]=plot_correlation('difImmxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,Behav_VCINDcog21(:,22),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Immxdishe_VCINDcog2_adjusted]=plot_correlation('difImmxdifheVCINDcog2',VCINDcogji2_1.he_LI,Behav_VCINDcog21(:,22),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Immxintra_VCINDcog3_adjusted]=plot_correlation('ImmxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,behav(127:end,22),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[Immxhe_VCINDcog3_adjusted]=plot_correlation('ImmxdifheVCINDcog3',VCINDcogji3_1.he_LI,behav(127:end,22),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[Immxdisintra_VCINDcog3_adjusted]=plot_correlation('difImmxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,Behav_VCINDcog31(:,22),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[Immxdishe_VCINDcog3_adjusted]=plot_correlation('difImmxdifheVCINDcog3',VCINDcogji3_1.he_LI,Behav_VCINDcog31(:,22),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);

[Delayxintra_VCIND2_adjusted]=plot_correlation('DelayxdifintraVCIND2',VCINDji2_1.intra_LI,behav(30:53,23),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Delayxhe_VCIND2_adjusted]=plot_correlation('DelayxdifheVCIND2',VCINDji2_1.he_LI,behav(30:53,23),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Delayxdisintra_VCIND2_adjusted]=plot_correlation('difDelayxdifintraVCIND2',VCINDji2_1.intra_LI,Behav_VCIND21(:,23),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Delayxdishe_VCIND2_adjusted]=plot_correlation('difDelayxdifheVCIND2',VCINDji2_1.he_LI,Behav_VCIND21(:,23),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Delayxintra_VCIND3_adjusted]=plot_correlation('DelayxdifintraVCIND3',VCINDji3_1.intra_LI,behav(54:74,23),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Delayxhe_VCIND3_adjusted]=plot_correlation('DelayxdifheVCIND3',VCINDji3_1.he_LI,behav(54:74,23),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Delayxdisintra_VCIND3_adjusted]=plot_correlation('difDelayxdifintraVCIND3',VCINDji3_1.intra_LI,Behav_VCIND31(:,23),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Delayxdishe_VCIND3_adjusted]=plot_correlation('difDelayxdifheVCIND3',VCINDji3_1.he_LI,Behav_VCIND31(:,23),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Delayxintra_VCINDcog2_adjusted]=plot_correlation('DelayxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,behav(104:126,23),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Delayxhe_VCINDcog2_adjusted]=plot_correlation('DelayxdifheVCINDcog2',VCINDcogji2_1.he_LI,behav(104:126,23),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Delayxdisintra_VCINDcog2_adjusted]=plot_correlation('difDelayxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,Behav_VCINDcog21(:,23),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Delayxdishe_VCINDcog2_adjusted]=plot_correlation('difDelayxdifheVCINDcog2',VCINDcogji2_1.he_LI,Behav_VCINDcog21(:,23),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Delayxintra_VCINDcog3_adjusted]=plot_correlation('DelayxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,behav(127:end,23),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[Delayxhe_VCINDcog3_adjusted]=plot_correlation('DelayxdifheVCINDcog3',VCINDcogji3_1.he_LI,behav(127:end,23),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[Delayxdisintra_VCINDcog3_adjusted]=plot_correlation('difDelayxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,Behav_VCINDcog31(:,23),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[Delayxdishe_VCINDcog3_adjusted]=plot_correlation('difDelayxdifheVCINDcog3',VCINDcogji3_1.he_LI,Behav_VCINDcog31(:,23),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);

[Recogxintra_VCIND2_adjusted]=plot_correlation('RecogxdifintraVCIND2',VCINDji2_1.intra_LI,behav(30:53,24),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Recogxhe_VCIND2_adjusted]=plot_correlation('RecogxdifheVCIND2',VCINDji2_1.he_LI,behav(30:53,24),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Recogxdisintra_VCIND2_adjusted]=plot_correlation('difRecogxdifintraVCIND2',VCINDji2_1.intra_LI,Behav_VCIND21(:,24),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Recogxdishe_VCIND2_adjusted]=plot_correlation('difRecogxdifheVCIND2',VCINDji2_1.he_LI,Behav_VCIND21(:,24),[behav(30:53,4:7),FCS_VCIND2.global(2:end)]);
[Recogxintra_VCIND3_adjusted]=plot_correlation('RecogxdifintraVCIND3',VCINDji3_1.intra_LI,behav(54:74,24),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Recogxhe_VCIND3_adjusted]=plot_correlation('RecogxdifheVCIND3',VCINDji3_1.he_LI,behav(54:74,24),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Recogxdisintra_VCIND3_adjusted]=plot_correlation('difRecogxdifintraVCIND3',VCINDji3_1.intra_LI,Behav_VCIND31(:,24),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Recogxdishe_VCIND3_adjusted]=plot_correlation('difRecogxdifheVCIND3',VCINDji3_1.he_LI,Behav_VCIND31(:,24),[behav(54:74,4:7),FCS_VCIND3.global(1:end)]);
[Recogxintra_VCINDcog2_adjusted]=plot_correlation('RecogxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,behav(104:126,24),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Recogxhe_VCINDcog2_adjusted]=plot_correlation('RecogxdifheVCINDcog2',VCINDcogji2_1.he_LI,behav(104:126,24),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Recogxdisintra_VCINDcog2_adjusted]=plot_correlation('difRecogxdifintraVCINDcog2',VCINDcogji2_1.intra_LI,Behav_VCINDcog21(:,24),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Recogxdishe_VCINDcog2_adjusted]=plot_correlation('difRecogxdifheVCINDcog2',VCINDcogji2_1.he_LI,Behav_VCINDcog21(:,24),[behav(104:126,4:7),FCS_VCINDcog2.global(2:end)]);
[Recogxintra_VCINDcog3_adjusted]=plot_correlation('RecogxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,behav(127:end,24),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[Recogxhe_VCINDcog3_adjusted]=plot_correlation('RecogxdifheVCINDcog3',VCINDcogji3_1.he_LI,behav(127:end,24),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[Recogxdisintra_VCINDcog3_adjusted]=plot_correlation('difRecogxdifintraVCINDcog3',VCINDcogji3_1.intra_LI,Behav_VCINDcog31(:,24),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
[Recogxdishe_VCINDcog3_adjusted]=plot_correlation('difRecogxdifheVCINDcog3',VCINDcogji3_1.he_LI,Behav_VCINDcog31(:,24),[behav(127:end,4:7),FCS_VCINDcog3.global(1:end)]);
