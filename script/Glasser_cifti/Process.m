clear;clc;

% NGR-scrubbing/cifti
Glasser_NGR_om1=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/om1/*.mat');
Glasser_NGR_onm1=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/onm1/*.mat');
Glasser_NGR_ynm1=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/ynm1/*.mat');
Glasser_NGR_om2=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/om2/*.mat');
Glasser_NGR_onm2=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/onm2/*.mat');
Glasser_NGR_ynm2=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/ynm2/*.mat');
Glasser_NGR_ym1=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/ym1/*.mat');
Glasser_NGR_ym2=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/ym2/*.mat');
Glasser_NGR_all=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/All_use/*.mat');

FCS_om1=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_om1,[]);
FCS_onm1=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_onm1,[]);
FCS_ynm1=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_ynm1,[]);
FCS_om2=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_om2,[]);
FCS_onm2=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_onm2,[]);
FCS_ynm2=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_ynm2,[]);
FCS_ym1=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_ym1,[]);
FCS_ym2=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_ym2,[]);
FCS_all=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_all,[]);

Glasser_NGR_m=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/M/*.mat');
Glasser_NGR_nm=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/NM/*.mat');
Glasser_NGR_o=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/O/*.mat');
Glasser_NGR_y=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Y/*.mat');

FCS_m=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_m,[]);
FCS_nm=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_nm,[]);
FCS_o=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_o,[]);
FCS_y=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_y,[]);

%%%NGR-despike
Glasser_NGR_om1=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/despike/OM/*.mat');
Glasser_NGR_onm1=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/despike/ONM/*.mat');
Glasser_NGR_ynm1=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/despike/YNM/*.mat');
Glasser_NGR_ym=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/despike/YM/*.mat');
Glasser_NGR_all=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/despike/All/*.mat');

FCS_om=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_om1,[]);
FCS_onm=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_onm1,[]);
FCS_ynm=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_ynm1,[]);
FCS_ym=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_ym,[]);
FCS_all=getFCS(['/data1/Public/jxhu/results/AICHA/NGR'],1,[],Glasser_NGR_all,[]);

% Part1 baseline
filepath=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/baseline/*/');
genbaselinemap(FCS_om,FCS_om.subid,filepath,'OM');
genbaselinemap(FCS_onm,FCS_onm.subid,filepath,'ONM');
genbaselinemap(FCS_ynm,FCS_ynm.subid,filepath,'YNM');
genbaselinemap(FCS_ym,FCS_ym.subid,filepath,'YM');

filepath=g_ls('/data1/Public/jxhu/results/musician/AICHA/GR/Baseline/*/');
genbaselinemap(FCS_om,FCS_om.subid,filepath,'OM');
genbaselinemap(FCS_onm,FCS_onm.subid,filepath,'ONM');
genbaselinemap(FCS_ynm,FCS_ynm.subid,filepath,'YNM');
genbaselinemap(FCS_ym,FCS_ym.subid,filepath,'YM');
% genbaselinemap(FCS_all,FCS_ym.subid,filepath,'All');
% filesppath=g_ls('/data/newjiao/Sharefolder/Results/article_results/AICHA/NGR/Negative_value_unremoved/Baseline/SpecialCheck/*/');
% genbaselinemap(FCS_Rstate1,ID_rest_task,filesppath,'Rstate1_')
% genbaselinemap(FCS_Rstate2,ID_rest_task,filesppath,'Rstate2_')
% genbaselinemap(FCS_TstateALL,ID_rest_task,filesppath,'Tstateall_')

% fileCVpath=g_ls('/data/stalxy/Pipeline4JIN/ResultsRe/Baseline/CVpics/*/');
% genbaselinemap(FCS_Rstate1,ID.ID_rest_task,fileCVpath,'Rstate1_')
% genbaselinemap(FCS_Rstate2,ID.ID_rest_task,fileCVpath,'Rstate2_')
% genbaselinemap(FCS_TstateALL,ID.ID_rest_task,fileCVpath,'Tstateall_')
SysDiv2Plot('Lobe',[-50,50],'YNM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ynm.inte);
SysDiv2Plot('Lobe',[-50,50],'YM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ym.inte);
SysDiv2Plot('Lobe',[-50,50],'ONM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_onm.inte);
SysDiv2Plot('Lobe',[-50,50],'OM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_om.inte);
SysDiv2Plot('Hierarchy',[-60,60],'YNM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ynm.inte);
SysDiv2Plot('Hierarchy',[-60,60],'YM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ym.inte);
SysDiv2Plot('Hierarchy',[-60,60],'ONM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_onm.inte);
SysDiv2Plot('Hierarchy',[-60,60],'OM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_om.inte);
SysDiv2Plot('Yeo7',[-50,50],'YNM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ynm.inte);
SysDiv2Plot('Yeo7',[-50,50],'YM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ym.inte);
SysDiv2Plot('Yeo7',[-50,50],'ONM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_onm.inte);
SysDiv2Plot('Yeo7',[-50,50],'OM_inte','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_om.inte);
SysDiv2Plot('Lobe',[-35,35],'YNM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ynm.seg);
SysDiv2Plot('Lobe',[-35,35],'YM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ym.seg);
SysDiv2Plot('Lobe',[-35,35],'ONM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_onm.seg);
SysDiv2Plot('Lobe',[-35,35],'OM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_om.seg);
SysDiv2Plot('Hierarchy',[-30,30],'YNM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ynm.seg);
SysDiv2Plot('Hierarchy',[-30,30],'YM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ym.seg);
SysDiv2Plot('Hierarchy',[-30,30],'ONM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_onm.seg);
SysDiv2Plot('Hierarchy',[-30,30],'OM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_om.seg);
SysDiv2Plot('Yeo7',[-30,30],'YNM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ynm.seg);
SysDiv2Plot('Yeo7',[-30,30],'YM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_ym.seg);
SysDiv2Plot('Yeo7',[-30,30],'ONM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_onm.seg);
SysDiv2Plot('Yeo7',[-30,30],'OM_seg','/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/violin',FCS_om.seg);

filecorrpath=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/LRCP/*/');
[OM_HxI_Rmap,OM_HxI_Rsub]=gencpLRmap(FCS_om,FCS_om.subid,[],filecorrpath{1},'OM',[-5,5],[-0.6,0.6])
[ONM_HxI_Rmap,ONM_HxI_Rsub]=gencpLRmap(FCS_onm,FCS_onm.subid,[],filecorrpath{2},'ONM',[-5,5],[-0.6,0.6])
[YM_HxI_Rmap,YM_HxI_Rsub]=gencpLRmap(FCS_ym,FCS_ym.subid,[],filecorrpath{3},'YM',[-5,5],[-0.6,0.6])
[YNM_HxI_Rmap,YNM_HxI_Rsub]=gencpLRmap(FCS_ynm,FCS_ynm.subid,[],filecorrpath{4},'YNM',[-4,4],[-0.6,0.6])

% Part3 compare between STATES
filecppath=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/groupCP/*/');
gencpmap(FCS_om,FCS_ym,[],filecppath{2},'OMvYM',[-5,5],[-5,5],[0,0.6])
gencpmap(FCS_om,FCS_onm,[],filecppath{1},'OMvONM',[-5,5],[-5,5],[0,0.6])
gencpmap(FCS_ym,FCS_ynm,[],filecppath{4},'YMvYNM',[-5,5],[-5,5],[0,0.6])
gencpmap(FCS_onm,FCS_ynm,[],filecppath{3},'ONMvYNM',[-5,5],[-5,5],[0,0.6])

SaveAsNii(inte_OMONM',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['inte_OMONM' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','inte_OMONM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-8,8]);
SaveAsNii(inte_OMYM',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['inte_OMYM' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','inte_OMYM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-8,8]);
SaveAsNii(inte_ONMYNM',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['inte_ONMYNM' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','inte_ONMYNM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-8,8]);
SaveAsNii(inte_YMYNM',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['inte_YMYNM' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','inte_YMYNM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-8,8]);
SaveAsNii(seg_OMONM',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['seg_OMONM' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','seg_OMONM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-8,8]);
SaveAsNii(seg_OMYM',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['seg_OMYM' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','seg_OMYM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-8,8]);
SaveAsNii(seg_ONMYNM',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['seg_ONMYNM' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','seg_ONMYNM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-8,8]);
SaveAsNii(seg_YMYNM',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['seg_YMYNM' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','seg_YMYNM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-8,8]);
% gencpmap(FCS_om,FCS_ynm,[],filecppath{3},'OMvYNM',[-4,4],[-4,4],[0,0.6])
% gencpmap(FCS_onm,FCS_ym,[],filecppath{4},'ONMvYM',[-4,4],[-4,4],[0,0.6])

% Part4 relation of HomoxIntra within each STATE

filecorrpath=g_ls('/data1/Public/jxhu/results/musician/AICHA/NGR/scrubbing_remove/CorrinGroup/*/');
[OM_HxI_Rmap,OM_HxI_Rsub]=gencorrmap(FCS_om,FCS_om.subid,HCP_behav(:,2:3),filecorrpath{1},'OM',[-20,20],[-0.6,0.6])
[ONM_HxI_Rmap,ONM_HxI_Rsub]=gencorrmap(FCS_onm,FCS_onm.subid,HCP_behav(:,2:3),filecorrpath{2},'ONM',[-20,20],[-0.6,0.6])
[YM_HxI_Rmap,YM_HxI_Rsub]=gencorrmap(FCS_ym,FCS_ym.subid,HCP_behav(:,2:3),filecorrpath{3},'YM',[-20,20],[-0.6,0.6])
[YNM_HxI_Rmap,YNM_HxI_Rsub]=gencorrmap(FCS_ynm,FCS_ynm.subid,HCP_behav(:,2:3),filecorrpath{3},'YNM',[-20,20],[-0.6,0.6])

% relation with task

load('/data1/Public/jxhu/results/musician/behavior_scores.mat');load('/data1/Public/jxhu/results/musician/SINsyllable4group.mat');load('/data1/Public/jxhu/results/musician/SINphrase4group.mat');load('/data1/Public/jxhu/results/musician/cognitiveability.mat');
[ID,is, iS]=intersect(behav(:,5),FCS_all.subid);
[C,is_c,iS_c]=intersect(cognitiveability(:,1),FCS_all.subid);WM=cognitiveability(is_c,7);Stroop_jian=cognitiveability(is_c,11);Stroop_chu=cognitiveability(is_c,10);
filecorrpath=g_ls('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/corrinGroup/*/');
[All_HxI_Rmap,All_HxI_Rsub]=corrmap(FCS_all,behav(:,5),[behav(is,2),behav(is,4),behav(is,6),behav(is,11),WM,Stroop_jian],filecorrpath{1},'All',[-20,20],[-0.3,0.3])
[ONM_HxI_Rmap,ONM_HxI_Rsub]=corrmap(FCS_onm,behav(:,5),behav(1:24,6:7),filecorrpath{1},'ONM',[-20,20],[-0.5,0.5])
[OM_HxI_Rmap,OM_HxI_Rsub]=corrmap(FCS_om,behav(:,5),behav(25:48,6:7),filecorrpath{1},'OM',[-20,20],[-0.5,0.5])
[YNM_HxI_Rmap,YNM_HxI_Rsub]=corrmap(FCS_ynm,behav(:,5),behav(49:72,6:7),filecorrpath{1},'YNM',[-20,20],[-0.5,0.5])
[YM_HxI_Rmap,YM_HxI_Rsub]=corrmap(FCS_ym,behav(:,5),behav(73:96,6:7),filecorrpath{1},'YM',[-20,20],[-0.5,0.5])

[C_o,is_o,iS_o]=intersect(behav(:,5),FCS_o.subid);[C_y,is_y,iS_y]=intersect(behav(:,5),FCS_y.subid);[C_m,is_m,iS_m]=intersect(behav(:,5),FCS_om.subid);[C_nm,is_nm,iS_nm]=intersect(behav(:,5),FCS_onm.subid);
[C_o,is_oc,iS_oc]=intersect(cognitiveability(:,1),FCS_o.subid);WM_old=cognitiveability(is_oc,7);Stroop_jian_old=cognitiveability(is_oc,11);Stroop_chu_old=cognitiveability(is_oc,10);
[Old_HxI_Rmap,Old_HxI_Rsub]=corrmap(FCS_o,behav(:,5),[behav(is_o,4),behav(is_o,6),behav(is_o,11),WM_old,Stroop_jian_old],filecorrpath{2},'Old',[-20,20],[-0.3,0.3])
[C_y,is_yc,iS_yc]=intersect(cognitiveability(:,1),FCS_y.subid);WM_young=cognitiveability(is_yc,7);Stroop_jian_young=cognitiveability(is_yc,11);Stroop_chu_young=cognitiveability(is_yc,10);
[Young_HxI_Rmap,Young_HxI_Rsub]=corrmap(FCS_y,behav(:,5),[behav(is_y,4),behav(is_y,6),behav(is_y,11),WM_young,Stroop_jian_young],filecorrpath{2},'Young',[-20,20],[-0.3,0.3])
[C_m,is_mc,iS_mc]=intersect(cognitiveability(:,1),FCS_om.subid);WM_music=cognitiveability(is_mc,7);Stroop_jian_music=cognitiveability(is_mc,11);Stroop_chu_music=cognitiveability(is_mc,10);
[Musician_HxI_Rmap,Musician_HxI_Rsub]=corrmap(FCS_om,behav(:,5),[behav(is_m,7),behav(is_m,6),behav(is_m,11),WM_music,Stroop_jian_music],filecorrpath{2},'Musician',[-20,20],[-0.3,0.3])
[C_nm,is_nmc,iS_nmc]=intersect(cognitiveability(:,1),FCS_onm.subid);WM_nmusic=cognitiveability(is_nmc,7);Stroop_jian_nmusic=cognitiveability(is_nmc,11);Stroop_chu_nmusic=cognitiveability(is_nmc,10);
[NMusician_HxI_Rmap,NMusician_HxI_Rsub]=corrmap(FCS_onm,behav(:,5),[behav(is_nm,7),behav(is_nm,6),behav(is_nm,11),WM_nmusic,Stroop_jian_nmusic],filecorrpath{2},'NMusician',[-20,20],[-0.3,0.3])
% relation with music training
[C_m,is_m,iS_m]=intersect(behav(:,5),FCS_m.subid);[C_om,is_om,iS_om]=intersect(behav(:,5),FCS_om.subid);[C_ym,is_ym,iS_ym]=intersect(behav(:,5),FCS_ym.subid);
[M_HxI_Rmap,M_HxI_Rsub]=music_corrmap(FCS_m,behav(:,5),[behav(is_m,2),behav(is_m,6),behav(is_m,11)],filecorrpath{3},'M',[-20,20],[-0.5,0.5])
[C_om,is_om,iS_om]=intersect(behav(:,5),FCS_om.subid);[C_ym,is_ym,iS_ym]=intersect(behav(:,5),FCS_ym.subid);
[OM_HxI_Rmap,OM_HxI_Rsub]=music_corrmap(FCS_om,behav(:,5),[behav(is_om,6),behav(is_om,11)],filecorrpath{3},'OM',[-20,20],[-0.5,0.5])
[YM_HxI_Rmap,YM_HxI_Rsub]=music_corrmap(FCS_ym,behav(:,5),[behav(is_ym,6),behav(is_ym,11)],filecorrpath{3},'YM',[-20,20],[-0.5,0.5])


% Part4 compare relations of HomoxIntra across STATES

filecorrpath=g_ls('/data/newjiao/Sharefolder/Results/article_results/AICHA/GR/HCP/StateCorrCP/*/');
gencocpmap(OM_HxI_Rmap,OM_HxI_Rsub,ONM_HxI_Rmap,ONM_HxI_Rsub,filecorrpath{1},'R1vR2',[-5,5])
gencocpmap(OM_HxI_Rmap,OM_HxI_Rsub,YM_HxI_Rmap,YM_HxI_Rsub,filecorrpath{2},'R1vTall',[-5,5])
gencocpmap(ONM_HxI_Rmap,ONM_HxI_Rsub,YM_HxI_Rmap,YM_HxI_Rsub,filecorrpath{3},'R2vTall',[-5,5])


% Part5 heritability and its relation 
hefp_R1=g_ls('/data/newjiao/Sharefolder/Results/article_results/AICHA/NGR/HCP/Heritability/rest1*');
hefp_R2=g_ls('/data/newjiao/Sharefolder/Results/article_results/AICHA/NGR/HCP/Heritability/rest2*');
hefp_Task=g_ls('/data/newjiao/Sharefolder/Results/article_results/AICHA/NGR/HCP/Heritability/task*');
hefp_Delta=g_ls('/data/newjiao/Sharefolder/Results/article_results/AICHA/NGR/HCP/Heritability/task_rest*');
filehepath=g_ls('/data/newjiao/Sharefolder/Results/article_results/AICHA/NGR/HCP/Heritability/*/');

genbasexhe([],[],filehepath{1},'Rstate1',hefp_R1)
genbasexhe(FCS_Rstate2,ID.ID_rest_task,filehepath{2},'Rstate2',hefp_R2)
genbasexhe([],[],filehepath{3},'Tstate',hefp_Task)
genbasexhe(finalFCS,ID.ID_rest_task,filehepath{1},'TvsR',hefp_Delta)

rest1LR=g_ls('/data/newjiao/Sharefolder/Results/Regress_Filter/LR/AICHA/rfMRI1_GR/FC_Z/*.txt');
rest1RL=g_ls('/data/newjiao/Sharefolder/Results/Regress_Filter/RL/AICHA/rfMRI1_GR/FC_Z/*.txt');
rest2LR=g_ls('/data/newjiao/Sharefolder/Results/Regress_Filter/LR/AICHA/rfMRI2_GR/FC_Z/*.txt');
rest2RL=g_ls('/data/newjiao/Sharefolder/Results/Regress_Filter/RL/AICHA/rfMRI2_GR/FC_Z/*.txt');
taskallLR=g_ls('/data/newjiao/Sharefolder/Results/task/LR/AICHA/all_task/GR/FC_Z/*.txt');
taskallRL=g_ls('/data/newjiao/Sharefolder/Results/task/RL/AICHA/all_task/GR/FC_Z/*.txt');
tFCSrmrs('/data/stalxy/Pipeline4JIN/ResultsRe/TallcpRest1',0,ID.ID_rest_task,taskallLR,taskallRL,rest1LR,rest1RL)
tFCSrmrs('/data/stalxy/Pipeline4JIN/ResultsRe/TallcpRest2',0,ID.ID_rest_task,taskallLR,taskallRL,rest2LR,rest2RL)



% 
TsR1=load('TallcpRest1.mat');
TsR2=load('TallcpRest2.mat');
sufilepath=g_ls('/data/stalxy/Pipeline4JIN/ResultsRe/SUBaseline/*/');
genbaselinemap(TsR1.finalFCS,ID.ID_rest_task,sufilepath,'Taskall-Rstate1_')
genbaselinemap(TsR2.finalFCS,ID.ID_rest_task,sufilepath,'Taskall-Rstate2_')