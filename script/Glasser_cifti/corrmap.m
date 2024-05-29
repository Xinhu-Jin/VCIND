function [HxI_Rmap,HxI_Rsub]=corrmap(FCS,subid,cov,statspath,statename,cba,cbc)
% relation of HomoxIntra within each STATE

figflag=1;

nid=[1:180];

%% Group mean - Across subject
[~,~, iS]=intersect(subid,FCS.subid);

ho_FC=FCS.homo(iS,:);
intra_LL=FCS.intra_LL(iS,:);
intra_RR=FCS.intra_RR(iS,:);
LI_intra=FCS.intra_LI(iS,:);
LI_intra_abs=FCS.intra_absLI(iS,:);
he_LR=FCS.he_LR(iS,:);
he_RL=FCS.he_RL(iS,:);
LI_he=FCS.he_LI(iS,:);
LI_he_abs=FCS.he_absLI(iS,:);
inte_L=FCS.inteL(iS,:);
inte_R=FCS.inteR(iS,:);
seg_L=FCS.segL(iS,:);
seg_R=FCS.segR(iS,:);
inte=FCS.inte(iS,:);
seg=FCS.seg(iS,:);

IntraL_mean=mean(intra_LL)';
IntraR_mean=mean(intra_RR)';
HomoFC_mean=mean(ho_FC)';
HeLR_mean=mean(he_LR)';
HeRL_mean=mean(he_RL)';
SegL_mean=mean(seg_L)';
SegR_mean=mean(seg_R)';
InteL_mean=mean(inte_L)';
InteR_mean=mean(inte_R)';
LI_mean_intra=mean(LI_intra)';
absLI_mean_intra=mean(LI_intra_abs)';
LI_mean_he=mean(LI_he)';
absLI_mean_he=mean(LI_he_abs)';
Seg_mean=mean(seg)';
Inte_mean=mean(inte)';

FCS_global=FCS.global(iS,:);

% load('/data1/Public/jxhu/results/musician/behavior_scores.mat');load('/data1/Public/jxhu/results/musician/SIN_task.mat');
% [C, is, iS]=intersect(sin_task(:,2),FCS.subid);
% VE=sin_task(is,11);VE_per=sin_task(is,12);VI=sin_task(is,13);VV=sin_task(is,14);V=(VI+VV)/2;

load('/data1/Public/jxhu/results/musician/behavior_scores.mat');load('/data1/Public/jxhu/results/musician/SINphrase4group.mat');load('/data1/Public/jxhu/results/musician/SINsyllable4group.mat');load('/data1/Public/jxhu/results/musician/cognitiveability.mat');
[ID_syllable, is_syllable, iS]=intersect(SINsyllable(:,2),FCS.subid);[ID_phrase, is_phrase, iS]=intersect(SINphrase(:,1),FCS.subid);[ID_cog, is_cog, iS]=intersect(cognitiveability(:,1),FCS.subid);
VE=SINsyllable(is_syllable,11);VE_per=SINsyllable(is_syllable,12);VI=SINsyllable(is_syllable,13);VV=SINsyllable(is_syllable,14);V=(VI+VV)/2;
noise_sep=SINphrase(is_phrase,2);noise_col=SINphrase(is_phrase,3);speech_sep=SINphrase(is_phrase,4);speech_col=SINphrase(is_phrase,5);noise=(noise_sep+noise_col)/2;speech=(speech_sep+speech_col)/2;
% if figflag==1
%     [gr_VExintraL,~] =PlotCorr([statspath '/'],[statename '_VExIntraL_avgmapR'],VE,IntraL_mean(nid,:));
%     [gr_VExintraR,~] =PlotCorr([statspath '/'],[statename '_VExIntraR_avgmapR'],VE,IntraR_mean(nid,:));
%     [gr_VExintraLI,~] =PlotCorr([statspath '/'],[statename '_VExIntraLI_avgmapR'],VE,LI_mean_intra(nid,:));
%     [gr_VExintraLIabs,~] =PlotCorr([statspath '/'],[statename '_VExIntraLIabs_avgmapR'],VE,absLI_mean_intra(nid,:));
%      [gr_VExheLR,~] =PlotCorr([statspath '/'],[statename '_VExHeLR_avgmapR'],VE,HeLR_mean(nid,:));
%     [gr_VExintraR,~] =PlotCorr([statspath '/'],[statename '_VExHeRL_avgmapR'],VE,HeRL_mean(nid,:));
%     [gr_VExintraLI,~] =PlotCorr([statspath '/'],[statename '_VExIntraLI_avgmapR'],VE,LI_mean_intra(nid,:));
%     [gr_VExintraLIabs,~] =PlotCorr([statspath '/'],[statename '_VExIntraLIabs_avgmapR'],VE,absLI_mean_intra(nid,:));
%     [gr_VExhomo,~] =PlotCorr([statspath '/'],[statename '_VExHomo_avgmapR'],VE,HomoFC_mean(nid,:));
% end



for j=1:180
     

% %     [VExintraLc_R(1,j),VExintraLc_P(1,j)]=partialcorr(VE,intra_LL(:,j),[FCS_global,cov]);     
% %     [VExintraRc_R(1,j),VExintraRc_P(1,j)]=partialcorr(VE,intra_RR(:,j),[FCS_global,cov]);    
% %     [VExintraLIc_R(1,j),VExintraLIc_P(1,j)]=partialcorr(VE,LI_intra(:,j),[FCS_global,cov]);
% %     [VExintraLIabsc_R(1,j),VExintraLIabsc_P(1,j)]=partialcorr(VE,LI_intra_abs(:,j),[FCS_global,cov]);   
% %     [VExhomoc_R(1,j),VExhomoc_P(1,j)]=partialcorr(VE,ho_FC(:,j),[FCS_global,cov]);
% %     [VExheLRc_R(1,j),VExheLRc_P(1,j)]=partialcorr(VE,he_LR(:,j),[FCS_global,cov]);     
% %     [VExheRLc_R(1,j),VExheRLc_P(1,j)]=partialcorr(VE,he_RL(:,j),[FCS_global,cov]);    
% %     [VExheLIc_R(1,j),VExheLIc_P(1,j)]=partialcorr(VE,LI_he(:,j),[FCS_global,cov]);
% %     [VExheLIabsc_R(1,j),VExheLIabsc_P(1,j)]=partialcorr(VE,LI_he_abs(:,j),[FCS_global,cov]);   
% %     [VExinteLc_R(1,j),VExinteLc_P(1,j)]=partialcorr(VE,inte_L(:,j),[FCS_global,cov]);     
% %     [VExinteRc_R(1,j),VExinteRc_P(1,j)]=partialcorr(VE,inte_R(:,j),[FCS_global,cov]);  
% %     [VExsegLc_R(1,j),VExsegLc_P(1,j)]=partialcorr(VE,seg_L(:,j),[FCS_global,cov]);     
% %     [VExsegRc_R(1,j),VExsegRc_P(1,j)]=partialcorr(VE,seg_R(:,j),[FCS_global,cov]); 
%     [VExintec_R(1,j),VExintec_P(1,j)]=partialcorr(VE,inte(:,j),[FCS_global,cov]);  
%     [VExsegc_R(1,j),VExsegc_P(1,j)]=partialcorr(VE,seg(:,j),[FCS_global,cov]);   
%     
% %     [VE_perxintraLc_R(1,j),VE_perxintraLc_P(1,j)]=partialcorr(VE_per,intra_LL(:,j),[FCS_global,cov]);     
% %     [VE_perxintraRc_R(1,j),VE_perxintraRc_P(1,j)]=partialcorr(VE_per,intra_RR(:,j),[FCS_global,cov]);    
% %     [VE_perxintraLIc_R(1,j),VE_perxintraLIc_P(1,j)]=partialcorr(VE_per,LI_intra(:,j),[FCS_global,cov]);
% %     [VE_perxintraLIabsc_R(1,j),VE_perxintraLIabsc_P(1,j)]=partialcorr(VE_per,LI_intra_abs(:,j),[FCS_global,cov]);   
% %     [VE_perxhomoc_R(1,j),VE_perxhomoc_P(1,j)]=partialcorr(VE_per,ho_FC(:,j),[FCS_global,cov]);
% %     [VE_perxheLRc_R(1,j),VE_perxheLRc_P(1,j)]=partialcorr(VE_per,he_LR(:,j),[FCS_global,cov]);     
% %     [VE_perxheRLc_R(1,j),VE_perxheRLc_P(1,j)]=partialcorr(VE_per,he_RL(:,j),[FCS_global,cov]);    
% %     [VE_perxheLIc_R(1,j),VE_perxheLIc_P(1,j)]=partialcorr(VE_per,LI_he(:,j),[FCS_global,cov]);
% %     [VE_perxheLIabsc_R(1,j),VE_perxheLIabsc_P(1,j)]=partialcorr(VE_per,LI_he_abs(:,j),[FCS_global,cov]);   
% %     [VE_perxinteLc_R(1,j),VE_perxinteLc_P(1,j)]=partialcorr(VE_per,inte_L(:,j),[FCS_global,cov]);     
% %     [VE_perxinteRc_R(1,j),VE_perxinteRc_P(1,j)]=partialcorr(VE_per,inte_R(:,j),[FCS_global,cov]);  
% %     [VE_perxsegLc_R(1,j),VE_perxsegLc_P(1,j)]=partialcorr(VE_per,seg_L(:,j),[FCS_global,cov]);     
% %     [VE_perxsegRc_R(1,j),VE_perxsegRc_P(1,j)]=partialcorr(VE_per,seg_R(:,j),[FCS_global,cov]); 
%     [VE_perxintec_R(1,j),VE_perxintec_P(1,j)]=partialcorr(VE_per,inte(:,j),[FCS_global,cov]);  
%     [VE_perxsegc_R(1,j),VE_perxsegc_P(1,j)]=partialcorr(VE_per,seg(:,j),[FCS_global,cov]);   
%     
% %     [VIxintraLc_R(1,j),VIxintraLc_P(1,j)]=partialcorr(VI,intra_LL(:,j),[FCS_global,cov]);     
% %     [VIxintraRc_R(1,j),VIxintraRc_P(1,j)]=partialcorr(VI,intra_RR(:,j),[FCS_global,cov]);    
% %     [VIxintraLIc_R(1,j),VIxintraLIc_P(1,j)]=partialcorr(VI,LI_intra(:,j),[FCS_global,cov]);
% %     [VIxintraLIabsc_R(1,j),VIxintraLIabsc_P(1,j)]=partialcorr(VI,LI_intra_abs(:,j),[FCS_global,cov]);   
% %     [VIxhomoc_R(1,j),VIxhomoc_P(1,j)]=partialcorr(VI,ho_FC(:,j),[FCS_global,cov]);
% %     [VIxheLRc_R(1,j),VIxheLRc_P(1,j)]=partialcorr(VI,he_LR(:,j),[FCS_global,cov]);     
% %     [VIxheRLc_R(1,j),VIxheRLc_P(1,j)]=partialcorr(VI,he_RL(:,j),[FCS_global,cov]);    
% %     [VIxheLIc_R(1,j),VIxheLIc_P(1,j)]=partialcorr(VI,LI_he(:,j),[FCS_global,cov]);
% %     [VIxheLIabsc_R(1,j),VIxheLIabsc_P(1,j)]=partialcorr(VI,LI_he_abs(:,j),[FCS_global,cov]);   
% %     [VIxinteLc_R(1,j),VIxinteLc_P(1,j)]=partialcorr(VI,inte_L(:,j),[FCS_global,cov]);     
% %     [VIxinteRc_R(1,j),VIxinteRc_P(1,j)]=partialcorr(VI,inte_R(:,j),[FCS_global,cov]);  
% %     [VIxsegLc_R(1,j),VIxsegLc_P(1,j)]=partialcorr(VI,seg_L(:,j),[FCS_global,cov]);     
% %     [VIxsegRc_R(1,j),VIxsegRc_P(1,j)]=partialcorr(VI,seg_R(:,j),[FCS_global,cov]); 
%     [VIxintec_R(1,j),VIxintec_P(1,j)]=partialcorr(VI,inte(:,j),[FCS_global,cov]);  
%     [VIxsegc_R(1,j),VIxsegc_P(1,j)]=partialcorr(VI,seg(:,j),[FCS_global,cov]);   
% %     
% %     [VVxintraLc_R(1,j),VVxintraLc_P(1,j)]=partialcorr(VV,intra_LL(:,j),[FCS_global,cov]);     
% %     [VVxintraRc_R(1,j),VVxintraRc_P(1,j)]=partialcorr(VV,intra_RR(:,j),[FCS_global,cov]);    
% %     [VVxintraLIc_R(1,j),VVxintraLIc_P(1,j)]=partialcorr(VV,LI_intra(:,j),[FCS_global,cov]);
% %     [VVxintraLIabsc_R(1,j),VVxintraLIabsc_P(1,j)]=partialcorr(VV,LI_intra_abs(:,j),[FCS_global,cov]);   
% %     [VVxhomoc_R(1,j),VVxhomoc_P(1,j)]=partialcorr(VV,ho_FC(:,j),[FCS_global,cov]);
% %     [VVxheLRc_R(1,j),VVxheLRc_P(1,j)]=partialcorr(VV,he_LR(:,j),[FCS_global,cov]);     
% %     [VVxheRLc_R(1,j),VVxheRLc_P(1,j)]=partialcorr(VV,he_RL(:,j),[FCS_global,cov]);    
% %     [VVxheLIc_R(1,j),VVxheLIc_P(1,j)]=partialcorr(VV,LI_he(:,j),[FCS_global,cov]);
% %     [VVxheLIabsc_R(1,j),VVxheLIabsc_P(1,j)]=partialcorr(VV,LI_he_abs(:,j),[FCS_global,cov]);   
% %     [VVxinteLc_R(1,j),VVxinteLc_P(1,j)]=partialcorr(VV,inte_L(:,j),[FCS_global,cov]);     
% %     [VVxinteRc_R(1,j),VVxinteRc_P(1,j)]=partialcorr(VV,inte_R(:,j),[FCS_global,cov]);  
% %     [VVxsegLc_R(1,j),VVxsegLc_P(1,j)]=partialcorr(VV,seg_L(:,j),[FCS_global,cov]);     
% %     [VVxsegRc_R(1,j),VVxsegRc_P(1,j)]=partialcorr(VV,seg_R(:,j),[FCS_global,cov]); 
%     [VVxintec_R(1,j),VVxintec_P(1,j)]=partialcorr(VV,inte(:,j),[FCS_global,cov]);  
%     [VVxsegc_R(1,j),VVxsegc_P(1,j)]=partialcorr(VV,seg(:,j),[FCS_global,cov]);   
%     
    [WMxintec_R(1,j),WMxintec_P(1,j)]=partialcorr(cov(:,7),inte(:,j),[FCS_global,cov(:,1:6)]);  
    [WMxsegc_R(1,j),WMxsegc_P(1,j)]=partialcorr(cov(:,7),seg(:,j),[FCS_global,cov(:,1:6)]);   
    [WMxheLIc_R(1,j),WMxheLIc_P(1,j)]=partialcorr(cov(:,7),LI_he(:,j),[FCS_global,cov(:,1:6)]);  
    [WMxintraLIc_R(1,j),WMxintraLIc_P(1,j)]=partialcorr(cov(:,7),LI_intra(:,j),[FCS_global,cov(:,1:6)]);  
    
%     [Stroopxintec_R(1,j),Stroopxintec_P(1,j)]=partialcorr(cov(:,8),inte(:,j),[FCS_global,cov(:,1:6)]);  
%     [Stroopxsegc_R(1,j),Stroopxsegc_P(1,j)]=partialcorr(cov(:,8),seg(:,j),[FCS_global,cov(:,1:6)]);   
%     [StroopxheLIc_R(1,j),StroopxheLIc_P(1,j)]=partialcorr(cov(:,8),LI_he(:,j),[FCS_global,cov(:,1:6)]);  
%     [StroopxintraLIc_R(1,j),StroopxintraLIc_P(1,j)]=partialcorr(cov(:,8),LI_intra(:,j),[FCS_global,cov(:,1:6)]);  
   
    [noisexintec_R(1,j),noisexintec_P(1,j)]=partialcorr(noise,inte(:,j),[FCS_global,cov]);  
    [noisexsegc_R(1,j),noisexsegc_P(1,j)]=partialcorr(noise,seg(:,j),[FCS_global,cov]);  
    [speechxintec_R(1,j),speechxintec_P(1,j)]=partialcorr(speech,inte(:,j),[FCS_global,cov]);  
    [speechxsegc_R(1,j),speechxsegc_P(1,j)]=partialcorr(speech,seg(:,j),[FCS_global,cov]); 
    [noisexheLIc_R(1,j),noisexheLIc_P(1,j)]=partialcorr(noise,LI_he(:,j),[FCS_global,cov]);  
    [noisexintraLIc_R(1,j),noisexintraLIc_P(1,j)]=partialcorr(noise,LI_intra(:,j),[FCS_global,cov]);  
    [speechxheLIc_R(1,j),speechxheLIc_P(1,j)]=partialcorr(speech,LI_he(:,j),[FCS_global,cov]);  
    [speechxintraLIc_R(1,j),speechxintraLIc_P(1,j)]=partialcorr(speech,LI_intra(:,j),[FCS_global,cov]); 

%     [noise_sepxintec_R(1,j),noise_sepxintec_P(1,j)]=partialcorr(noise_sep,inte(:,j),[FCS_global,cov]);  
%     [noise_sepxsegc_R(1,j),noise_sepxsegc_P(1,j)]=partialcorr(noise_sep,seg(:,j),[FCS_global,cov]);   
%     [noise_colxintec_R(1,j),noise_colxintec_P(1,j)]=partialcorr(noise_col,inte(:,j),[FCS_global,cov]);  
%     [noise_colxsegc_R(1,j),noise_colxsegc_P(1,j)]=partialcorr(noise_col,seg(:,j),[FCS_global,cov]);  
%     [speech_sepxintec_R(1,j),speech_sepxintec_P(1,j)]=partialcorr(speech_sep,inte(:,j),[FCS_global,cov]);  
%     [speech_sepxsegc_R(1,j),speech_sepxsegc_P(1,j)]=partialcorr(speech_sep,seg(:,j),[FCS_global,cov]);   
%     [speech_colxintec_R(1,j),speech_colxintec_P(1,j)]=partialcorr(speech_col,inte(:,j),[FCS_global,cov]);  
%     [speech_colxsegc_R(1,j),speech_colxsegc_P(1,j)]=partialcorr(speech_col,seg(:,j),[FCS_global,cov]);  
%     [speech_colxintec_R(1,j),speech_colxintec_P(1,j)]=partialcorr(speech_col(nid,1),inte(nid,j),[FCS_global(nid,1),cov(nid,:)]);  
%     [speech_colxsegc_R(1,j),speech_colxsegc_P(1,j)]=partialcorr(speech_col(nid,1),seg(nid,j),[FCS_global(nid,1),cov(nid,:)]);  
 
end

% HxI_Rmap.homoxintraL_R=VExintraLc_R;
% HxI_Rmap.homoxintraR_R=VExintraRc_R;
% HxI_Rmap.homoxintraLI_R=VExintraLIc_R;
% HxI_Rmap.homoxintraLIabs_R=VExintraLIabsc_R;
% HxI_Rmap.homoxintraL_P=homoxintraLc_P;
% HxI_Rmap.homoxintraR_P=homoxintraRc_P;
% HxI_Rmap.homoxintraLI_P=homoxintraLIc_P;
% HxI_Rmap.homoxintraLIabs_P=homoxintraLIabsc_P;

load('/data1/Public/jxhu/results/musician/atlas_Glasser/GR/cifti/scrubbing/Figure/anova/p_heabsLI.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/GR/cifti/scrubbing/Figure/anova/p_heLI.mat');
load('/data1/Public/jxhu/results/musician/atlas_Glasser/GR/cifti/scrubbing/Figure/anova/p_homo.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/GR/cifti/scrubbing/Figure/anova/p_intraabsLI.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/GR/cifti/scrubbing/Figure/anova/p_intraLI.mat');
load('/data1/Public/jxhu/results/musician/atlas_Glasser/GR/cifti/scrubbing/Figure/anova/p_inte.mat');load('/data1/Public/jxhu/results/musician/atlas_Glasser/GR/cifti/scrubbing/Figure/anova/p_seg.mat');
pbon=0.05/180;
[pFDR_homo,~] =FDR(p_homo(1,nid),0.05);[pFDR_inte,~] =FDR(p_inte(1,nid),0.05);[pFDR_seg,~] =FDR(p_seg(1,nid),0.05);
[pFDR_intraLI,~] =FDR(p_intraLI(1,nid),0.05);[pFDR_heLI,~] =FDR(p_heLI(1,nid),0.05);
[pFDR_intraabsLI,~] =FDR(p_intraabsLI(1,nid),0.05);[pFDR_heabsLI,~] =FDR(p_heabsLI(1,nid),0.05);
% VExintraRc_R_thrd=VExintraRc_R .* (VExintraRc_P<0.05);
% VExintraLIc_R_thrd=VExintraLIc_R .* (VExintraLIc_P<0.05) .* (p_intraLI<pbon);
% VExintraLIabsc_R_thrd=VExintraLIabsc_R .* (VExintraLIabsc_P<0.05) .* (p_intraLIabs<pbon);
% VExhomoc_R_thrd=VExhomoc_R .* (VExhomoc_P<0.05) .* (p_homo<pbon);
% VExheLRc_R_thrd=VExheLRc_R .* (VExheLRc_P<0.05);
% VExheRLc_R_thrd=VExheRLc_R .* (VExheRLc_P<0.05);
% VExheLIc_R_thrd=VExheLIc_R .* (VExheLIc_P<0.05) .* (p_heLI<pbon);
% VExheLIabsc_R_thrd=VExheLIabsc_R .* (VExheLIabsc_P<0.05).* (p_heLIabs<pbon);
% VExinteLc_R_thrd=VExinteLc_R .* (VExinteLc_P<0.05);
% VExinteRc_R_thrd=VExinteRc_R .* (VExinteRc_P<0.05);
% VExsegLc_R_thrd=VExsegLc_R .* (VExsegLc_P<0.05);
% % VExsegRc_R_thrd=VExsegRc_R .* (VExsegRc_P<0.05);
% VExintec_R_thrd=VExintec_R .* (VExintec_P<0.05) .* (p_inte<pbon);
% VExsegc_R_thrd=VExsegc_R .* (VExsegc_P<0.05) .* (p_seg<pbon);

% VE_perxintraLc_R_thrd=VE_perxintraLc_R .* (VE_perxintraLc_P<0.05);
% VE_perxintraRc_R_thrd=VE_perxintraRc_R .* (VE_perxintraRc_P<0.05);
% VE_perxintraLIc_R_thrd=VE_perxintraLIc_R .* (VE_perxintraLIc_P<0.05) .* (p_intraLI<pbon);
% VE_perxintraLIabsc_R_thrd=VE_perxintraLIabsc_R .* (VE_perxintraLIabsc_P<0.05).* (p_intraLIabs<pbon);
% VE_perxhomoc_R_thrd=VE_perxhomoc_R .* (VE_perxhomoc_P<0.05).* (p_homo<pbon);
% VE_perxheLRc_R_thrd=VE_perxheLRc_R .* (VE_perxheLRc_P<0.05);
% VE_perxheRLc_R_thrd=VE_perxheRLc_R .* (VE_perxheRLc_P<0.05);
% VE_perxheLIc_R_thrd=VE_perxheLIc_R .* (VE_perxheLIc_P<0.05) .* (p_heLI<pbon);
% VE_perxheLIabsc_R_thrd=VE_perxheLIabsc_R .* (VE_perxheLIabsc_P<0.05).* (p_heLIabs<pbon);
% VE_perxinteLc_R_thrd=VE_perxinteLc_R .* (VE_perxinteLc_P<0.05);
% VE_perxinteRc_R_thrd=VE_perxinteRc_R .* (VE_perxinteRc_P<0.05);
% VE_perxsegLc_R_thrd=VE_perxsegLc_R .* (VE_perxsegLc_P<0.05);
% % VE_perxsegRc_R_thrd=VE_perxsegRc_R .* (VE_perxsegRc_P<0.05);
% VE_perxintec_R_thrd=VE_perxintec_R .* (VE_perxintec_P<0.05).* (p_inte<pbon);
% VE_perxsegc_R_thrd=VE_perxsegc_R .* (VE_perxsegc_P<0.05).* (p_seg<pbon);

% VIxintraLc_R_thrd=VIxintraLc_R .* (VIxintraLc_P<0.05);
% VIxintraRc_R_thrd=VIxintraRc_R .* (VIxintraRc_P<0.05);
% VIxintraLIc_R_thrd=VIxintraLIc_R .* (VIxintraLIc_P<0.05) .* (p_intraLI<pbon);
% VIxintraLIabsc_R_thrd=VIxintraLIabsc_R .* (VIxintraLIabsc_P<0.05) .* (p_intraLIabs<pbon);
% VIxhomoc_R_thrd=VIxhomoc_R .* (VIxhomoc_P<0.05) .* (p_homo<pbon);
% VIxheLRc_R_thrd=VIxheLRc_R .* (VIxheLRc_P<0.05);
% VIxheRLc_R_thrd=VIxheRLc_R .* (VIxheRLc_P<0.05);
% VIxheLIc_R_thrd=VIxheLIc_R .* (VIxheLIc_P<0.05) .* (p_heLI<pbon);
% VIxheLIabsc_R_thrd=VIxheLIabsc_R .* (VIxheLIabsc_P<0.05).* (p_heLIabs<pbon);
% VIxinteLc_R_thrd=VIxinteLc_R .* (VIxinteLc_P<0.05);
% VIxinteRc_R_thrd=VIxinteRc_R .* (VIxinteRc_P<0.05);
% VIxsegLc_R_thrd=VIxsegLc_R .* (VIxsegLc_P<0.05);
% VIxsegRc_R_thrd=VIxsegRc_R .* (VIxsegRc_P<0.05);
% VIxintec_R_thrd=VIxintec_R .* (VIxintec_P<0.05) .* (p_inte<pbon);
% VIxsegc_R_thrd=VIxsegc_R .* (VIxsegc_P<0.05) .* (p_seg<pbon);

% VVxintraLc_R_thrd=VVxintraLc_R .* (VVxintraLc_P<0.05);
% VVxintraRc_R_thrd=VVxintraRc_R .* (VVxintraRc_P<0.05);
% VVxintraLIc_R_thrd=VVxintraLIc_R .* (VVxintraLIc_P<0.05) .* (p_intraLI<pbon);
% VVxintraLIabsc_R_thrd=VVxintraLIabsc_R .* (VVxintraLIabsc_P<0.05) .* (p_intraLIabs<pbon);
% VVxhomoc_R_thrd=VVxhomoc_R .* (VVxhomoc_P<0.05) .* (p_homo<pbon);
% VVxheLRc_R_thrd=VVxheLRc_R .* (VVxheLRc_P<0.05);
% VVxheRLc_R_thrd=VVxheRLc_R .* (VVxheRLc_P<0.05);
% VVxheLIc_R_thrd=VVxheLIc_R .* (VVxheLIc_P<0.05) .* (p_heLI<pbon);
% VVxheLIabsc_R_thrd=VVxheLIabsc_R .* (VVxheLIabsc_P<0.05).* (p_heLIabs<pbon);
% VVxinteLc_R_thrd=VVxinteLc_R .* (VVxinteLc_P<0.05);
% VVxinteRc_R_thrd=VVxinteRc_R .* (VVxinteRc_P<0.05);
% VVxsegLc_R_thrd=VVxsegLc_R .* (VVxsegLc_P<0.05);
% VVxsegRc_R_thrd=VVxsegRc_R .* (VVxsegRc_P<0.05);
% VVxintec_R_thrd=VVxintec_R .* (VVxintec_P<0.05) .* (p_inte<pbon);
% VVxsegc_R_thrd=VVxsegc_R .* (VVxsegc_P<0.05) .* (p_seg<pbon);
% 
WMxintec_R_thrd=WMxintec_R .* (WMxintec_P<0.05) .* (p_inte<pFDR_inte);
WMxsegc_R_thrd=WMxsegc_R .* (WMxsegc_P<0.05) .* (p_seg<pFDR_seg);
WMxheLIc_R_thrd=WMxheLIc_R .* (WMxheLIc_P<0.05) .* (p_heLI<pFDR_heLI);
WMxintraLIc_R_thrd=WMxintraLIc_R .* (WMxintraLIc_P<0.05) .* (p_intraLI<pFDR_intraLI);

% Stroopxintec_R_thrd=Stroopxintec_R .* (Stroopxintec_P<0.05) .* (p_inte<pFDR_inte);
% Stroopxsegc_R_thrd=Stroopxsegc_R .* (Stroopxsegc_P<0.05) .* (p_seg<pFDR_seg);
% StroopxheLIc_R_thrd=StroopxheLIc_R .* (StroopxheLIc_P<0.05) .* (p_heLI<pFDR_heLI);
% StroopxintraLIc_R_thrd=StroopxintraLIc_R .* (StroopxintraLIc_P<0.05) .* (p_intraLI<pFDR_intraLI);

noisexheLIc_R_thrd=noisexheLIc_R .* (noisexheLIc_P<0.05) .* (p_heLI<pFDR_heLI);
noisexintraLIc_R_thrd=noisexintraLIc_R .* (noisexintraLIc_P<0.05) .* (p_intraLI<pFDR_intraLI);
speechxheLIc_R_thrd=speechxheLIc_R .* (speechxheLIc_P<0.05) .* (p_heLI<pFDR_heLI);
speechxintraLIc_R_thrd=speechxintraLIc_R .* (speechxintraLIc_P<0.05) .* (p_intraLI<pFDR_intraLI);
noisexintec_R_thrd=noisexintec_R .* (noisexintec_P<0.05) .* (p_inte<pFDR_inte);
noisexsegc_R_thrd=noisexsegc_R .* (noisexsegc_P<0.05) .* (p_seg<pFDR_seg);
speechxintec_R_thrd=speechxintec_R .* (speechxintec_P<0.05) .* (p_inte<pFDR_inte);
speechxsegc_R_thrd=speechxsegc_R .* (speechxsegc_P<0.05) .* (p_seg<pFDR_seg);
% noise_sepxintec_R_thrd=noise_sepxintec_R .* (noise_sepxintec_P<0.05) .* (p_inte<pFDR_inte);
% noise_sepxsegc_R_thrd=noise_sepxsegc_R .* (noise_sepxsegc_P<0.05) .* (p_seg<pFDR_seg);
% noise_colxintec_R_thrd=noise_colxintec_R .* (noise_colxintec_P<0.05) .* (p_inte<pFDR_inte);
% noise_colxsegc_R_thrd=noise_colxsegc_R .* (noise_colxsegc_P<0.05) .* (p_seg<pFDR_seg);
% speech_sepxintec_R_thrd=speech_sepxintec_R .* (speech_sepxintec_P<0.05) .* (p_inte<pFDR_inte);
% speech_sepxsegc_R_thrd=speech_sepxsegc_R .* (speech_sepxsegc_P<0.05) .* (p_seg<pFDR_seg);
% speech_colxintec_R_thrd=speech_colxintec_R .* (speech_colxintec_P<0.05) .* (p_inte<pFDR_inte);
% speech_colxsegc_R_thrd=speech_colxsegc_R .* (speech_colxsegc_P<0.05) .* (p_seg<pFDR_seg);
if figflag==1

    SaveAsNii(WMxheLIc_R_thrd',[statspath,'/',statename],['_WMxheLI' '_R' '_THRD' '_dlabel'])
    SaveAsNii(WMxintraLIc_R_thrd',[statspath,'/',statename],['_WMxintraLI' '_R' '_THRD' '_dlabel'])
    giiProj2Surf([statspath,'/',statename,'_WMxheLI' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    giiProj2Surf([statspath,'/',statename,'_WMxintraLI' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);

    SaveAsNii(WMxintec_R_thrd',[statspath,'/',statename],['_WMxInte' '_R' '_THRD' '_dlabel'])
    SaveAsNii(WMxsegc_R_thrd',[statspath,'/',statename],['_WMxSeg' '_R' '_THRD' '_dlabel'])
    giiProj2Surf([statspath,'/',statename,'_WMxInte' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    giiProj2Surf([statspath,'/',statename,'_WMxSeg' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
        
    SaveAsNii(noisexheLIc_R_thrd',[statspath,'/',statename],['_noisexheLI' '_R' '_THRD' '_dlabel'])
    SaveAsNii(noisexintraLIc_R_thrd',[statspath,'/',statename],['_noisexintraLI' '_R' '_THRD' '_dlabel'])
    giiProj2Surf([statspath,'/',statename,'_noisexheLI' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    giiProj2Surf([statspath,'/',statename,'_noisexintraLI' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    SaveAsNii(speechxheLIc_R_thrd',[statspath,'/',statename],['_speechxheLI' '_R' '_THRD' '_dlabel'])
    SaveAsNii(speechxintraLIc_R_thrd',[statspath,'/',statename],['_speechxintraLI' '_R' '_THRD' '_dlabel'])
    giiProj2Surf([statspath,'/',statename,'_speechxheLI' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    giiProj2Surf([statspath,'/',statename,'_speechxintraLI' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    SaveAsNii(noisexintec_R_thrd',[statspath,'/',statename],['_noisexInte' '_R' '_THRD' '_dlabel'])
    SaveAsNii(noisexsegc_R_thrd',[statspath,'/',statename],['_noisexSeg' '_R' '_THRD' '_dlabel'])
    giiProj2Surf([statspath,'/',statename,'_noisexInte' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    giiProj2Surf([statspath,'/',statename,'_noisexSeg' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    SaveAsNii(speechxintec_R_thrd',[statspath,'/',statename],['_speechxInte' '_R' '_THRD' '_dlabel'])
    SaveAsNii(speechxsegc_R_thrd',[statspath,'/',statename],['_speechxSeg' '_R' '_THRD' '_dlabel'])
    giiProj2Surf([statspath,'/',statename,'_speechxInte' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    giiProj2Surf([statspath,'/',statename,'_speechxSeg' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    
    SaveAsNii(StroopxheLIc_R_thrd',[statspath,'/',statename],['_StroopxheLI' '_R' '_THRD' '_dlabel'])
    SaveAsNii(StroopxintraLIc_R_thrd',[statspath,'/',statename],['_StroopxintraLI' '_R' '_THRD' '_dlabel'])
    giiProj2Surf([statspath,'/',statename,'_StroopxheLI' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    giiProj2Surf([statspath,'/',statename,'_StroopxintraLI' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    SaveAsNii(Stroopxintec_R_thrd',[statspath,'/',statename],['_StroopxInte' '_R' '_THRD' '_dlabel'])
    SaveAsNii(Stroopxsegc_R_thrd',[statspath,'/',statename],['_StroopxSeg' '_R' '_THRD' '_dlabel'])
    giiProj2Surf([statspath,'/',statename,'_StroopxInte' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    giiProj2Surf([statspath,'/',statename,'_StroopxSeg' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
    
%     SaveAsNii(speech_sepxintec_R_thrd',[statspath,'/',statename],['_speech_sepxInte' '_R' '_THRD' '_dlabel'])
%     SaveAsNii(speech_sepxsegc_R_thrd',[statspath,'/',statename],['_speech_sepxSeg' '_R' '_THRD' '_dlabel'])
%     giiProj2Surf([statspath,'/',statename,'_speech_sepxInte' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
%     giiProj2Surf([statspath,'/',statename,'_speech_sepxSeg' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
%     SaveAsNii(speech_colxintec_R_thrd',[statspath,'/',statename],['_speech_colxInte' '_R' '_THRD' '_dlabel'])
%     SaveAsNii(speech_colxsegc_R_thrd',[statspath,'/',statename],['_speech_colxSeg' '_R' '_THRD' '_dlabel'])
%     giiProj2Surf([statspath,'/',statename,'_speech_colxInte' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
%     giiProj2Surf([statspath,'/',statename,'_speech_colxSeg' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
%     
%     SaveAsNii(noise_sepxintec_R_thrd',[statspath,'/',statename],['_noise_sepxInte' '_R' '_THRD' '_dlabel'])
%     SaveAsNii(noise_sepxsegc_R_thrd',[statspath,'/',statename],['_noise_sepxSeg' '_R' '_THRD' '_dlabel'])
%     giiProj2Surf([statspath,'/',statename,'_noise_sepxInte' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
%     giiProj2Surf([statspath,'/',statename,'_noise_sepxSeg' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
%     SaveAsNii(noise_colxintec_R_thrd',[statspath,'/',statename],['_noise_colxInte' '_R' '_THRD' '_dlabel'])
%     SaveAsNii(noise_colxsegc_R_thrd',[statspath,'/',statename],['_noise_colxSeg' '_R' '_THRD' '_dlabel'])
%     giiProj2Surf([statspath,'/',statename,'_noise_colxInte' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);
%     giiProj2Surf([statspath,'/',statename,'_noise_colxSeg' '_R' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cbc);

%     NiiProj2Surf([statspath,'/',statename,'_VxIntraLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VxIntraLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VxHeLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VxHeLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VxHomo' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
% %     
%     NiiProj2Surf([statspath,'/',statename,'_VExIntraL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExIntraR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExIntraLI' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExIntraLIabs' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExHomo' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExHeLR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExHeRL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExHeLI' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExHeLIabs' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExInteL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExInteR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExSegL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExSegR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VExInte' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VExSeg' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExIntraL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExIntraR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExIntraLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExIntraLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExHomo' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExHeLR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExHeRL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExHeLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExHeLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExInteL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExInteR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExSegL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VExSegR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VExInte' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VExSeg' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxIntraL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxIntraR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxIntraLI' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxIntraLIabs' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxHomo' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxHeLR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxHeRL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxHeLI' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxHeLIabs' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxInteL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxInteR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxSegL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxSegR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VE_perxInte' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VE_perxSeg' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxIntraL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxIntraR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxIntraLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxIntraLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxHomo' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxHeLR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxHeRL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxHeLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxHeLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxInteL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxInteR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxSegL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VE_perxSegR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VE_perxInte' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VE_perxSeg' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    
%     NiiProj2Surf([statspath,'/',statename,'_VIxIntraL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxIntraR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxIntraLI' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxIntraLIabs' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxHomo' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxHeLR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxHeRL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxHeLI' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxHeLIabs' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxInteL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxInteR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxSegL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxSegR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VIxInte' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VIxSeg' '_R' '_map','.nii'],'inf','tri','hemi',cbc); 
%     NiiProj2Surf([statspath,'/',statename,'_VIxIntraL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxIntraR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxIntraLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxIntraLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxHomo' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxHeLR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxHeRL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxHeLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxHeLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxInteL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxInteR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxSegL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VIxSegR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VIxInte' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VIxSeg' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    
%     NiiProj2Surf([statspath,'/',statename,'_VVxIntraL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxIntraR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxIntraLI' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxIntraLIabs' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxHomo' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxHeLR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxHeRL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxHeLI' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxHeLIabs' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxInteL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxInteR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxSegL' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxSegR' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VVxInte' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VVxSeg' '_R' '_map','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxIntraL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxIntraR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxIntraLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxIntraLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxHomo' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxHeLR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxHeRL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxHeLI' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxHeLIabs' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxInteL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxInteR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxSegL' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
%     NiiProj2Surf([statspath,'/',statename,'_VVxSegR' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VVxInte' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    NiiProj2Surf([statspath,'/',statename,'_VVxSeg' '_R' '_THRD','.nii'],'inf','tri','hemi',cbc);
    
    PlotCorr([statspath '/'],[statename '_VxHeLI_avgsubR'],V,ZCX_no0mean((LI_he.* (p_heLI<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VxHeLIabs_avgsubR'],V,ZCX_no0mean((LI_he_abs.* (p_heLIabs<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxHeLI_avgsubR'],VI,ZCX_no0mean((LI_he.* (p_heLI<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxHeLIabs_avgsubR'],VI,ZCX_no0mean((LI_he_abs.* (p_heLIabs<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxHeLI_avgsubR'],VV,ZCX_no0mean((LI_he.* (p_heLI<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxHeLIabs_avgsubR'],VV,ZCX_no0mean((LI_he_abs.* (p_heLIabs<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VExHeLI_avgsubR'],VE,ZCX_no0mean((LI_he.* (p_heLI<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VExHeLIabs_avgsubR'],VE,ZCX_no0mean((LI_he_abs.* (p_heLIabs<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxHeLI_avgsubR'],VE_per,ZCX_no0mean((LI_he.* (p_heLI<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxHeLIabs_avgsubR'],VE_per,ZCX_no0mean((LI_he_abs.* (p_heLIabs<pbon)),2),[FCS_global,cov]);
    
    PlotCorr([statspath '/'],[statename '_VxIntraLI_avgsubR'],V,ZCX_no0mean((LI_intra.* (p_intraLI<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VxIntraLIabs_avgsubR'],V,ZCX_no0mean((LI_intra_abs.* (p_intraLIabs<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxIntraLI_avgsubR'],VI,ZCX_no0mean((LI_intra.* (p_intraLI<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxIntraLIabs_avgsubR'],VI,ZCX_no0mean((LI_intra_abs.* (p_intraLIabs<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxIntraLI_avgsubR'],VV,ZCX_no0mean((LI_intra.* (p_intraLI<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxIntraLIabs_avgsubR'],VV,ZCX_no0mean((LI_intra_abs.* (p_intraLIabs<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VExIntraLI_avgsubR'],VE,ZCX_no0mean((LI_intra.* (p_intraLI<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VExIntraLIabs_avgsubR'],VE,ZCX_no0mean((LI_intra_abs.* (p_intraLIabs<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxIntraLI_avgsubR'],VE_per,ZCX_no0mean((LI_intra.* (p_intraLI<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxIntraLIabs_avgsubR'],VE_per,ZCX_no0mean((LI_intra_abs.* (p_intraLIabs<pbon)),2),[FCS_global,cov]);
    
    PlotCorr([statspath '/'],[statename '_VxInte_avgsubR'],V,ZCX_no0mean((inte.* (p_inte<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VxSeg_avgsubR'],V,ZCX_no0mean((seg.* (p_seg<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxInte_avgsubR'],VI,ZCX_no0mean((inte.* (p_inte<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxSeg_avgsubR'],VI,ZCX_no0mean((seg.* (p_seg<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxInte_avgsubR'],VV,ZCX_no0mean((inte.* (p_inte<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxSeg_avgsubR'],VV,ZCX_no0mean((seg.* (p_seg<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VExInte_avgsubR'],VE,ZCX_no0mean((inte.* (p_inte<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VExSeg_avgsubR'],VE,ZCX_no0mean((seg.* (p_seg<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxInte_avgsubR'],VE_per,ZCX_no0mean((inte.* (p_inte<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxSeg_avgsubR'],VE_per,ZCX_no0mean((seg.* (p_seg<pbon)),2),[FCS_global,cov]);
    
    PlotCorr([statspath '/'],[statename '_VxHomo_avgsubR'],V,ZCX_no0mean((ho_FC.* (p_homo<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxHomo_avgsubR'],VI,ZCX_no0mean((ho_FC.* (p_homo<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxHomo_avgsubR'],VV,ZCX_no0mean((ho_FC.* (p_homo<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VExHomo_avgsubR'],VE,ZCX_no0mean((ho_FC.* (p_homo<pbon)),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxHomo_avgsubR'],VE_per,ZCX_no0mean((ho_FC.* (p_homo<pbon)),2),[FCS_global,cov]);
  
    PlotCorr([statspath '/'],[statename '_VExInte_avgsubR'],VE,mean(inte(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VExSeg_avgsubR'],VE,mean(seg(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxInte_avgsubR'],VE_per,mean(inte(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxSeg_avgsubR'],VE_per,mean(seg(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxInte_avgsubR'],VI,mean(inte(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxSeg_avgsubR'],VI,mean(seg(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxInte_avgsubR'],VV,mean(inte(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxSeg_avgsubR'],VV,mean(seg(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VxInte_avgsubR'],V,mean(inte(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VxSeg_avgsubR'],V,mean(seg(:,nid),2),[FCS_global,cov]);
    
    PlotCorr([statspath '/'],[statename '_VExIntraLI_avgsubR'],VE,mean(LI_intra(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VExHeLI_avgsubR'],VE,mean(LI_he(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxIntraLI_avgsubR'],VE_per,mean(LI_intra(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VE_perxHeLI_avgsubR'],VE_per,mean(LI_he(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxIntraLI_avgsubR'],VI,mean(LI_intra(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VIxHeLI_avgsubR'],VI,mean(LI_he(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxIntraLI_avgsubR'],VV,mean(LI_intra(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VVxHeLI_avgsubR'],VV,mean(LI_he(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VxIntraLI_avgsubR'],V,mean(LI_intra(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VxHeLI_avgsubR'],V,mean(LI_he(:,nid),2),[FCS_global,cov]);
    PlotCorr([statspath '/'],[statename '_VExHomo_avgsubR'],VE,mean(ho_FC(:,nid),2),[FCS_global,cov]);  
    PlotCorr([statspath '/'],[statename '_VIxHomo_avgsubR'],VI,mean(ho_FC(:,nid),2),[FCS_global,cov]);  
    PlotCorr([statspath '/'],[statename '_VVxHomo_avgsubR'],VV,mean(ho_FC(:,nid),2),[FCS_global,cov]);  
    PlotCorr([statspath '/'],[statename '_VE_perxHomo_avgsubR'],VE_per,mean(ho_FC(:,nid),2),[FCS_global,cov]);  
    PlotCorr([statspath '/'],[statename '_VxHomo_avgsubR'],V,mean(ho_FC(:,nid),2),[FCS_global,cov]);  
        
%     PlotCorr([statspath '/'],[statename '_VExIntraL_avgsubR'],VE,mean(intra_LL(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExIntraR_avgsubR'],VE,mean(intra_RR(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExIntraLI_avgsubR'],VE,mean(LI_intra(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExIntraLIabs_avgsubR'],VE,mean(LI_intra_abs(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExHomo_avgsubR'],VE,mean(ho_FC(:,nid),2),[FCS_global,cov]);    
%     PlotCorr([statspath '/'],[statename '_VExHeLR_avgsubR'],VE,mean(he_LR(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExIntraR_avgsubR'],VE,mean(he_RL(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExHeLI_avgsubR'],VE,mean(LI_he(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExHeLIabs_avgsubR'],VE,mean(LI_he_abs(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExInteL_avgsubR'],VE,mean(inte_L(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExInteR_avgsubR'],VE,mean(inte_R(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExSegL_avgsubR'],VE,mean(seg_L(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VExSegR_avgsubR'],VE,mean(seg_R(:,nid),2),[FCS_global,cov]);
%     
%     PlotCorr([statspath '/'],[statename '_VE_perxIntraL_avgsubR'],VE_per,mean(intra_LL(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxIntraR_avgsubR'],VE_per,mean(intra_RR(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxIntraLI_avgsubR'],VE_per,mean(LI_intra(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxIntraLIabs_avgsubR'],VE_per,mean(LI_intra_abs(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxHomo_avgsubR'],VE_per,mean(ho_FC(:,nid),2),[FCS_global,cov]);    
%     PlotCorr([statspath '/'],[statename '_VE_perxHeLR_avgsubR'],VE_per,mean(he_LR(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxIntraR_avgsubR'],VE_per,mean(he_RL(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxHeLI_avgsubR'],VE_per,mean(LI_he(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxHeLIabs_avgsubR'],VE_per,mean(LI_he_abs(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxInteL_avgsubR'],VE_per,mean(inte_L(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxInteR_avgsubR'],VE_per,mean(inte_R(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxSegL_avgsubR'],VE_per,mean(seg_L(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VE_perxSegR_avgsubR'],VE_per,mean(seg_R(:,nid),2),[FCS_global,cov]);
%     
%     PlotCorr([statspath '/'],[statename '_VIxIntraL_avgsubR'],VI,mean(intra_LL(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxIntraR_avgsubR'],VI,mean(intra_RR(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxIntraLI_avgsubR'],VI,mean(LI_intra(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxIntraLIabs_avgsubR'],VI,mean(LI_intra_abs(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxHomo_avgsubR'],VI,mean(ho_FC(:,nid),2),[FCS_global,cov]);    
%     PlotCorr([statspath '/'],[statename '_VIxHeLR_avgsubR'],VI,mean(he_LR(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxIntraR_avgsubR'],VI,mean(he_RL(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxHeLI_avgsubR'],VI,mean(LI_he(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxHeLIabs_avgsubR'],VI,mean(LI_he_abs(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxInteL_avgsubR'],VI,mean(inte_L(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxInteR_avgsubR'],VI,mean(inte_R(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxSegL_avgsubR'],VI,mean(seg_L(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VIxSegR_avgsubR'],VI,mean(seg_R(:,nid),2),[FCS_global,cov]);
%     
%     PlotCorr([statspath '/'],[statename '_VVxIntraL_avgsubR'],VV,mean(intra_LL(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxIntraR_avgsubR'],VV,mean(intra_RR(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxIntraLI_avgsubR'],VV,mean(LI_intra(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxIntraLIabs_avgsubR'],VV,mean(LI_intra_abs(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxHomo_avgsubR'],VV,mean(ho_FC(:,nid),2),[FCS_global,cov]);    
%     PlotCorr([statspath '/'],[statename '_VVxHeLR_avgsubR'],VV,mean(he_LR(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxIntraR_avgsubR'],VV,mean(he_RL(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxHeLI_avgsubR'],VV,mean(LI_he(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxHeLIabs_avgsubR'],VV,mean(LI_he_abs(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxInteL_avgsubR'],VV,mean(inte_L(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxInteR_avgsubR'],VV,mean(inte_R(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxSegL_avgsubR'],VV,mean(seg_L(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_VVxSegR_avgsubR'],VV,mean(seg_R(:,nid),2),[FCS_global,cov]);
    
%     SysDiv2Plot('Yeo7',[statename,'_HomoxIntraL_avgsubR'],[statspath '/'],fisherR2Z(homoxintraLc_R));
%     SysDiv2Plot('Yeo7',[statename,'_HomoxIntraR_avgsubR'],[statspath '/'],fisherR2Z(homoxintraRc_R));
%     SysDiv2Plot('Yeo7',[statename,'_HomoxIntraLI_avgsubR'],[statspath '/'],fisherR2Z(homoxintraLIc_R));
%     SysDiv2Plot('Yeo7',[statename,'_HomoxIntraLIabs_avgsubR'],[statspath '/'],fisherR2Z(homoxintraLIabsc_R));
% %     SysDiv2Plot('Yeo7',[statename,'_IntraLxIntraR_avgsubR'],[statspath '/'],fisherR2Z(intraLxintraRc_R));
% %     
% %     SysDiv2Plot('Hierarchy',[statename,'_HomoxIntraL_avgsubR'],[statspath '/'],fisherR2Z(homoxintraLc_R));
% %     SysDiv2Plot('Hierarchy',[statename,'_HomoxIntraR_avgsubR'],[statspath '/'],fisherR2Z(homoxintraRc_R));
% %     SysDiv2Plot('Hierarchy',[statename,'_HomoxIntraLI_avgsubR'],[statspath '/'],fisherR2Z(homoxintraLIc_R));
%     SysDiv2Plot('Hierarchy',[statename,'_HomoxIntraLIabs_avgsubR'],[statspath '/'],fisherR2Z(homoxintraLIabsc_R));
% %     SysDiv2Plot('Hierarchy',[statename,'_IntraLxIntraR_avgsubR'],[statspath '/'],fisherR2Z(intraLxintraRc_R));
    
end


%% Each subject -- across regions 
for i=1:length(subid)
    IntraL_sub=intra_LL(i,nid)';
    IntraR_sub=intra_RR(i,nid)';
    HomoFC_sub=ho_FC(i,nid)';
    LI_sub=LI_intra(i,nid)';
    LI_abs_sub=LI_intra_abs(i,nid)';
    
%     [~,p_intraLxintraRt_sub(i,1),~,stats1]=ttest(IntraL_sub,IntraR_sub);
%     t_intraLxintraRt_sub(i,1)=stats1.tstat;     

%     [homoxintraLc_R_sub(i,1),homoxintraLc_P_sub(i,1)]=corr(HomoFC_sub,IntraL_sub);     
%     [homoxintraRc_R_sub(i,1),homoxintraRc_P_sub(i,1)]=corr(HomoFC_sub,IntraR_sub);    
%     [homoxintraLIc_R_sub(i,1),homoxintraLIc_P_sub(i,1)]=corr(HomoFC_sub,LI_sub);
    [homoxintraLIabsc_R_sub(i,1),homoxintraLIabsc_P_sub(i,1)]=corr(HomoFC_sub,LI_abs_sub);   
%     [intraLxintraRc_R_sub(i,1),intraLxintraRc_P_sub(i,1)]=corr(IntraL_sub,IntraR_sub);
end

% HxI_Rsub.homoxintraL_R=homoxintraLc_R_sub;
% HxI_Rsub.homoxintraR_R=homoxintraRc_R_sub;
% HxI_Rsub.homoxintraLI_R=homoxintraLIc_R_sub;
HxI_Rsub.homoxintraLIabs_R=homoxintraLIabsc_R_sub;
% HxI_Rsub.homoxintraL_P=homoxintraLc_P_sub;
% HxI_Rsub.homoxintraR_P=homoxintraRc_P_sub;
% HxI_Rsub.homoxintraLI_P=homoxintraLIc_P_sub;
HxI_Rsub.homoxintraLIabs_P=homoxintraLIabsc_P_sub;
% 

% if figflag==1
    
%     hist_lxy(t_intraLxintraRt_sub,gt_intraLxintraR,statspath,[statename '_IntraLxIntraR_mapT_hist']);
%     
%     hist_lxy(homoxintraLc_R_sub,gr_homoxintraL,statspath,[statename '_HomoxIntraL_mapR_hist']);
%     hist_lxy(homoxintraRc_R_sub,gr_homoxintraR,statspath,[statename '_HomoxIntraR_mapR_hist']);
%     hist_lxy(homoxintraLIc_R_sub,gr_homoxintraLI,statspath,[statename '_HomoxIntraLI_mapR_hist']);
%     hist_lxy(homoxintraLIabsc_R_sub1,homoxintraLIabsc_R_sub,gr_homoxintraLIabs,statspath,[statename '_HomoxIntraLIabs_mapR_hist']);
%     hold on;
%     hist_lxy(homoxintraLIabsc_R_sub,gr_homoxintraLIabs,statspath,[statename '_HomoxIntraLIabs_mapR_hist']);
% end

end