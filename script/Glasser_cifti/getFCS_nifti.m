function [finalFCS] = getFCS_nifti(statspath,r2zflag,Sid,FCmap_path,FCmap_path_add)

%% get FCS
nid=[1:171,173:180];
% if nargin==4 | isempty(FCmap_path_add)
    
    SubSize=length(FCmap_path);
    
    id=[181:1:360;1:1:180]';
    ho_FC=zeros(SubSize,180);
    
    for k=1:SubSize
        [~,tmpname,~]=fileparts(FCmap_path{k});
        IDS(k,1)=str2num(tmpname(5:7));
        tmpFC=load(FCmap_path{k});
        tempFC=tril(tmpFC,-1);
        
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
       
        
        LL=FCC(181:1:end,181:1:end);
        RR=FCC(1:1:180,1:1:180);
        RL=FCC(181:1:end,1:1:180);
        LR=FCC(1:1:180,181:1:end);
        FCS_LL=sum(LL);
        FCS_RR=sum(RR);
        FCS_LR=sum(LR);
        FCS_RL=sum(RL);
        L_L(k,:)=FCS_LL;
        R_R(k,:)=FCS_RR;
        L_R(k,:)=FCS_LR;
        R_L(k,:)=FCS_RL;
        global_mean(k,1)=mean(mean(temp(nid,nid)));
        global_absmean(k,1)=mean(mean(abs(temp(nid,nid))));
    end
    
    left_seg=L_L-(L_R-ho_FC);right_seg=R_R-(R_L-ho_FC);
    left_inte=L_L+(L_R-ho_FC);right_inte=R_R+(R_L-ho_FC);
    segregation=left_seg-right_seg;integration=left_inte-right_inte;
    intra_LL=L_L;intra_RR=R_R;
    he_LR=L_R-ho_FC;he_RL=R_L-ho_FC;
    LI_intra = (intra_LL-intra_RR) ./ (abs(intra_LL)+abs(intra_RR));
    LI_intra_abs = abs(intra_LL-intra_RR) ./ (abs(intra_LL)+abs(intra_RR));
    LI_intra(isnan(LI_intra))=0;
    LI_intra_abs(isnan(LI_intra_abs))=0;
    LI_he = (he_LR-he_RL) ./ (abs(he_LR)+abs(he_RL));
    LI_he_abs = abs(he_LR-he_RL) ./ (abs(he_LR)+abs(he_RL));
    LI_he(isnan(LI_he))=0;
    LI_he_abs(isnan(LI_he_abs))=0;
    segregation(isnan(segregation))=0; integration(isnan(integration))=0; 
    
    finalFCS.subid=IDS;
    finalFCS.homo=ho_FC;
    finalFCS.intra_LL=intra_LL;
    finalFCS.intra_RR=intra_RR;
    finalFCS.he_LR= he_LR;
    finalFCS.he_RL= he_RL;
    finalFCS.segL= left_seg;
    finalFCS.segR= right_seg;
    finalFCS.inteL= left_inte;
    finalFCS.inteR= right_inte;
    finalFCS.inte= integration;
    finalFCS.seg= segregation;
    finalFCS.intra_LI=LI_intra;
    finalFCS.intra_absLI=LI_intra_abs;
    finalFCS.he_LI=LI_he;
    finalFCS.he_absLI=LI_he_abs;
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

