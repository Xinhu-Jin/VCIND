function [finalFCS] = getFCS_network(statspath,r2zflag,Sid,FCmap_path,FCmap_path_add)

%% get FCS of FPN/DAN/CON/DMN
nid=[1:180];

% if nargin==4 | isempty(FCmap_path_add)
    
    SubSize=length(FCmap_path);
    
    id=[181:1:360;1:1:180]';
    ho_FC=zeros(SubSize,180);
    
    for k=1:SubSize
        [~,tmpname,~]=fileparts(FCmap_path{k});
        IDS(k,1)=str2num(tmpname(4:end));
        tmpFC=load(FCmap_path{k});
        tempFC=tril(tmpFC.r,-1);
        Allmatrix(:,:,k)=tmpFC.r;
        
        if r2zflag==1
            temp=0.5.* reallog((1+tempFC)./(1-tempFC)); % R to Z
        else
            temp=tempFC;
        end
        
        temp(find(isnan(temp)==1))=0;
        for i=1:180
            ho_FC(k,i)=temp(id(i,1),id(i,2));
        end
        
        FCC=temp+temp';
%         FCC(FCC<0)=0;

        LL=FCC(181:1:end,181:1:end);
        RR=FCC(1:1:180,1:1:180);
        RL=FCC(181:1:end,1:1:180);
        LR=FCC(1:1:180,181:1:end);
        load('/data1/Public/jxhu/results/musician/atlas_Glasser/NGR/cifti/scrubbing/Figure/subnet/ji_label.mat');
        FPN=~(label(2,:)~=7);CON=~(label(2,:)~=4);DAN=~(label(2,:)~=5);DMN=~(label(2,:)~=9);
        FCS_LL_FPN=sum(LL.*FPN.*FPN');FCS_RR_FPN=sum(RR.*FPN.*FPN');FCS_LR_FPN=sum(LR.*FPN.*FPN');FCS_RL_FPN=sum(RL.*FPN.*FPN');
        FCS_LL_FPNCON=sum(LL.*FPN.*CON');FCS_RR_FPNCON=sum(RR.*FPN.*CON');
        FCS_LR_FPNCON=sum(LR.*FPN.*CON');FCS_RL_FPNCON=sum(RL.*FPN.*CON');
        FCS_LL_FPNDAN=sum(LL.*FPN.*DAN');FCS_RR_FPNDAN=sum(RR.*FPN.*DAN');
        FCS_LR_FPNDAN=sum(LR.*FPN.*DAN');FCS_RL_FPNDAN=sum(RL.*FPN.*DAN');
        FCS_LL_FPNDMN=sum(LL.*FPN.*DMN');FCS_RR_FPNDMN=sum(RR.*FPN.*DMN');
        FCS_LR_FPNDMN=sum(LR.*FPN.*DMN');FCS_RL_FPNDMN=sum(RL.*FPN.*DMN');

        L_Lfpn(k,:)=FCS_LL_FPN;R_Rfpn(k,:)=FCS_RR_FPN;L_Rfpn(k,:)=FCS_LR_FPN;R_Lfpn(k,:)=FCS_RL_FPN;
        L_Lcon(k,:)=FCS_LL_FPNCON;R_Rcon(k,:)=FCS_RR_FPNCON;L_Rcon(k,:)=FCS_LR_FPNCON;R_Lcon(k,:)=FCS_RL_FPNCON;
        L_Ldan(k,:)=FCS_LL_FPNDAN;R_Rdan(k,:)=FCS_RR_FPNDAN;L_Rdan(k,:)=FCS_LR_FPNDAN;R_Ldan(k,:)=FCS_RL_FPNDAN;
        L_Ldmn(k,:)=FCS_LL_FPNDMN;R_Rdmn(k,:)=FCS_RR_FPNDMN;L_Rdmn(k,:)=FCS_LR_FPNDMN;R_Ldmn(k,:)=FCS_RL_FPNDMN;

        global_mean(k,1)=mean(mean(temp(nid,nid)));
        global_absmean(k,1)=mean(mean(abs(temp(nid,nid))));
    end
    
    intra_LL_FPN=L_Lfpn;intra_RR_FPN=R_Rfpn;he_LR_FPN=L_Rfpn;he_RL_FPN=R_Lfpn;
    LI_intra_FPN = (intra_LL_FPN-intra_RR_FPN) ./ (abs(intra_LL_FPN)+abs(intra_RR_FPN));LI_intra_FPN(isnan(LI_intra_FPN))=0;
    LI_he_FPN = (he_LR_FPN-he_RL_FPN) ./ (abs(he_LR_FPN)+abs(he_RL_FPN));LI_he_FPN(isnan(LI_he_FPN))=0;
       
    intra_LL_CON=L_Lcon;intra_RR_CON=R_Rcon;he_LR_CON=L_Rcon;he_RL_CON=R_Lcon;
    LI_intra_CON = (intra_LL_CON-intra_RR_CON) ./ (abs(intra_LL_CON)+abs(intra_RR_CON));LI_intra_CON(isnan(LI_intra_CON))=0;
    LI_he_CON= (he_LR_CON-he_RL_CON) ./ (abs(he_LR_CON)+abs(he_RL_CON));LI_he_CON(isnan(LI_he_CON))=0;
    
    intra_LL_DAN=L_Ldan;intra_RR_DAN=R_Rdan;he_LR_DAN=L_Rdan;he_RL_DAN=R_Ldan;
    LI_intra_DAN = (intra_LL_DAN-intra_RR_DAN) ./ (abs(intra_LL_DAN)+abs(intra_RR_DAN));LI_intra_DAN(isnan(LI_intra_DAN))=0;
    LI_he_DAN= (he_LR_DAN-he_RL_DAN) ./ (abs(he_LR_DAN)+abs(he_RL_DAN));LI_he_DAN(isnan(LI_he_DAN))=0;
    
    intra_LL_DMN=L_Ldmn;intra_RR_DMN=R_Rdmn;he_LR_DMN=L_Rdmn;he_RL_DMN=R_Ldmn;
    LI_intra_DMN = (intra_LL_DMN-intra_RR_DMN) ./ (abs(intra_LL_DMN)+abs(intra_RR_DMN));LI_intra_DMN(isnan(LI_intra_DMN))=0;
    LI_he_DMN= (he_LR_DMN-he_RL_DMN) ./ (abs(he_LR_DMN)+abs(he_RL_DMN));LI_he_DMN(isnan(LI_he_DMN))=0;
    
    intra_LL_FPNmean=ZCX_no0mean(intra_LL_FPN,2);intra_RR_FPNmean=ZCX_no0mean(intra_RR_FPN,2);
    intra_LL_CONmean=ZCX_no0mean(intra_LL_CON,2);intra_RR_CONmean=ZCX_no0mean(intra_RR_CON,2);
    intra_LL_DANmean=ZCX_no0mean(intra_LL_DAN,2);intra_RR_DANmean=ZCX_no0mean(intra_RR_DAN,2);
    intra_LL_DMNmean=ZCX_no0mean(intra_LL_DMN,2);intra_RR_DMNmean=ZCX_no0mean(intra_RR_DMN,2);
    he_LR_FPNmean=ZCX_no0mean(he_LR_FPN,2);he_RL_FPNmean=ZCX_no0mean(he_RL_FPN,2);
    he_LR_CONmean=ZCX_no0mean(he_LR_CON,2);he_RL_CONmean=ZCX_no0mean(he_RL_CON,2);
    he_LR_DANmean=ZCX_no0mean(he_LR_DAN,2);he_RL_DANmean=ZCX_no0mean(he_RL_DAN,2);
    he_LR_DMNmean=ZCX_no0mean(he_LR_DMN,2);he_RL_DMNmean=ZCX_no0mean(he_RL_DMN,2);

    chn=size(tmpFC.r);mean_FC=nanmean(Allmatrix,3);
    
    finalFCS.subid=IDS;
    finalFCS.intra_LI_FPN=LI_intra_FPN;finalFCS.intra_LI_CON=LI_intra_CON;
    finalFCS.intra_LI_DAN=LI_intra_DAN;finalFCS.intra_LI_DMN=LI_intra_DMN;
    finalFCS.he_LI_FPN= LI_he_FPN;finalFCS.he_LI_CON= LI_he_CON;
    finalFCS.he_LI_DAN=LI_he_DAN;finalFCS.he_LI_DMN=LI_he_DMN;
    
    finalFCS.intra_LL_FPN=intra_LL_FPN;finalFCS.intra_RR_FPN=intra_RR_FPN;finalFCS.he_LR_FPN=he_LR_FPN;finalFCS.he_RL_FPN=he_RL_FPN;
    finalFCS.intra_LL_CON=intra_LL_CON;finalFCS.intra_RR_CON=intra_RR_CON;finalFCS.he_LR_CON=he_LR_CON;finalFCS.he_RL_CON=he_RL_CON;
    finalFCS.intra_LL_DAN=intra_LL_DAN;finalFCS.intra_RR_DAN=intra_RR_DAN;finalFCS.he_LR_DAN=he_LR_DAN;finalFCS.he_RL_DAN=he_RL_DAN;
    finalFCS.intra_LL_DMN=intra_LL_DMN;finalFCS.intra_RR_DMN=intra_RR_DMN;finalFCS.he_LR_DMN=he_LR_DMN;finalFCS.he_RL_DMN=he_RL_DMN;
    finalFCS.intra_LL_FPNmean=intra_LL_FPNmean;finalFCS.intra_RR_FPNmean=intra_RR_FPNmean;finalFCS.he_LR_FPNmean=he_LR_FPNmean;finalFCS.he_RL_FPNmean=he_RL_FPNmean;
    finalFCS.intra_LL_CONmean=intra_LL_CONmean;finalFCS.intra_RR_CONmean=intra_RR_CONmean;finalFCS.he_LR_CONmean=he_LR_CONmean;finalFCS.he_RL_CONmean=he_RL_CONmean;
    finalFCS.intra_LL_DANmean=intra_LL_DANmean;finalFCS.intra_RR_DANmean=intra_RR_DANmean;finalFCS.he_LR_DANmean=he_LR_DANmean;finalFCS.he_RL_DANmean=he_RL_DANmean;
    finalFCS.intra_LL_DMNmean=intra_LL_DMNmean;finalFCS.intra_RR_DMNmean=intra_RR_DMNmean;finalFCS.he_LR_DMNmean=he_LR_DMNmean;finalFCS.he_RL_DMNmean=he_RL_DMNmean;

    finalFCS.global=global_mean;
    finalFCS.global_abs=global_absmean;
% else
%      
%     SubSize1=length(FCmap_path);
%     SubSize2=length(FCmap_path_add);
    
%     id=[2:2:384;1:2:384]';
%     ho_FC1=zeros(SubSize1,192);
%     ho_FC2=zeros(SubSize2,192);
%     
%     for k=1:SubSize1
%         [~,tmpname,~]=fileparts(FCmap_path{k});
%         IDS1(k,1)=str2num(tmpname(2:end));
%         tmpFC=load(FCmap_path{k});
%         tempFC=tril(tmpFC,-1);
%         
%         if r2zflag==1
%             temp=0.5.* reallog((1+tempFC)./(1-tempFC)); % R to Z
%         else
%             temp=tempFC;
%         end
%         
%         for i=1:192
%             ho_FC1(k,i)=temp(id(i,1),id(i,2));
%         end
%         
%         FCC=temp+temp';
%         
%         LL=FCC(1:2:end,1:2:end);
%         RR=FCC(2:2:end,2:2:end);
%         FCS_LL=sum(LL);
%         FCS_RR=sum(RR);
%         L_L1(k,:)=FCS_LL;
%         R_R1(k,:)=FCS_RR;
%         global_mean1(k,1)=mean(mean(temp(nid,nid)));
%         global_absmean1(k,1)=mean(mean(abs(temp(nid,nid))));
%     end
%     for k=1:SubSize2
%         [~,tmpname,~]=fileparts(FCmap_path_add{k});
%         IDS2(k,1)=str2num(tmpname(2:end));
%         tmpFC=load(FCmap_path_add{k});
%         tempFC=tril(tmpFC,-1);
%         
%         if r2zflag==1
%             temp=0.5.* reallog((1+tempFC)./(1-tempFC)); % R to Z
%         else
%             temp=tempFC;
%         end
%         
%         for i=1:192
%             ho_FC2(k,i)=temp(id(i,1),id(i,2));
%         end
%         
%         FCC=temp+temp';
%         
%         LL=FCC(1:2:end,1:2:end);
%         RR=FCC(2:2:end,2:2:end);
%         FCS_LL=sum(LL);
%         FCS_RR=sum(RR);
%         L_L2(k,:)=FCS_LL;
%         R_R2(k,:)=FCS_RR;
%         global_mean2(k,1)=mean(mean(temp(nid,nid)));
%         global_absmean2(k,1)=mean(mean(abs(temp(nid,nid))));
%     end
%     
%     [CIDS,ia,ib]=intersect(IDS1,IDS2);
%     intra_LL=(L_L1(ia,:)+L_L2(ib,:))/2;
%     intra_RR=(R_R1(ia,:)+R_R2(ib,:))/2;
%     ho_FC=(ho_FC1(ia,:)+ho_FC2(ib,:))/2;
%     AI_intra = (intra_LL-intra_RR) ./ (abs(intra_LL)+abs(intra_RR));
%     AI_intra_abs = abs(intra_LL-intra_RR) ./ (abs(intra_LL)+abs(intra_RR));
%     AI_intra(isnan(AI_intra))=0;
%     AI_intra_abs(isnan(AI_intra_abs))=0;
%     
%     finalFCS.subid=CIDS;
%     finalFCS.homo=ho_FC;
%     finalFCS.intra_L=intra_LL;
%     finalFCS.intra_R=intra_RR;
%     finalFCS.intra_AI=AI_intra;
%     finalFCS.intra_absAI=AI_intra_abs;
%     finalFCS.global=(global_mean1(ia,1)+global_mean2(ib,1))/2;
%     finalFCS.global_abs=(global_absmean1(ia,1)+global_absmean2(ib,1))/2;
% end


% save([statspath '.mat'],'finalFCS');

% %% Group mean - Across subject
% [~,iS,~]=intersect(CIDS,Sid);
% 
% IntraFC_mean(1:2:384)=mean(intra_LL(iS,:))';
% IntraFC_std(1:2:384)=std(intra_LL(iS,:))';
% IntraFC_mean(2:2:384)=mean(intra_RR(iS,:))';
% IntraFC_std(2:2:384)=std(intra_RR(iS,:))';
% HomoFC_mean=mean(ho_FC(iS,:))';
% HomoFC_std=std(ho_FC(iS,:))';
% 
% SaveAsAtlasNii(IntraFC_mean,'/data/stalxy/sharefolder/HCP/AICHA/AICHA.nii',statspath,'IntraFC_mean',0)
% SaveAsAtlasNii(IntraFC_std,'/data/stalxy/sharefolder/HCP/AICHA/AICHA.nii',statspath,'IntraFC_std',0)
% SaveAsAtlasNii(HomoFC_mean,'/data/stalxy/sharefolder/HCP/AICHA/AICHA.nii',statspath,'HomoFC_mean',1)
% SaveAsAtlasNii(HomoFC_std,'/data/stalxy/sharefolder/HCP/AICHA/AICHA.nii',statspath,'HomoFC_std',1)
% 
% NiiProj2Surf([statspath,'IntraFC_mean','.nii'],'inf','tri','bil',[0 50]);
% NiiProj2Surf([statspath,'IntraFC_std','.nii'],'inf','tri','bil',[0 25]);
% NiiProj2Surf([statspath,'HomoFC_mean','.nii'],'inf','tri','hemi',[0 1.8]);
% NiiProj2Surf([statspath,'HomoFC_std','.nii'],'inf','tri','hemi',[0 0.35]);
% 
% 
% AI_mean=mean(AI_intra(iS,:))';
% AI_std=std(AI_intra(iS,:))';
% AI_abs_mean=mean(AI_intra_abs(iS,:))';
% AI_abs_std=std(AI_intra_abs(iS,:))';
% 
% SaveAsAtlasNii(AI_mean,'/data/stalxy/sharefolder/HCP/AICHA/AICHA.nii',statspath,'IntraFC_AI_mean',1)
% SaveAsAtlasNii(AI_std,'/data/stalxy/sharefolder/HCP/AICHA/AICHA.nii',statspath,'IntraFC_AI_std',1)
% SaveAsAtlasNii(AI_abs_mean,'/data/stalxy/sharefolder/HCP/AICHA/AICHA.nii',statspath,'IntraFC_absAI_mean',1)
% SaveAsAtlasNii(AI_abs_std,'/data/stalxy/sharefolder/HCP/AICHA/AICHA.nii',statspath,'IntraFC_absAI_std',1)
% 
% NiiProj2Surf([statspath,'IntraFC_AI_mean','.nii'],'inf','tri','hemi',[-0.5 0.5]);
% NiiProj2Surf([statspath,'IntraFC_AI_std','.nii'],'inf','tri','hemi',[0 0.3]);
% NiiProj2Surf([statspath,'IntraFC_absAI_mean','.nii'],'inf','tri','hemi',[0 0.5]);
% NiiProj2Surf([statspath,'IntraFC_absAI_std','.nii'],'inf','tri','hemi',[0 0.2]);
% 
% 
% h1=zeros(1,192);
% p1=zeros(1,192);
% t_intra=zeros(1,192);
% for j=1:192
%     [h1(1,j),p1(1,j),~,stats1]=ttest(intra_LL(iS,j),intra_RR(iS,j));
%     t_intra(1,j)=stats1.tstat;
% end
% 
% SaveAsAtlasNii(t_intra,'/data/stalxy/sharefolder/HCP/AICHA/AICHA.nii',statspath,'IntraFC_HemiTmap',1)
% NiiProj2Surf([statspath,'IntraFC_HemiTmap','.nii'],'inf','tri','hemi',[-40 40]);

