% Part2 interaction and main effect
% [num,txt,raw]=xlsread('Camfmri_information.xlsx')

%%% erfenbianliang
nid=[1:180];
load('/data1/Public/jxhu/results/musician/behavior_scores.mat');[C,is,iS]=intersect(behav(:,5),FCS_all.subid);Gender = term( var2fac(behav(is,6)) );age=behav(is,7);Age=term(age);global_signal=FCS_all.global(iS,:);Global=term(global_signal);
a=var2fac(behav(is,2)) ;m=var2fac(behav(is,4)) ;education=behav(is,11);Education=term(education);
for ii=1:length(a);
 if isequal(a{ii,1},'1');
     a{ii,1}='young';
 elseif isequal(a{ii,1},'2')
     a{ii,1}='old';
 end
end
for ii=1:length(m);
 if isequal(m{ii,1},'1');
     m{ii,1}='NM';
 elseif isequal(m{ii,1},'2')
     m{ii,1}='M';
 end
end
A=term(a);M=term(m);

M1= 1 + A + M+A*M+Gender+Global+Education;M2= 1 + A+M+Gender+Global+Education;
slm1 = SurfStatLinMod(FCS_all.inte(iS,:),M1);slm2 = SurfStatLinMod(FCS_all.inte(iS,:),M2);
slm3 = SurfStatLinMod(FCS_all.seg(iS,:),M1);slm4 = SurfStatLinMod(FCS_all.seg(iS,:),M2);
slm_inte_AxM=SurfStatF(slm1,slm2);slm_seg_AxM=SurfStatF(slm3,slm4);
slm5 = SurfStatLinMod(FCS_all.intra_LI(iS,:),M1);slm6 = SurfStatLinMod(FCS_all.intra_LI(iS,:),M2);
slm7 = SurfStatLinMod(FCS_all.intra_absLI(iS,:),M1);slm8 = SurfStatLinMod(FCS_all.intra_absLI(iS,:),M2);
slm_intraLI_AxM=SurfStatF(slm5,slm6);slm_intraabsLI_AxM=SurfStatF(slm7,slm8);
slm9 = SurfStatLinMod(FCS_all.he_LI(iS,:),M1);slm10 = SurfStatLinMod(FCS_all.he_LI(iS,:),M2);
slm11 = SurfStatLinMod(FCS_all.he_absLI(iS,:),M1);slm12 = SurfStatLinMod(FCS_all.he_absLI(iS,:),M2);
slm_heLI_AxM=SurfStatF(slm9,slm10);slm_heabsLI_AxM=SurfStatF(slm11,slm12);
slm13 = SurfStatLinMod(FCS_all.homo(iS,:),M1);slm14 = SurfStatLinMod(FCS_all.homo(iS,:),M2);slm_homo_AxM=SurfStatF(slm13,slm14);

p_inte=fcdf(slm_inte_AxM.t,slm1.df,slm2.df,'upper');p_seg=fcdf(slm_seg_AxM.t,slm3.df,slm4.df,'upper');p_homo=fcdf(slm_homo_AxM.t,slm13.df,slm14.df,'upper');
p_intraLI=fcdf(slm_intraLI_AxM.t,slm5.df,slm6.df,'upper');p_intraabsLI=fcdf(slm_intraabsLI_AxM.t,slm7.df,slm8.df,'upper');
p_heLI=fcdf(slm_heLI_AxM.t,slm9.df,slm10.df,'upper');p_heabsLI=fcdf(slm_heabsLI_AxM.t,slm11.df,slm12.df,'upper');
save(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/', 'p_inte.mat'],'p_inte');
save(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/', 'p_seg.mat'],'p_seg');
save(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/', 'p_heLI.mat'],'p_heLI');
save(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/', 'p_heabsLI.mat'],'p_heabsLI');
save(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/', 'p_intraLI.mat'],'p_intraLI');
save(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/', 'p_intraabsLI.mat'],'p_intraabsLI');
save(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/', 'p_homo.mat'],'p_homo');

% SaveAsNii(slm_homo_AxM.t',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['homo_AxM' '_F' '_dlabel'])
% giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','homo_AxM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
% SaveAsNii(slm_seg_AxM.t',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['seg_AxM' '_F' '_dlabel'])
% giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','seg_AxM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
% SaveAsNii(slm_inte_AxM.t',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['inte_AxM' '_F' '_dlabel'])
% giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','inte_AxM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
% SaveAsNii(slm_intraLI_AxM.t',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['intraLI_AxM' '_F' '_dlabel'])
% giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','intraLI_AxM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
% SaveAsNii(slm_intraabsLI_AxM.t',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['intraabsLI_AxM' '_F' '_dlabel'])
% giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','intraabsLI_AxM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
% SaveAsNii(slm_heLI_AxM.t',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['heLI_AxM' '_F' '_dlabel'])
% giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','heLI_AxM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
% SaveAsNii(slm_heabsLI_AxM.t',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['heabsLI_AxM' '_F' '_dlabel'])
% giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','heabsLI_AxM' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);


pbon=0.05/180;
[pFDR_homo,~] =FDR(p_homo(1,nid),0.05);[pFDR_inte,~] =FDR(p_inte(1,nid),0.05);[pFDR_seg,~] =FDR(p_seg(1,nid),0.05);
[pFDR_intraLI,~] =FDR(p_intraLI(1,nid),0.05);[pFDR_intraabsLI,~] =FDR(p_intraabsLI(1,nid),0.05);[pFDR_heLI,~] =FDR(p_heLI(1,nid),0.05);[pFDR_heabsLI,~] =FDR(p_heabsLI(1,nid),0.05);
homo_AxM_thrd=slm_homo_AxM.t .* (p_homo<pFDR_homo);
SaveAsNii(homo_AxM_thrd',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['homo_AxM_thrd' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','homo_AxM_thrd' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
seg_AxM_thrd=slm_seg_AxM.t .* (p_seg<pFDR_seg);
SaveAsNii(seg_AxM_thrd',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['seg_AxM_thrd' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','seg_AxM_thrd' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
inte_AxM_thrd=slm_inte_AxM.t .* (p_inte<pFDR_inte);
SaveAsNii(inte_AxM_thrd',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['inte_AxM_thrd' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','inte_AxM_thrd' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
intraLI_AxM_thrd=slm_intraLI_AxM.t .* (p_intraLI<pFDR_intraLI);
SaveAsNii(intraLI_AxM_thrd',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['intraLI_AxM_thrd' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','intraLI_AxM_thrd' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
heLI_AxM_thrd=slm_heLI_AxM.t .* (p_heLI<pFDR_heLI);
SaveAsNii(heLI_AxM_thrd',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['heLI_AxM_thrd' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','heLI_AxM_thrd' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
% intraabsLI_AxM_thrd=slm_intraabsLI_AxM.t .* (p_intraabsLI<pFDR_intraabsLI);
% SaveAsNii(intraabsLI_AxM_thrd',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['intraabsLI_AxM_thrd' '_F' '_dlabel'])
% giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','intraabsLI_AxM_thrd' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);
% heabsLI_AxM_thrd=slm_heabsLI_AxM.t .* (p_heabsLI<pFDR_heabsLI);
% SaveAsNii(heabsLI_AxM_thrd',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['heabsLI_AxM_thrd' '_F' '_dlabel'])
% giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','heabsLI_AxM_thrd' '_F' '_dlabel','.nii'],'inf','tri','hemi',[0,7]);

%%%zhuxiaoying
contrast_aging = A.old-A.young;contrast_music = M.M-M.NM;
slm_inte_aging=SurfStatT(slm2,contrast_aging);slm_seg_aging=SurfStatT(slm4,contrast_aging);
p_inte_aging=2*tcdf(-1*abs(slm_inte_aging.t),slm_inte_aging.df);p_seg_aging=2*tcdf(-1*abs(slm_seg_aging.t),slm_seg_aging.df);
slm_inte_music=SurfStatT(slm2,contrast_music);slm_seg_music=SurfStatT(slm4,contrast_music);
p_inte_music=2*tcdf(-1*abs(slm_inte_music.t),slm_inte_music.df);p_seg_music=2*tcdf(-1*abs(slm_seg_music.t),slm_seg_music.df);
slm_intraLI_aging=SurfStatT(slm6,contrast_aging);slm_intraLIabs_aging=SurfStatT(slm8,contrast_aging);
p_intraLI_aging=2*tcdf(-1*abs(slm_intraLI_aging.t),slm_intraLI_aging.df);p_intraLIabs_aging=2*tcdf(-1*abs(slm_intraLIabs_aging.t),slm_intraLIabs_aging.df);
slm_intraLI_music=SurfStatT(slm6,contrast_music);slm_intraLIabs_music=SurfStatT(slm8,contrast_music);
p_intraLI_music=2*tcdf(-1*abs(slm_intraLI_music.t),slm_intraLI_music.df);p_intraLIabs_music=2*tcdf(-1*abs(slm_intraLIabs_music.t),slm_intraLIabs_music.df);
slm_heLI_aging=SurfStatT(slm10,contrast_aging);slm_heLIabs_aging=SurfStatT(slm12,contrast_aging);
p_heLI_aging=2*tcdf(-1*abs(slm_heLI_aging.t),slm_heLI_aging.df);p_heLIabs_aging=2*tcdf(-1*abs(slm_heLIabs_aging.t),slm_heLIabs_aging.df);
slm_heLI_music=SurfStatT(slm10,contrast_music);slm_heLIabs_music=SurfStatT(slm12,contrast_music);
p_heLI_music=2*tcdf(-1*abs(slm_heLI_music.t),slm_heLI_music.df);p_heLIabs_music=2*tcdf(-1*abs(slm_heLIabs_music.t),slm_heLIabs_music.df);
slm_homo_aging=SurfStatT(slm14,contrast_aging);p_homo_aging=2*tcdf(-1*abs(slm_homo_aging.t),slm_homo_aging.df);
slm_homo_music=SurfStatT(slm14,contrast_music);p_homo_music=2*tcdf(-1*abs(slm_homo_music.t),slm_homo_music.df);

seg_aging=slm_seg_aging.t .* (p_seg_aging<0.05);inte_aging=slm_inte_aging.t .* (p_inte_aging<0.05);seg_music=slm_seg_music.t .* (p_seg_music<0.05);inte_music=slm_inte_music.t .* (p_inte_music<0.05);
SaveAsNii(seg_aging',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['seg_aging' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','seg_aging' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-3,3]);
SaveAsNii(inte_aging',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['inte_aging' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','inte_aging' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-3,3]);
SaveAsNii(seg_music',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['seg_music' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','seg_music' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-3,3]);
SaveAsNii(inte_music',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['inte_music' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','inte_music' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-3,3]);

intraLI_aging=slm_intraLI_aging.t .* (p_intraLI_aging<0.05);intraLIabs_aging=slm_intraLIabs_aging.t .* (p_intraLIabs_aging<0.05);intraLI_music=slm_intraLI_music.t .* (p_intraLI_music<0.05);intraLIabs_music=slm_intraLIabs_music.t .* (p_intraLIabs_music<0.05);
heLI_aging=slm_heLI_aging.t .* (p_heLI_aging<0.05);heLIabs_aging=slm_heLIabs_aging.t .* (p_heLIabs_aging<0.05);heLI_music=slm_heLI_music.t .* (p_heLI_music<0.05);heLIabs_music=slm_heLIabs_music.t .* (p_heLIabs_music<0.05);
SaveAsNii(intraLI_aging',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['intraLI_aging' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','intraLI_aging' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-3,3]);
SaveAsNii(heLI_aging',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['heLI_aging' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','heLI_aging' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-3,3]);
SaveAsNii(intraLI_music',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['intraLI_music' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','intraLI_music' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-3,3]);
SaveAsNii(heLI_music',['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/'],['heLI_music' '_F' '_dlabel'])
giiProj2Surf(['/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/anova/','heLI_music' '_F' '_dlabel','.nii'],'inf','tri','hemi',[-3,3]);
homo_aging=slm_homo_aging.t .* (p_homo_aging<0.05);homo_music=slm_homo_music.t .* (p_homo_music<0.05);
SaveAsAtlasNii(homo_aging,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['homo_A' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','homo_A' '_T' '_map','.nii'],'inf','tri','hemi',[-3,3]);
SaveAsAtlasNii(homo_music,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['homo_M' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','homo_M' '_T' '_map','.nii'],'inf','tri','hemi',[-3,3]);

[pFDR_inte_aging,~] =FDR(p_inte_aging(1,nid),0.05);[pFDR_seg_aging,~] =FDR(p_seg_aging(1,nid),0.05);[pFDR_inte_music,~] =FDR(p_inte_music(1,nid),0.05);[pFDR_seg_music,~] =FDR(p_seg_music(1,nid),0.05);
[pFDR_inraLI_aging,~] =FDR(p_intraLI_aging(1,nid),0.05);[pFDR_heLI_aging,~] =FDR(p_heLI_aging(1,nid),0.05);[pFDR_intraLI_music,~] =FDR(p_intraLI_music(1,nid),0.05);[pFDR_heLI_music,~] =FDR(p_heLI_music(1,nid),0.05);
seg_aging_thrd=slm_seg_aging.t .* (p_seg_aging<pbon); seg_music_thrd=slm_seg_music.t .* (p_seg_music<pbon);
inte_aging_thrd=slm_inte_aging.t .* (p_inte_aging<pbon); inte_music_thrd=slm_inte_music.t .* (p_inte_music<pbon);
SaveAsAtlasNii(seg_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['seg_A_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','seg_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
SaveAsAtlasNii(seg_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['seg_M_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','seg_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
SaveAsAtlasNii(inte_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['inte_A_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','inte_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
SaveAsAtlasNii(inte_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['inte_M_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','inte_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
intraLI_aging_thrd=slm_intraLI_aging.t .* (p_intraLI_aging<pbon); intraLI_music_thrd=slm_intraLI_music.t .* (p_intraLI_music<pbon);
intraLIabs_aging_thrd=slm_intraLIabs_aging.t .* (p_intraLIabs_aging<pbon); intraLIabs_music_thrd=slm_intraLIabs_music.t .* (p_intraLIabs_music<pbon);
SaveAsAtlasNii(intraLI_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLI_A_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLI_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
SaveAsAtlasNii(intraLIabs_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLIabs_A_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLIabs_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
SaveAsAtlasNii(intraLI_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLI_M_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLI_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
SaveAsAtlasNii(intraLIabs_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLIabs_M_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLIabs_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
heLI_aging_thrd=slm_heLI_aging.t .* (p_heLI_aging<pbon); heLI_music_thrd=slm_heLI_music.t .* (p_heLI_music<pbon);
heLIabs_aging_thrd=slm_heLIabs_aging.t .* (p_heLIabs_aging<pbon); heLIabs_music_thrd=slm_heLIabs_music.t .* (p_heLIabs_music<pbon);
SaveAsAtlasNii(heLI_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLI_A_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLI_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
SaveAsAtlasNii(heLIabs_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLIabs_A_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLIabs_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
SaveAsAtlasNii(heLI_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLI_M_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLI_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
SaveAsAtlasNii(heLIabs_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLIabs_M_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLIabs_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
homo_aging_thrd=slm_homo_aging.t .* (p_homo_aging<pbon); homo_music_thrd=slm_homo_music.t .* (p_homo_music<pbon);
SaveAsAtlasNii(homo_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['homo_A_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','homo_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
SaveAsAtlasNii(homo_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['homo_M_thrd' '_T' '_map'],1)
NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','homo_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);

% %%%jiaohubuxianzhu
% seg_aging=slm_seg_aging.t .* (~(p_seg<pbon));inte_aging=slm_inte_aging.t .* (~(p_inte<pbon));seg_music=slm_seg_music.t .* (~(p_seg<pbon));inte_music=slm_inte_music.t .* (~(p_inte<pbon));
% SaveAsAtlasNii(seg_aging,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['seg_A' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','seg_A' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(inte_aging,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['inte_A' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','inte_A' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(seg_music,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['seg_M' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','seg_M' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(inte_music,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['inte_M' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','inte_M' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% intraLI_aging=slm_intraLI_aging.t .* (~(p_intraLI<pbon));intraLIabs_aging=slm_intraLIabs_aging.t .* (~(p_intraLIabs<pbon));intraLI_music=slm_intraLI_music.t .* (~(p_intraLI<pbon));intraLIabs_music=slm_intraLIabs_music.t .* (~(p_intraLIabs<pbon));
% SaveAsAtlasNii(intraLI_aging,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLI_A' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLI_A' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(intraLIabs_aging,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLIabs_A' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLIabs_A' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(intraLI_music,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLI_M' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLI_M' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(intraLIabs_music,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLIabs_M' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLIabs_M' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% heLI_aging=slm_heLI_aging.t .* (~(p_heLI<pbon));heLIabs_aging=slm_heLIabs_aging.t .* (~(p_heLIabs<pbon));heLI_music=slm_heLI_music.t .* (~(p_heLI<pbon));heLIabs_music=slm_heLIabs_music.t .* (~(p_heLIabs<pbon));
% SaveAsAtlasNii(heLI_aging,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLI_A' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLI_A' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(heLIabs_aging,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLIabs_A' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLIabs_A' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(heLI_music,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLI_M' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLI_M' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(heLIabs_music,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLIabs_M' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLIabs_M' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% homo_aging=slm_homo_aging.t .* (~(p_homo<pbon));homo_music=slm_homo_music.t .* (~(p_homo<pbon));
% SaveAsAtlasNii(homo_aging,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['homo_A' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','homo_A' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(homo_music,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['homo_M' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','homo_M' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% 
% seg_aging_thrd=seg_aging .* (p_seg_aging< (0.05/(sum(~(p_seg<pbon))))); seg_music_thrd=seg_music .* (p_seg_music<(0.05/(sum(~(p_seg<pbon)))));
% inte_aging_thrd=inte_aging .* (p_inte_aging<(0.05/(sum(~(p_inte<pbon))))); inte_music_thrd=inte_music .* (p_inte_music<(0.05/(sum(~(p_inte<pbon)))));
% SaveAsAtlasNii(seg_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['seg_A_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','seg_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(seg_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['seg_M_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','seg_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(inte_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['inte_A_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','inte_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(inte_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['inte_M_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','inte_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% intraLI_aging_thrd=intraLI_aging .* (p_intraLI_aging< (0.05/(sum(~(p_intraLI<pbon))))); intraLI_music_thrd=intraLI_music .* (p_intraLI_music<(0.05/(sum(~(p_intraLI<pbon)))));
% intraLIabs_aging_thrd=intraLIabs_aging .* (p_intraLIabs_aging<(0.05/(sum(~(p_intraLIabs<pbon))))); intraLIabs_music_thrd=intraLIabs_music .* (p_intraLIabs_music<(0.05/(sum(~(p_intraLIabs<pbon)))));
% SaveAsAtlasNii(intraLI_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLI_A_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLI_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(intraLIabs_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLIabs_A_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLIabs_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(intraLI_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLI_M_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLI_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(intraLIabs_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['intraLIabs_M_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','intraLIabs_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% heLI_aging_thrd=heLI_aging .* (p_heLI_aging< (0.05/(sum(~(p_heLI<pbon))))); heLI_music_thrd=heLI_music .* (p_heLI_music<(0.05/(sum(~(p_heLI<pbon)))));
% heLIabs_aging_thrd=heLIabs_aging .* (p_heLIabs_aging<(0.05/(sum(~(p_heLIabs<pbon))))); heLIabs_music_thrd=heLIabs_music .* (p_heLIabs_music<(0.05/(sum(~(p_heLIabs<pbon)))));
% SaveAsAtlasNii(heLI_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLI_A_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLI_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(heLIabs_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLIabs_A_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLIabs_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(heLI_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLI_M_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLI_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(heLIabs_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['heLIabs_M_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','heLIabs_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% homo_aging_thrd=homo_aging .* (p_homo_aging< (0.05/(sum(~(p_homo<pbon))))); homo_music_thrd=homo_music .* (p_homo_music<(0.05/(sum(~(p_homo<pbon)))));
% SaveAsAtlasNii(homo_aging_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['homo_A_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','homo_A_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% SaveAsAtlasNii(homo_music_thrd,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/'],['homo_M_thrd' '_T' '_map'],1)
% NiiProj2Surf(['/data1/Public/jxhu/results/musician/AICHA/NGR/anova/','homo_M_thrd' '_T' '_map','.nii'],'inf','tri','hemi',[-4,4]);
% slm_interaction=SurfStatT(slm,age.*Gender.gender1-age.*Gender.gender2);%�����߽�������
% 
% p_age=2*tcdf(-1*abs(slm_age.t),slm_age.df);
% p_inte_aging=2*tcdf(-1*abs(slm_inte_aging.t),slm_inte_aging.df);
% p_interaction=2*tcdf(-1*abs(slm_interaction.t),slm_interaction.df);
% t_age=slm_age.t';
% t_gender=slm_inte_aging.t';
% t_interaction=slm_interaction.t';

% id_age=find(p_age>0.05/186);
% t_age(id_age,1)=0;
% Tvalue1=t_age;
% pt1=FDR(p_age,0.05);
% id1=find(p_age>pt1);
% Tvalue1(id1,1)=0;
% 
% id_gender=find(p_gender>0.05/186);
% t_gender(id_gender,1)=0;
% 
% 
% id_interaction=find(p_interaction>0.05/186);
% t_interaction(id_interaction,1)=0;

figure
SurfStatPlot( Age, LI, M1, [], 'LineWidth',2, 'MarkerSize',12 );


for i=2:653
 
    ID(i,1)=str2double(txt{i,1}(3:end))    
end
