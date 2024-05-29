function genbaselinemap(FCS,subid,statpath,statename)
% baseline

statspath1=statpath{2};
statspath2=statpath{5};
statspath3=statpath{1};
statspath4=statpath{3};
statspath5=statpath{4};

%% Group mean - Across subject

[~,~,iS]=intersect(subid,FCS.subid);

ho_FC=FCS.homo(iS,:);
LI_he=FCS.he_LI(iS,:);
LI_intra=FCS.intra_LI(iS,:);
inte=FCS.inte(iS,:);
seg=FCS.seg(iS,:);

% LI_he_abs=FCS.he_absLI(iS,:);
% LI_intra_abs=FCS.intra_absLI(iS,:);
% he_LR=FCS.he_LR(iS,:);
% he_RL=FCS.he_RL(iS,:);
% intra_LL=FCS.intra_LL(iS,:);
% intra_RR=FCS.intra_RR(iS,:);
% inte_L=FCS.inteL(iS,:);
% inte_R=FCS.inteR(iS,:);
% seg_L=FCS.segL(iS,:);
% seg_R=FCS.segR(iS,:);



HomoFC_mean=mean(ho_FC)';Seg_mean=mean(seg)';Inte_mean=mean(inte)';LI_mean_intra=mean(LI_intra)';LI_mean_he=mean(LI_he)';
% IntraL_mean=mean(intra_LL)';IntraR_mean=mean(intra_RR)';
% HeLR_mean=mean(he_LR)';HeRL_mean=mean(he_RL)';
% SegL_mean=mean(seg_L)';SegR_mean=mean(seg_R)';
% InteL_mean=mean(inte_L)';InteR_mean=mean(inte_R)';


% IntraL_std=std(intra_LL)';
% IntraR_std=std(intra_RR)';
% HeLR_std=std(he_LR)';
% HeRL_std=std(he_RL)';
% HomoFC_std=std(ho_FC)';


% SaveAsAtlasNii(IntraL_mean,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath1,'/',statename],'IntraL_mean',1)
% SaveAsAtlasNii(IntraR_mean,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath2,'/',statename],'IntraR_mean',1)
% SaveAsAtlasNii(HeLR_mean,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath1,'/',statename],'HeLR_mean',1)
% SaveAsAtlasNii(HeRL_mean,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath2,'/',statename],'HeRL_mean',1)
% SaveAsAtlasNii(InteL_mean,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath1,'/',statename],'InteL_mean',1)
% SaveAsAtlasNii(InteR_mean,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath2,'/',statename],'InteR_mean',1)
% SaveAsAtlasNii(SegL_mean,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath1,'/',statename],'SegL_mean',1)
% SaveAsAtlasNii(SegR_mean,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath2,'/',statename],'SegR_mean',1)
% SaveAsAtlasNii(HomoFC_mean,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath3,'/',statename],'HomoFC_mean',1)
% SaveAsAtlasNii(IntraL_std,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath1,'/',statename],'IntraL_std',1)
% SaveAsAtlasNii(IntraR_std,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath2,'/',statename],'IntraR_std',1)
% SaveAsAtlasNii(HeLR_std,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath1,'/',statename],'HeLR_std',1)
% SaveAsAtlasNii(HeRL_std,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath2,'/',statename],'HeRL_std',1)
% SaveAsAtlasNii(HomoFC_std,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath3,'/',statename],'HomoFC_std',1)
% 
% 
% 
% 
% NiiProj2Surf([statspath1,'/',statename,'IntraL_mean','.nii'],'inf','tri','hemi',[0 130]);
% NiiProj2Surf([statspath2,'/',statename,'IntraR_mean','.nii'],'inf','tri','hemi',[0 130]);
% NiiProj2Surf([statspath1,'/',statename,'HeLR_mean','.nii'],'inf','tri','hemi',[0 130]);
% NiiProj2Surf([statspath2,'/',statename,'HeRL_mean','.nii'],'inf','tri','hemi',[0 130]);
% NiiProj2Surf([statspath1,'/',statename,'InteL_mean','.nii'],'inf','tri','hemi',[0 250]);
% NiiProj2Surf([statspath2,'/',statename,'InteR_mean','.nii'],'inf','tri','hemi',[0 250]);
% NiiProj2Surf([statspath1,'/',statename,'SegL_mean','.nii'],'inf','tri','hemi',[0 15]);
% NiiProj2Surf([statspath2,'/',statename,'SegR_mean','.nii'],'inf','tri','hemi',[0 15]);
% NiiProj2Surf([statspath3,'/',statename,'HomoFC_mean','.nii'],'inf','tri','hemi',[0 2.1]);
% NiiProj2Surf([statspath1,'/',statename,'IntraL_std','.nii'],'inf','tri','hemi',[0 45]);
% NiiProj2Surf([statspath2,'/',statename,'IntraR_std','.nii'],'inf','tri','hemi',[0 45]);
% NiiProj2Surf([statspath1,'/',statename,'HeLR_std','.nii'],'inf','tri','hemi',[0 45]);
% NiiProj2Surf([statspath2,'/',statename,'HeRL_std','.nii'],'inf','tri','hemi',[0 45]);
% NiiProj2Surf([statspath3,'/',statename,'HomoFC_std','.nii'],'inf','tri','hemi',[0 0.4]);

% 
% absLI_mean_intra=mean(LI_intra_abs)';absLI_mean_he=mean(LI_he_abs)';
% 
% LI_std_intra=std(LI_intra)';
% absLI_std_intra=std(LI_intra_abs)';
% LI_std_he=std(LI_he)';
% absLI_std_he=std(LI_he_abs)';
SaveAsNii(HomoFC_mean,[statspath3,'/',statename],'HomoFC_mean_dlabel')
SaveAsNii(LI_mean_intra,[statspath4,'/',statename],'IntraFC_LI_mean_dlabel')
SaveAsNii(LI_mean_he,[statspath4,'/',statename],'HeFC_LI_mean_dlabel')
SaveAsNii(Inte_mean,[statspath4,'/',statename],'Inte_mean_dlabel')
SaveAsNii(Seg_mean,[statspath4,'/',statename],'Seg_mean_dlabel')
% SaveAsNii(absLI_mean_intra,[statspath5,'/',statename],'IntraFC_LIabs_mean_dlabel')
% SaveAsNii(absLI_mean_he,[statspath5,'/',statename],'HeFC_LIabs_mean_dlabel')
% SaveAsNii(IntraL_mean,[statspath4,'/',statename],'IntraL_mean_dlabel')
% SaveAsNii(HeLR_mean,[statspath4,'/',statename],'HeLR_mean_dlabel')
% SaveAsNii(IntraR_mean,[statspath4,'/',statename],'IntraR_mean_dlabel')
% SaveAsNii(HeRL_mean,[statspath4,'/',statename],'HeRL_mean_dlabel')

giiProj2Surf([statspath4,'/',statename,'Inte_mean_dlabel','.nii'],'inf','tri','hemi',[-20 20]);
giiProj2Surf([statspath4,'/',statename,'Seg_mean_dlabel','.nii'],'inf','tri','hemi',[-20 20]);
giiProj2Surf([statspath3,'/',statename,'HomoFC_mean_dlabel','.nii'],'inf','tri','hemi',[-0.3 0.3]);
giiProj2Surf([statspath4,'/',statename,'IntraFC_LI_mean_dlabel','.nii'],'inf','tri','hemi',[-0.4 0.4]);
giiProj2Surf([statspath4,'/',statename,'HeFC_LI_mean_dlabel','.nii'],'inf','tri','hemi',[-0.5 0.5]);
% giiProj2Surf([statspath5,'/',statename,'HeFC_LIabs_mean_dlabel','.nii'],'inf','tri','hemi',[0 0.3]);
% giiProj2Surf([statspath5,'/',statename,'IntraFC_LIabs_mean_dlabel','.nii'],'inf','tri','hemi',[0 0.3]);
% giiProj2Surf([statspath4,'/',statename,'IntraL_mean_dlabel','.nii'],'inf','tri','hemi',[-40 40]);
% giiProj2Surf([statspath4,'/',statename,'HeLR_mean_dlabel','.nii'],'inf','tri','hemi',[-40 40]);
% giiProj2Surf([statspath4,'/',statename,'IntraR_mean_dlabel','.nii'],'inf','tri','hemi',[-40 40]);
% giiProj2Surf([statspath4,'/',statename,'HeRL_mean_dlabel','.nii'],'inf','tri','hemi',[-40 40]);
% IntraLL_CV=IntraLL_std ./ IntraLL_mean;
% IntraRR_CV=IntraRR_std ./ IntraRR_mean;
% HeLR_CV=HeLR_std ./ HeRL_mean;
% HeRL_CV=HeRL_std ./ HeRL_mean;
% HomoFC_CV=HomoFC_std ./ HomoFC_mean;
% LI_intra_CV=LI_std_intra ./ LI_mean_intra;
% absLI_intra_CV=absLI_std_intra ./ absLI_mean_intra;
% LI_he_CV=LI_std_he ./ LI_mean_he;
% absLI_he_CV=absLI_std_he ./ absLI_mean_he;
% 
% SaveAsAtlasNii(IntraLL_CV,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath1,'/',statename],'IntraLL_CV',1)
% SaveAsAtlasNii(IntraRR_CV,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath2,'/',statename],'IntraRR_CV',1)
% SaveAsAtlasNii(HeLR_CV,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath1,'/',statename],'HeLR_CV',1)
% SaveAsAtlasNii(HeRL_CV,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath2,'/',statename],'HeRL_CV',1)
% SaveAsAtlasNii(HomoFC_CV,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath3,'/',statename],'HomoFC_CV',1)
% SaveAsAtlasNii(LI_intra_CV,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath4,'/',statename],'IntraFC_LI_CV',1)
% SaveAsAtlasNii(absLI_intra_CV,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath5,'/',statename],'IntraFC_LIabs_CV',1)
% SaveAsAtlasNii(LI_he_CV,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath4,'/',statename],'HeFC_LI_CV',1)
% SaveAsAtlasNii(absLI_he_CV,'/data1/Public/jxhu/atlas/AICHA_3mm.nii',[statspath5,'/',statename],'HeFC_LIabs_CV',1)


% 
% NiiProj2Surf([statspath1,'/',statename,'IntraLL_CV','.nii'],'inf','tri','hemi',[-1 1]);
% NiiProj2Surf([statspath2,'/',statename,'IntraRR_CV','.nii'],'inf','tri','hemi',[-1 1]);
% NiiProj2Surf([statspath1,'/',statename,'HeLR_CV','.nii'],'inf','tri','hemi',[-1 1]);
% NiiProj2Surf([statspath2,'/',statename,'HeRL_CV','.nii'],'inf','tri','hemi',[-1 1]);
% NiiProj2Surf([statspath3,'/',statename,'HomoFC_CV','.nii'],'inf','tri','hemi',[-1 1]);
% NiiProj2Surf([statspath4,'/',statename,'IntraFC_LI_CV','.nii'],'inf','tri','hemi',[-15 15]);
% NiiProj2Surf([statspath5,'/',statename,'IntraFC_LIabs_CV','.nii'],'inf','tri','hemi',[-1.5 1.5]);
% NiiProj2Surf([statspath4,'/',statename,'HeFC_LI_CV','.nii'],'inf','tri','hemi',[-15 15]);
% NiiProj2Surf([statspath5,'/',statename,'HeFC_LIabs_CV','.nii'],'inf','tri','hemi',[-1.5 1.5]);
%% single sub

% unirandsub=[130821;194645;237334;299154;690152];
% for i=1:2
%     [~,~,Cid]=intersect(unirandsub(i),subid);
%     IntraL_sub=intra_LL(Cid,:)';
%     IntraR_sub=intra_RR(Cid,:)';
%     HomoFC_sub=ho_FC(Cid,:)';
%     
%     SaveAsAtlasNii(IntraL_sub,'/data/newjiao/Sharefolder/atlas/AICHA/AICHA.nii',[statspath1,'/',statename],['IntraL' '_sub' num2str(unirandsub(i))],1)
%     SaveAsAtlasNii(IntraR_sub,'/data/newjiao/Sharefolder/atlas/AICHA/AICHA.nii',[statspath2,'/',statename],['IntraR' '_sub' num2str(unirandsub(i))],1)
%     SaveAsAtlasNii(HomoFC_sub,'/data/newjiao/Sharefolder/atlas/AICHA/AICHA.nii',[statspath3,'/',statename],['HomoFC' '_sub' num2str(unirandsub(i))],1)
%     
%     NiiProj2Surf([statspath1,'/',statename,'IntraL','_sub' num2str(unirandsub(i)),'.nii'],'inf','tri','hemi',[0 80]);
%     NiiProj2Surf([statspath2,'/',statename,'IntraR','_sub' num2str(unirandsub(i)),'.nii'],'inf','tri','hemi',[0 80]);
%     NiiProj2Surf([statspath3,'/',statename,'HomoFC','_sub' num2str(unirandsub(i)),'.nii'],'inf','tri','hemi',[0 1.8]);
%     
%     
%     LI_sub=LI_intra(Cid,:)';
%     LI_abs_sub=LI_intra_abs(Cid,:)';
%     
%     SaveAsAtlasNii(LI_sub,'/data/newjiao/Sharefolder/atlas/AICHA/AICHA.nii',[statspath4,'/',statename],['IntraFC_LI' '_sub' num2str(unirandsub(i))],1)
%     SaveAsAtlasNii(LI_abs_sub,'/data/newjiao/Sharefolder/atlas/AICHA/AICHA.nii',[statspath5,'/',statename],['IntraFC_LIabs' '_sub' num2str(unirandsub(i))],1)
%     
%     NiiProj2Surf([statspath4,'/',statename,'IntraFC_LI','_sub' num2str(unirandsub(i)),'.nii'],'inf','tri','hemi',[-0.3 0.3]);
%     NiiProj2Surf([statspath5,'/',statename,'IntraFC_LIabs','_sub' num2str(unirandsub(i)),'.nii'],'inf','tri','hemi',[0 0.3]);
%     
% end