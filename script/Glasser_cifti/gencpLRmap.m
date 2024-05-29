function [HxI_Rmap,HxI_Rsub]=gencpLRmap(FCS,subid,cov,statspath,statename,cba,cbc)
% relation of HomoxIntra within each STATE

figflag=1;

nid=[1:171,173:180];

%% Group mean - Across subject
[~,~,iS]=intersect(subid,FCS.subid);

intra_LL=FCS.intra_LL(iS,:);
intra_RR=FCS.intra_RR(iS,:);

he_LR=FCS.he_LR(iS,:);
he_RL=FCS.he_RL(iS,:);

inte_L=FCS.inteL(iS,:);
inte_R=FCS.inteR(iS,:);
seg_L=FCS.segL(iS,:);
seg_R=FCS.segR(iS,:);

IntraL_mean=mean(intra_LL)';
IntraR_mean=mean(intra_RR)';
HeLR_mean=mean(he_LR)';
HeRL_mean=mean(he_RL)';
SegL_mean=mean(seg_L)';
SegR_mean=mean(seg_R)';
InteL_mean=mean(inte_L)';
InteR_mean=mean(inte_R)';

FCS_global=FCS.global(iS,:);


% if figflag==1
%     [gr_intraLxintraR,~] =PlotCorr([statspath '/'],[statename '_IntraLxIntraR_avgmapR'],IntraL_mean(nid,:),IntraR_mean(nid,:));
%      [gr_heLRxheRL,~] =PlotCorr([statspath '/'],[statename '_HeLRxHeRL_avgmapR'],HeLR_mean(nid,:),HeRL_mean(nid,:));
%      [gr_inteLxinteR,~] =PlotCorr([statspath '/'],[statename '_InteLxInteR_avgmapR'],InteL_mean(nid,:),InteR_mean(nid,:));
%       [gr_segLxsegR,~] =PlotCorr([statspath '/'],[statename '_SegLxSegR_avgmapR'],SegL_mean(nid,:),SegR_mean(nid,:)); 
% end

[~,~,~,tst1]=ttest(IntraL_mean(nid,:),IntraR_mean(nid,:));
gt_intraLxintraR=tst1.tstat;
[~,~,~,tst2]=ttest(HeLR_mean(nid,:),HeRL_mean(nid,:));
gt_heLRxheRL=tst2.tstat;
[~,~,~,tst3]=ttest(InteL_mean(nid,:),InteR_mean(nid,:));
gt_inteLxinteR=tst3.tstat;
[~,~,~,tst4]=ttest(SegL_mean(nid,:),SegR_mean(nid,:));
gt_segLxsegR=tst4.tstat;

for j=1:180
    
    [~,p_intraLxintraRt(1,j),~,stats1]=ttest(intra_LL(:,j),intra_RR(:,j));
    t_intraLxintraRt(1,j)=stats1.tstat;     
   [~,p_heLRxheRLt(1,j),~,stats2]=ttest(he_LR(:,j),he_RL(:,j));
    t_heLRxheRLt(1,j)=stats2.tstat;  
    [~,p_inteLxinteRt(1,j),~,stats3]=ttest(inte_L(:,j),inte_R(:,j));
    t_inteLxinteRt(1,j)=stats3.tstat;  
    [~,p_segLxsegRt(1,j),~,stats4]=ttest(seg_L(:,j),seg_R(:,j));
    t_segLxsegRt(1,j)=stats4.tstat;  

end


% pbon=0.05/180;
% t_intraLxintraRt_thrd=t_intraLxintraRt .* (p_intraLxintraRt<pbon);
% t_heLRxheRLt_thrd=t_heLRxheRLt .* (p_heLRxheRLt<pbon);
% t_inteLxinteRt_thrd=t_inteLxinteRt .* (p_inteLxinteRt<pbon);
% t_segLxsegRt_thrd=t_segLxsegRt .* (p_segLxsegRt<pbon);
t_intraLxintraRt=t_intraLxintraRt .* (p_intraLxintraRt<0.05);
t_heLRxheRLt=t_heLRxheRLt .* (p_heLRxheRLt<0.05);
t_inteLxinteRt=t_inteLxinteRt .* (p_inteLxinteRt<0.01);
t_segLxsegRt=t_segLxsegRt .* (p_segLxsegRt<0.01);
[pFDR_intra,~] =FDR(p_intraLxintraRt,0.05);[pFDR_he,~] =FDR(p_heLRxheRLt,0.05);[pFDR_inte,~] =FDR(p_inteLxinteRt,0.05);[pFDR_seg,~] =FDR(p_segLxsegRt,0.05);
t_intraLxintraRt_thrd=t_intraLxintraRt .* (p_intraLxintraRt<pFDR_intra);
t_heLRxheRLt_thrd=t_heLRxheRLt .* (p_heLRxheRLt<pFDR_he);
t_inteLxinteRt_thrd=t_inteLxinteRt .* (p_inteLxinteRt<pFDR_inte);
t_segLxsegRt_thrd=t_segLxsegRt .* (p_segLxsegRt<pFDR_seg);

if figflag==1
    SaveAsNii(t_intraLxintraRt',[statspath,'/',statename],['_IntraLxIntraR' '_T' '_dlabel'])  
    SaveAsNii(t_intraLxintraRt_thrd',[statspath,'/',statename],['_IntraLxIntraR' '_T' '_THRD' '_dlabel'])
    SaveAsNii(t_heLRxheRLt',[statspath,'/',statename],['_HeLRxHeRL' '_T' '_dlabel'])  
    SaveAsNii(t_heLRxheRLt_thrd',[statspath,'/',statename],['_HeLRxHeRL' '_T' '_THRD' '_dlabel'])
    SaveAsNii(t_inteLxinteRt',[statspath,'/',statename],['_InteLxInteR' '_T' '_dlabel'])  
    SaveAsNii(t_segLxsegRt',[statspath,'/',statename],['_SegLxSegR' '_T' '_dlabel'])  
    SaveAsNii(t_inteLxinteRt_thrd',[statspath,'/',statename],['_InteLxInteR' '_T' '_THRD' '_dlabel'])
    SaveAsNii(t_segLxsegRt_thrd',[statspath,'/',statename],['_SegLxSegR' '_T' '_THRD' '_dlabel'])
   
    giiProj2Surf([statspath,'/',statename,'_IntraLxIntraR' '_T' '_dlabel','.nii'],'inf','tri','hemi',cba);
    giiProj2Surf([statspath,'/',statename,'_HeLRxHeRL' '_T' '_dlabel','.nii'],'inf','tri','hemi',cba);
    giiProj2Surf([statspath,'/',statename,'_InteLxInteR' '_T' '_dlabel','.nii'],'inf','tri','hemi',cba);
    giiProj2Surf([statspath,'/',statename,'_SegLxSegR' '_T' '_dlabel','.nii'],'inf','tri','hemi',cba);
    
    giiProj2Surf([statspath,'/',statename,'_IntraLxIntraR' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cba);
    giiProj2Surf([statspath,'/',statename,'_HeLRxHeRL' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cba);
    giiProj2Surf([statspath,'/',statename,'_InteLxInteR' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cba);
    giiProj2Surf([statspath,'/',statename,'_SegLxSegR' '_T' '_THRD' '_dlabel','.nii'],'inf','tri','hemi',cba);
  
    
%     PlotCorr([statspath '/'],[statename '_HomoxIntraL_avgsubR'],mean(ho_FC(:,nid),2),mean(intra_LL(:,nid),2),FCS_global);
%     PlotCorr([statspath '/'],[statename '_HomoxIntraR_avgsubR'],mean(ho_FC(:,nid),2),mean(intra_RR(:,nid),2),FCS_global);
%     PlotCorr([statspath '/'],[statename '_HomoxIntraLI_avgsubR'],mean(ho_FC(:,nid),2),mean(LI_intra(:,nid),2),FCS_global);
%     PlotCorr([statspath '/'],[statename '_HomoxIntraLIabs_avgsubR'],mean(ho_FC(:,nid),2),mean(LI_intra_abs(:,nid),2),[FCS_global,cov]);
%     PlotCorr([statspath '/'],[statename '_IntraLxIntraR_avgsubR'],mean(intra_LL(:,nid),2),mean(intra_RR(:,nid),2),FCS_global);
%     
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
% for i=1:length(subid)
%     IntraL_sub=intra_LL(i,nid)';
%     IntraR_sub=intra_RR(i,nid)';
%     HomoFC_sub=ho_FC(i,nid)';
%     LI_sub=LI_intra(i,nid)';
%     LI_abs_sub=LI_intra_abs(i,nid)';
%     
% %     [~,p_intraLxintraRt_sub(i,1),~,stats1]=ttest(IntraL_sub,IntraR_sub);
% %     t_intraLxintraRt_sub(i,1)=stats1.tstat;     
% 
% %     [homoxintraLc_R_sub(i,1),homoxintraLc_P_sub(i,1)]=corr(HomoFC_sub,IntraL_sub);     
% %     [homoxintraRc_R_sub(i,1),homoxintraRc_P_sub(i,1)]=corr(HomoFC_sub,IntraR_sub);    
% %     [homoxintraLIc_R_sub(i,1),homoxintraLIc_P_sub(i,1)]=corr(HomoFC_sub,LI_sub);
%     [homoxintraLIabsc_R_sub(i,1),homoxintraLIabsc_P_sub(i,1)]=corr(HomoFC_sub,LI_abs_sub);   
% %     [intraLxintraRc_R_sub(i,1),intraLxintraRc_P_sub(i,1)]=corr(IntraL_sub,IntraR_sub);
% end
% 
% % HxI_Rsub.homoxintraL_R=homoxintraLc_R_sub;
% % HxI_Rsub.homoxintraR_R=homoxintraRc_R_sub;
% % HxI_Rsub.homoxintraLI_R=homoxintraLIc_R_sub;
% HxI_Rsub.homoxintraLIabs_R=homoxintraLIabsc_R_sub;
% % HxI_Rsub.homoxintraL_P=homoxintraLc_P_sub;
% % HxI_Rsub.homoxintraR_P=homoxintraRc_P_sub;
% % HxI_Rsub.homoxintraLI_P=homoxintraLIc_P_sub;
% HxI_Rsub.homoxintraLIabs_P=homoxintraLIabsc_P_sub;
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