function gencpmap(FCS1,FCS2,subid,statspath,statename,cba,cbb,cbc)
% compare between STATES
figflag=1;

%% Group mean - Across subject
% 
% [~,~,iS1]=intersect(subid,FCS1.subid);
% [~,~,iS2]=intersect(subid,FCS2.subid);
he1=FCS1.he;
intra1=FCS1.intra;
inte1=FCS1.inte;
seg1=FCS1.seg;
he2=FCS2.he;
intra2=FCS2.intra;
inte2=FCS2.inte;
seg2=FCS2.seg;

% LI_intra_abs1=FCS1.intra_absLI;
% LI_he_abs1=FCS1.he_absLI;ho_FC1=FCS1.homo;
% intra_LL1=FCS1.intra_LL;
% intra_RR1=FCS1.intra_RR;
% he_LR1=FCS1.he_LR;
% he_RL1=FCS1.he_RL;
% inte_L1=FCS1.inteL;
% inte_R1=FCS1.inteR;
% seg_L1=FCS1.segL;
% seg_R1=FCS1.segR;

LI_intra_mean1=mean(intra1)';
LI_he_mean1=mean(he1)';
Inte_mean1=mean(inte1)';
Seg_mean1=mean(seg1)';
LI_intra_mean2=mean(intra2)';
LI_he_mean2=mean(he2)';
Inte_mean2=mean(inte2)';
Seg_mean2=mean(seg2)';
% IntraLL_mean1=mean(intra_LL1)';
% IntraRR_mean1=mean(intra_RR1)';
% HeLR_mean1=mean(he_LR1)';
% HeRL_mean1=mean(he_RL1)';
% HomoFC_mean1=mean(ho_FC1)';
% absLI_intra_mean1=mean(LI_intra_abs1)';
% absLI_he_mean1=mean(LI_he_abs1)';    
% InteL_mean1=mean(inte_L1)';
% InteR_mean1=mean(inte_R1)';
% SegL_mean1=mean(seg_L1)';
% SegR_mean1=mean(seg_R1)';


% ho_FC2=FCS2.homo;
% intra_LL2=FCS2.intra_LL;
% intra_RR2=FCS2.intra_RR;
% LI_intra2=FCS2.intra_LI;
% LI_intra_abs2=FCS2.intra_absLI;
% he_LR2=FCS2.he_LR;
% he_RL2=FCS2.he_RL;
% LI_he2=FCS2.he_LI;
% LI_he_abs2=FCS2.he_absLI;
% inte_L2=FCS2.inteL;
% inte_R2=FCS2.inteR;
% seg_L2=FCS2.segL;
% seg_R2=FCS2.segR;
% inte_2=FCS2.inte;
% seg_2=FCS2.seg;
% 
% 
% IntraLL_mean2=mean(intra_LL2)';
% IntraRR_mean2=mean(intra_RR2)';
% HeLR_mean2=mean(he_LR2)';
% HeRL_mean2=mean(he_RL2)';
% HomoFC_mean2=mean(ho_FC2)';
% LI_intra_mean2=mean(LI_intra2)';
% absLI_intra_mean2=mean(LI_intra_abs2)';
% LI_he_mean2=mean(LI_he2)';
% absLI_he_mean2=mean(LI_he_abs2)';    
% InteL_mean2=mean(inte_L2)';
% InteR_mean2=mean(inte_R2)';
% SegL_mean2=mean(seg_L2)';
% SegR_mean2=mean(seg_R2)';
% Inte_mean2=mean(inte_2)';
% Seg_mean2=mean(seg_2)';

% if figflag==1
%     [gr_homo,~] =PlotCorr([statspath '/'],[statename '_homo_avgmapR'],HomoFC_mean1,HomoFC_mean2);
%     [gr_intraL,~] =PlotCorr([statspath '/'],[statename '_intraLL_avgmapR'],IntraLL_mean1,IntraLL_mean2);
%     [gr_intraR,~] =PlotCorr([statspath '/'],[statename '_intraRR_avgmapR'],IntraRR_mean1,IntraRR_mean2);
%     [gr_intraLI,~] =PlotCorr([statspath '/'],[statename '_intraLI_avgmapR'],LI_intra_mean1,LI_intra_mean2);
%     [gr_intraLIabs,~] =PlotCorr([statspath '/'],[statename '_intraLIabs_avgmapR'],absLI_intra_mean1,absLI_intra_mean2);
%     [gr_heLR,~] =PlotCorr([statspath '/'],[statename '_heLR_avgmapR'],HeLR_mean1,HeLR_mean2);
%     [gr_heRL,~] =PlotCorr([statspath '/'],[statename '_heRL_avgmapR'],HeRL_mean1,HeRL_mean2);
%     [gr_heLI,~] =PlotCorr([statspath '/'],[statename '_heLI_avgmapR'],LI_he_mean1,LI_he_mean2);
%     [gr_heLIabs,~] =PlotCorr([statspath '/'],[statename '_heLIabs_avgmapR'],absLI_he_mean1,absLI_he_mean2);
%     [gr_inteL,~] =PlotCorr([statspath '/'],[statename '_inteL_avgmapR'],InteL_mean1,InteL_mean2);
%     [gr_inteR,~] =PlotCorr([statspath '/'],[statename '_inteR_avgmapR'],InteR_mean1,InteR_mean2);  
%     [gr_inteL,~] =PlotCorr([statspath '/'],[statename '_segL_avgmapR'],SegL_mean1,SegL_mean2);
%     [gr_inteR,~] =PlotCorr([statspath '/'],[statename '_segR_avgmapR'],SegR_mean1,SegR_mean2); 
%     [gr_inte,~] =PlotCorr([statspath '/'],[statename '_inte_avgmapR'],Inte_mean1,Inte_mean2);  
%     [gr_seg,~] =PlotCorr([statspath '/'],[statename '_seg_avgmapR'],Seg_mean1,Seg_mean2);
% end

% [~,~,~,tst1]=ttest(HomoFC_mean1,HomoFC_mean2);
% [~,~,~,tst2]=ttest(IntraLL_mean1,IntraLL_mean2);
% [~,~,~,tst3]=ttest(IntraRR_mean1,IntraRR_mean2);
[~,~,~,tst4]=ttest(LI_intra_mean1,LI_intra_mean2);
% [~,~,~,tst5]=ttest(absLI_intra_mean1,absLI_intra_mean2);
% [~,~,~,tst6]=ttest(HeLR_mean1,HeLR_mean2);
% [~,~,~,tst7]=ttest(HeRL_mean1,HeRL_mean2);
[~,~,~,tst8]=ttest(LI_he_mean1,LI_he_mean2);
% [~,~,~,tst9]=ttest(absLI_he_mean1,absLI_he_mean2);
% [~,~,~,tst10]=ttest(InteL_mean1,InteL_mean2);
% [~,~,~,tst11]=ttest(InteR_mean1,InteR_mean2);
% [~,~,~,tst12]=ttest(SegL_mean1,SegL_mean2);
% [~,~,~,tst13]=ttest(SegR_mean1,SegR_mean2);
[~,~,~,tst14]=ttest(Inte_mean1,Inte_mean2);
[~,~,~,tst15]=ttest(Seg_mean1,Seg_mean2);

% gt_homo=tst1.tstat;
% gt_intraL=tst2.tstat;
% gt_intraR=tst3.tstat;
gt_intraLI=tst4.tstat;
% gt_intraLIabs=tst5.tstat;
% gt_heLR=tst6.tstat;
% gt_heRL=tst7.tstat;
gt_heLI=tst8.tstat;
% gt_heLIabs=tst9.tstat;
% gt_inteL=tst10.tstat;
% gt_inteR=tst11.tstat;
% gt_segL=tst12.tstat;
% gt_segR=tst13.tstat;
gt_inte=tst14.tstat;
gt_seg=tst15.tstat;

for j=1:180
    
%     [~,p_homot(1,j),~,stats1]=ttest2(ho_FC1(:,j),ho_FC2(:,j));
%     t_homot(1,j)=stats1.tstat;     
%     [~,p_intraLt(1,j),~,stats2]=ttest2(intra_LL1(:,j),intra_LL2(:,j));
%     t_intraLt(1,j)=stats2.tstat;      
%     [~,p_intraRt(1,j),~,stats3]=ttest2(intra_RR1(:,j),intra_RR2(:,j));
%     t_intraRt(1,j)=stats3.tstat;      
    [~,p_intraLIt(1,j),~,stats4]=ttest2(intra1(:,j),intra2(:,j));
    t_intraLIt(1,j)=stats4.tstat;  
%     [~,p_intraLIabst(1,j),~,stats5]=ttest2(LI_intra_abs1(:,j),LI_intra_abs2(:,j));
%     t_intraLIabst(1,j)=stats5.tstat;  
%     [~,p_heLRt(1,j),~,stats6]=ttest2(he_LR1(:,j),he_LR2(:,j));
%     t_heLRt(1,j)=stats6.tstat;      
%     [~,p_heRLt(1,j),~,stats7]=ttest2(he_RL1(:,j),he_RL2(:,j));
%     t_heRLt(1,j)=stats7.tstat;      
    [~,p_heLIt(1,j),~,stats8]=ttest2(he1(:,j),he2(:,j));
    t_heLIt(1,j)=stats8.tstat;  
%     [~,p_heLIabst(1,j),~,stats9]=ttest2(LI_he_abs1(:,j),LI_he_abs2(:,j));
%     t_heLIabst(1,j)=stats9.tstat; 
%     [~,p_inteLt(1,j),~,stats10]=ttest2(inte_L1(:,j),inte_L2(:,j));
%     t_inteLt(1,j)=stats10.tstat;      
%     [~,p_inteRt(1,j),~,stats11]=ttest2(inte_R1(:,j),inte_R2(:,j));
%     t_inteRt(1,j)=stats11.tstat;      
%     [~,p_segLt(1,j),~,stats12]=ttest2(seg_L1(:,j),seg_L2(:,j));
%     t_segLt(1,j)=stats10.tstat;      
%     [~,p_segRt(1,j),~,stats13]=ttest2(seg_R1(:,j),seg_R2(:,j));
%     t_segRt(1,j)=stats11.tstat;  
    [~,p_intet(1,j),~,stats14]=ttest2(inte1(:,j),inte2(:,j));
    t_intet(1,j)=stats14.tstat;      
    [~,p_segt(1,j),~,stats15]=ttest2(seg1(:,j),seg2(:,j));
    t_segt(1,j)=stats15.tstat; 
%     [homoc_R(1,j),homoc_P(1,j)]=corr(ho_FC1(:,j),ho_FC2(:,j));     
%     [intraLc_R(1,j),intraLc_P(1,j)]=corr(intra_LL1(:,j),intra_LL2(:,j));    
%     [intraRc_R(1,j),intraRc_P(1,j)]=corr(intra_RR1(:,j),intra_RR2(:,j));
%     [intraLIc_R(1,j),intraLIc_P(1,j)]=corr(LI_intra1(:,j),LI_intra2(:,j));   
%     [intraLIabsc_R(1,j),intraLIabsc_P(1,j)]=corr(LI_intra_abs1(:,j),LI_intra_abs2(:,j));

end

% load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/p_heabsLI.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/p_heLI.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/p_homo.mat');
% load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/p_inte.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/p_seg.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/p_intraabsLI.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/p_intraLI.mat');
% load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/inte_AxM_thrd.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/seg_AxM_thrd.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/intraLI_AxM_thrd.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/heLI_AxM_thrd.mat');
% 
% [pFDR_homo,~] =FDR(p_homo(1,nid),0.05);[pFDR_inte,~] =FDR(p_inte(1,nid),0.05);[pFDR_seg,~] =FDR(p_seg(1,nid),0.05);
% [pFDR_intraLI,~] =FDR(p_intraLI(1,nid),0.05);[pFDR_intraabsLI,~] =FDR(p_intraabsLI(1,nid),0.05);
% [pFDR_heLI,~] =FDR(p_heLI(1,nid),0.05);[pFDR_heabsLI,~] =FDR(p_heabsLI(1,nid),0.05);
% nid_inte=find(inte_AxM_thrd~=0);nid_seg=find(seg_AxM_thrd~=0);nid_intra=find(intraLI_AxM_thrd~=0);nid_he=find(heLI_AxM_thrd~=0);
% [psimple_inte,~] =FDR(p_intet(1,nid_inte),0.05);[psimple_seg,~] =FDR(p_segt(1,nid_seg),0.05);
% [psimple_intra,~] =FDR(p_intraLIt(1,nid_intra),0.05);[psimple_he,~] =FDR(p_heLIt(1,nid_he),0.05);
pbon=0.05/180;nid=[1:180];
[pFDR_inte,~] =FDR(p_intet(1,nid),0.05);[pFDR_seg,~] =FDR(p_segt(1,nid),0.05);
[pFDR_intraLI,~] =FDR(p_intraLIt(1,nid),0.05);[pFDR_heLI,~] =FDR(p_heLIt(1,nid),0.05);
t_intraLIt_thrd=t_intraLIt .* (p_intraLIt<pbon);
t_heLIt_thrd=t_heLIt .* (p_heLIt<pbon);
t_intet_thrd=t_intet .* (p_intet<pbon);
t_segt_thrd=t_segt .* (p_segt<pbon);

% t_homot_thrd=t_homot .* (p_homo<pFDR_homo).* (p_homot<0.05);
% t_intraLt_thrd=t_intraLt .* (p_intraLt<pbon);
% t_intraRt_thrd=t_intraRt .* (p_intraRt<pbon);
% t_intraLIt_thrd=t_intraLIt .* (p_intraLI<pFDR_intraLI).* (p_intraLIt<0.05);
% t_intraLIabst_thrd=t_intraLIabst .* (p_intraabsLI<pFDR_intraabsLI).* (p_intraLIabst<0.05);
% t_heLRt_thrd=t_heLRt .* (p_heLRt<pbon);
% t_heRLt_thrd=t_heRLt .* (p_heRLt<pbon);
% t_heLIt_thrd=t_heLIt .* (p_heLI<pFDR_heLI).* (p_heLIt<0.05);
% t_heLIabst_thrd=t_heLIabst .* (p_heabsLI<pFDR_heabsLI).* (p_heLIabst<0.05);
% t_inteLt_thrd=t_inteLt .* (p_inteLt<pbon);
% t_inteRt_thrd=t_inteRt .* (p_inteRt<pbon);
% t_segLt_thrd=t_segLt .* (p_segLt<pbon);
% t_segRt_thrd=t_segRt .* (p_segRt<pbon);
% t_intet_thrd=t_intet .* (p_inte<pFDR_inte).* (p_intet<0.05);
% t_segt_thrd=t_segt .* (p_seg<pFDR_seg).* (p_segt<0.05);
% homoc_R_thrd=homoc_R .* (homoc_P<pbon);
% intraLc_R_thrd=intraLc_R .* (intraLc_P<pbon);
% intraRc_R_thrd=intraRc_R .* (intraRc_P<pbon);
% intraLIc_R_thrd=intraLIc_R .* (intraLIc_P<pbon);
% intraLIabsc_R_thrd=intraLIabsc_R .* (intraLIabsc_P<pbon);


if figflag==1
%     SaveAsAtlasNii(t_homot,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_HomoFC' '_T' '_map'],1)
%     SaveAsAtlasNii(t_intraLt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_IntraL' '_T' '_map'],1)
%     SaveAsAtlasNii(t_intraRt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_IntraR' '_T' '_map'],1)
%     SaveAsAtlasNii(t_intraLIt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_IntraLI' '_T' '_map'],1)
%     SaveAsAtlasNii(t_intraLIabst,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_IntraLIabs' '_T' '_map'],1)
%     SaveAsAtlasNii(t_heLRt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_HeLR' '_T' '_map'],1)
%     SaveAsAtlasNii(t_heRLt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_HeRL' '_T' '_map'],1)
%     SaveAsAtlasNii(t_heLIt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_HeLI' '_T' '_map'],1)
%     SaveAsAtlasNii(t_heLIabst,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_HeLIabs' '_T' '_map'],1)
%     SaveAsAtlasNii(t_inteLt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_InteL' '_T' '_map'],1)
%     SaveAsAtlasNii(t_inteRt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_InteR' '_T' '_map'],1)
%     SaveAsAtlasNii(t_segLt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_SegL' '_T' '_map'],1)
%     SaveAsAtlasNii(t_segRt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_SegR' '_T' '_map'],1)
%     SaveAsAtlasNii(t_intet,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_Inte' '_T' '_map'],1)
%     SaveAsAtlasNii(t_segt,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath,'/',statename],['_Seg' '_T' '_map'],1)
%     SaveAsAtlasNii(homoc_R,'/data/newjiao/Sharefolder/atlas/HCP_2mm/AICHA.nii',[statspath,'/',statename],['_HomoFC' '_R' '_map'],1)
%     SaveAsAtlasNii(intraLc_R,'/data/newjiao/Sharefolder/atlas/HCP_2mm/AICHA.nii',[statspath,'/',statename],['_IntraL' '_R' '_map'],1)
%     SaveAsAtlasNii(intraRc_R,'/data/newjiao/Sharefolder/atlas/HCP_2mm/AICHA.nii',[statspath,'/',statename],['_IntraR' '_R' '_map'],1)
%     SaveAsAtlasNii(intraLIc_R,'/data/newjiao/Sharefolder/atlas/HCP_2mm/AICHA.nii',[statspath,'/',statename],['_IntraLI' '_R' '_map'],1)
%     SaveAsAtlasNii(intraLIabsc_R,'/data/newjiao/Sharefolder/atlas/HCP_2mm/AICHA.nii',[statspath,'/',statename],['_IntraLIabs' '_R' '_map'],1)

%     SaveAsNii(t_homot_thrd',[statspath,'/',statename],['_HomoFC' '_T' '_THRD' '_dlabel'])
    SaveAsNii(t_intraLIt_thrd',[statspath,'/',statename],['_IntraLI' '_T' '_THRD' '_dlabel'])
%     SaveAsNii(t_intraLIabst_thrd',[statspath,'/',statename],['_IntraLIabs' '_T' '_THRD' '_dlabel'])
    SaveAsNii(t_heLIt_thrd',[statspath,'/',statename],['_HeLI' '_T' '_THRD' '_dlabel'])
%     SaveAsNii(t_heLIabst_thrd',[statspath,'/',statename],['_HeLIabs' '_T' '_THRD' '_dlabel'])
    SaveAsNii(t_intet_thrd',[statspath,'/',statename],['_Inte' '_T' '_THRD' '_dlabel'])
    SaveAsNii(t_segt_thrd',[statspath,'/',statename],['_Seg' '_T' '_THRD' '_dlabel'])
%     SaveAsAtlasNii(homoc_R_thrd,'/data/newjiao/Sharefolder/atlas/HCP_2mm/AICHA.nii',[statspath,'/',statename],['_HomoFC' '_R' '_THRD'],1)
%     SaveAsAtlasNii(intraLc_R_thrd,'/data/newjiao/Sharefolder/atlas/HCP_2mm/AICHA.nii',[statspath,'/',statename],['_IntraL' '_R' '_THRD'],1)
%     SaveAsAtlasNii(intraRc_R_thrd,'/data/newjiao/Sharefolder/atlas/HCP_2mm/AICHA.nii',[statspath,'/',statename],['_IntraR' '_R' '_THRD'],1)
%     SaveAsAtlasNii(intraLIc_R_thrd,'/data/newjiao/Sharefolder/atlas/HCP_2mm/AICHA.nii',[statspath,'/',statename],['_IntraLI' '_R' '_THRD'],1)
%     SaveAsAtlasNii(intraLIabsc_R_thrd,'/data/newjiao/Sharefolder/atlas/HCP_2mm/AICHA.nii',[statspath,'/',statename],['_IntraLIabs' '_R' '_THRD'],1)
    
    
%     NiiProj2Surf([statspath,'/',statename,'_HomoFC' '_T' '_map','.nii'],'inf','tri','hemi',cba);
%     NiiProj2Surf([statspath,'/',statename,'_IntraL' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_IntraR' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_IntraLI' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_IntraLIabs' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_HeLR' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_HeRL' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_HeLI' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_HeLIabs' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_InteL' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_InteR' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_SegL' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_SegR' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_Inte' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_Seg' '_T' '_map','.nii'],'inf','tri','hemi',cbb);
%     NiiProj2Surf([statspath,'/',statename,'_HomoFC' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_IntraL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_IntraR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_IntraLI' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_IntraLIabs' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     giiProj2Surf([statspath,'/',statename,'_HomoFC' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cba);
    giiProj2Surf([statspath,'/',statename,'_IntraLI' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbb);
    giiProj2Surf([statspath,'/',statename,'_HeLI' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbb);
%     giiProj2Surf([statspath,'/',statename,'_IntraLIabs' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbb);
%     giiProj2Surf([statspath,'/',statename,'_HeLIabs' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbb);
    giiProj2Surf([statspath,'/',statename,'_Inte' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbb);
    giiProj2Surf([statspath,'/',statename,'_Seg' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbb);

%     NiiProj2Surf([statspath,'/',statename,'_HomoFC' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_IntraL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_IntraR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_IntraLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_IntraLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    
    
%     PlotCorr([statspath '/'],[statename '_homo_avgsubR'],mean(ho_FC1,2),mean(ho_FC2,2));
%     PlotCorr([statspath '/'],[statename '_intraL_avgsubR'],mean(intra_LL1,2),mean(intra_LL2,2));
%     PlotCorr([statspath '/'],[statename '_intraR_avgsubR'],mean(intra_RR1,2),mean(intra_RR2,2));
%     PlotCorr([statspath '/'],[statename '_intraLI_avgsubR'],mean(LI_intra1,2),mean(LI_intra2,2));
%     PlotCorr([statspath '/'],[statename '_intraLIabs_avgsubR'],mean(LI_intra_abs1,2),mean(LI_intra_abs2,2));
end

% % single sub
% for i=1:length(subid)
%     IntraL_sub1=intra_LL1(i,:)';
%     IntraR_sub1=intra_RR1(i,:)';
%     HomoFC_sub1=ho_FC1(i,:)';
%     LI_intra_sub1=LI_intra1(i,:)';
%     absLI_intra_sub1=LI_intra_abs1(i,:)';
%     HeLR_sub1=he_LR1(i,:)';
%     HeRL_sub1=he_RL1(i,:)';
%     LI_he_sub1=LI_he1(i,:)';
%     absLI_he_sub1=LI_he_abs1(i,:)';
%     InteL_sub1=inte_L1(i,:)';
%     InteR_sub1=inte_R1(i,:)';
%     SegL_sub1=seg_L1(i,:)';
%     SegR_sub1=seg_R1(i,:)';  
%     
%     IntraL_sub2=intra_LL2(i,:)';
%     IntraR_sub2=intra_RR2(i,:)';
%     HomoFC_sub2=ho_FC2(i,:)';
%     LI_intra_sub2=LI_intra2(i,:)';
%     absLI_intra_sub2=LI_intra_abs2(i,:)';
%     HeLR_sub2=he_LR2(i,:)';
%     HeRL_sub2=he_RL2(i,:)';
%     LI_he_sub2=LI_he2(i,:)';
%     absLI_he_sub2=LI_he_abs2(i,:)';
%     InteL_sub2=inte_L2(i,:)';
%     InteR_sub2=inte_R2(i,:)';
%     SegL_sub2=seg_L2(i,:)';
%     SegR_sub2=seg_R2(i,:)'; 
%     
%     [~,p_homot_sub(i,1),~,stats1]=ttest(HomoFC_sub1,HomoFC_sub2);
%     t_homot_sub(i,1)=stats1.tstat;     
%     [~,p_intraLt_sub(i,1),~,stats2]=ttest(IntraL_sub1,IntraL_sub2);
%     t_intraLt_sub(i,1)=stats2.tstat;      
%     [~,p_intraRt_sub(i,1),~,stats3]=ttest(IntraR_sub1,IntraR_sub2);
%     t_intraRt_sub(i,1)=stats3.tstat;      
%     [~,p_intraLIt_sub(i,1),~,stats4]=ttest(LI_intra_sub1,LI_intra_sub2);
%     t_intraLIt_sub(i,1)=stats4.tstat;  
%     [~,p_intraLIabst_sub(i,1),~,stats5]=ttest(absLI_intra_sub1,absLI_intra_sub2);
%     t_intraLIabst_sub(i,1)=stats5.tstat;  
%     [~,p_heLRt_sub(i,1),~,stats6]=ttest(HeLR_sub1,HeLR_sub2);
%     t_heLRt_sub(i,1)=stats6.tstat;      
%     [~,p_heRLt_sub(i,1),~,stats7]=ttest(HeRL_sub1,HeRL_sub2);
%     t_heRLt_sub(i,1)=stats7.tstat;      
%     [~,p_heLIt_sub(i,1),~,stats8]=ttest(LI_he_sub1,LI_he_sub2);
%     t_heLIt_sub(i,1)=stats8.tstat;  
%     [~,p_heLIabst_sub(i,1),~,stats9]=ttest(absLI_he_sub1,absLI_he_sub2);
%     t_heLIabst_sub(i,1)=stats9.tstat;  
%     [~,p_inteLt_sub(i,1),~,stats10]=ttest(InteL_sub1,InteL_sub2);
%     t_inteLt_sub(i,1)=stats10.tstat;      
%     [~,p_inteRt_sub(i,1),~,stats11]=ttest(InteR_sub1,InteR_sub2);
%     t_inteRt_sub(i,1)=stats11.tstat;  
%     [~,p_segLt_sub(i,1),~,stats12]=ttest(SegL_sub1,SegL_sub2);
%     t_segLt_sub(i,1)=stats12.tstat;      
%     [~,p_inteRt_sub(i,1),~,stats13]=ttest(SegR_sub1,SegR_sub2);
%     t_segRt_sub(i,1)=stats13.tstat;
%     
%     [homoc_R_sub(i,1),homoc_P_sub(i,1)]=corr(HomoFC_sub1,HomoFC_sub2);     
%     [intraLc_R_sub(i,1),intraLc_P_sub(i,1)]=corr(IntraL_sub1,IntraL_sub2);    
%     [intraRc_R_sub(i,1),intraRc_P_sub(i,1)]=corr(IntraR_sub1,IntraR_sub2);
%     [intraLIc_R_sub(i,1),intraLIc_P_sub(i,1)]=corr(LI_intra_sub1,LI_intra_sub2);   
%     [intraLIabsc_R_sub(i,1),intraLIabsc_P_sub(i,1)]=corr(absLI_intra_sub1,absLI_intra_sub2);
%     [heLRc_R_sub(i,1),heLRc_P_sub(i,1)]=corr(HeLR_sub1,HeLR_sub2);    
%     [heRLc_R_sub(i,1),heRLc_P_sub(i,1)]=corr(HeRL_sub1,HeRL_sub2);
%     [heLIc_R_sub(i,1),heLIc_P_sub(i,1)]=corr(LI_he_sub1,LI_he_sub2);   
%     [heLIabsc_R_sub(i,1),heLIabsc_P_sub(i,1)]=corr(absLI_he_sub1,absLI_he_sub2);
%     [inteLc_R_sub(i,1),inteLc_P_sub(i,1)]=corr(InteL_sub1,InteL_sub2); 
%     [inteRc_R_sub(i,1),inteRc_P_sub(i,1)]=corr(InteR_sub1,InteR_sub2); 
%     [segLc_R_sub(i,1),segLc_P_sub(i,1)]=corr(SegL_sub1,SegL_sub2); 
%     [segRc_R_sub(i,1),segRc_P_sub(i,1)]=corr(SegR_sub1,SegR_sub2); 
% end
% 
% if figflag==1
%     hist_lxy(t_homot_sub,gt_homo,statspath,[statename '_homo_mapT_hist']);
%     hist_lxy(t_intraLt_sub,gt_intraL,statspath,[statename '_intraLL_mapT_hist']);
%     hist_lxy(t_intraRt_sub,gt_intraR,statspath,[statename '_intraRR_mapT_hist']);
%     hist_lxy(t_intraLIt_sub,gt_intraLI,statspath,[statename '_intraLI_mapT_hist']);
%     hist_lxy(t_intraLIabst_sub,gt_intraLIabs,statspath,[statename '_intraLIabs_mapT_hist']);
%     hist_lxy(t_heLRt_sub,gt_heLR,statspath,[statename '_heLR_mapT_hist']);
%     hist_lxy(t_heRLt_sub,gt_heRL,statspath,[statename '_heRL_mapT_hist']);
%     hist_lxy(t_heLIt_sub,gt_heLI,statspath,[statename '_heLI_mapT_hist']);
%     hist_lxy(t_heLIabst_sub,gt_heLIabs,statspath,[statename '_heLIabs_mapT_hist']);
%     hist_lxy(t_inteLt_sub,gt_inteL,statspath,[statename '_inteL_mapT_hist']);
%     hist_lxy(t_inteRt_sub,gt_inteR,statspath,[statename '_inteR_mapT_hist']);
%     hist_lxy(t_segLt_sub,gt_segL,statspath,[statename '_segL_mapT_hist']);
%     hist_lxy(t_segRt_sub,gt_segR,statspath,[statename '_segR_mapT_hist']);
%     
%     hist_lxy(homoc_R_sub,gr_homo,statspath,[statename '_homo_mapR_hist']);
%     hist_lxy(intraLc_R_sub,gr_intraL,statspath,[statename '_intraL_mapR_hist']);
%     hist_lxy(intraRc_R_sub,gr_intraR,statspath,[statename '_intraR_mapR_hist']);
%     hist_lxy(intraLIc_R_sub,gr_intraLI,statspath,[statename '_intraLI_mapR_hist']);
%     hist_lxy(intraLIabsc_R_sub,gr_intraLIabs,statspath,[statename '_intraLIabs_mapR_hist']);
%     hist_lxy(heLRc_R_sub,gr_heLR,statspath,[statename '_heLR_mapR_hist']);
%     hist_lxy(heRLc_R_sub,gr_heRL,statspath,[statename '_heRL_mapR_hist']);
%     hist_lxy(heLIc_R_sub,gr_heLI,statspath,[statename '_heLI_mapR_hist']);
%     hist_lxy(heLIabsc_R_sub,gr_heLIabs,statspath,[statename '_heLIabs_mapR_hist']);
%     hist_lxy(inteLc_R_sub,gr_inteL,statspath,[statename '_inteL_mapR_hist']);
%     hist_lxy(inteRc_R_sub,gr_inteR,statspath,[statename '_inteR_mapR_hist']);
%     hist_lxy(segLc_R_sub,gr_segL,statspath,[statename '_segL_mapR_hist']);
%     hist_lxy(segRc_R_sub,gr_segR,statspath,[statename '_segR_mapR_hist']);
% end
% insectid=subid(logical((t_intraLt_sub<-23) .* (t_intraRt_sub<-23)))


end