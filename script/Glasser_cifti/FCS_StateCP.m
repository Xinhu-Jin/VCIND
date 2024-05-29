function [FCScp_AS,FCScp_AR]=FCS_StateCP(FCS_Rest,FCS_Task,statspath,atlas,Sid)

[~,ia,~]=intersect(FCS_Rest.subid,Sid);
[~,ib,~]=intersect(FCS_Task.subid,Sid);

nid=[1:101,103:127,129:173,176:179,181:190,192];

HomoRest=FCS_Rest.homo(ia,:);
HomoTask=FCS_Task.homo(ib,:);
IntraLRest=FCS_Rest.intra_L(ia,:);
IntraLTask=FCS_Task.intra_L(ib,:);
IntraRRest=FCS_Rest.intra_R(ia,:);
IntraRTask=FCS_Task.intra_R(ib,:);
IntraAIRest=FCS_Rest.intra_AI(ia,:);
IntraAITask=FCS_Task.intra_AI(ib,:);
IntraAIabsRest=FCS_Rest.intra_absAI(ia,:);
IntraAIabsTask=FCS_Task.intra_absAI(ib,:);

%% average

Homo_RavgS=mean(HomoRest(:,nid))';Homo_RavgR=mean(HomoRest(:,nid),2);
IntraL_RavgS=mean(IntraLRest(:,nid))';IntraL_RavgR=mean(IntraLRest(:,nid),2);
IntraR_RavgS=mean(IntraRRest(:,nid))';IntraR_RavgR=mean(IntraRRest(:,nid),2);
IntraAI_RavgS=mean(IntraAIRest(:,nid))';IntraAI_RavgR=mean(IntraAIRest(:,nid),2);
IntraAIabs_RavgS=mean(IntraAIabsRest(:,nid))';IntraAIabs_RavgR=mean(IntraAIabsRest(:,nid),2);

Homo_TavgS=mean(HomoTask(:,nid))';Homo_TavgR=mean(HomoTask(:,nid),2);
IntraL_TavgS=mean(IntraLTask(:,nid))';IntraL_TavgR=mean(IntraLTask(:,nid),2);
IntraR_TavgS=mean(IntraRTask(:,nid))';IntraR_TavgR=mean(IntraRTask(:,nid),2);
IntraAI_TavgS=mean(IntraAITask(:,nid))';IntraAI_TavgR=mean(IntraAITask(:,nid),2);
IntraAIabs_TavgS=mean(IntraAIabsTask(:,nid))';IntraAIabs_TavgR=mean(IntraAIabsTask(:,nid),2);

%% across subjects

for j=1:192
    
    [~,p_homo(1,j),~,stats1]=ttest(HomoRest(:,j),HomoTask(:,j));
    t_homo(1,j)=stats1.tstat;
     
    [~,p_intra_L(1,j),~,stats2]=ttest(IntraLRest(:,j),IntraLTask(:,j));
    t_intra_L(1,j)=stats2.tstat;  
    
    [~,p_intra_R(1,j),~,stats3]=ttest(IntraRRest(:,j),IntraRTask(:,j));
    t_intra_R(1,j)=stats3.tstat;  
    
    [~,p_intra_AI(1,j),~,stats4]=ttest(IntraAIRest(:,j),IntraAITask(:,j));
    t_intra_AI(1,j)=stats4.tstat;  
    
    [~,p_intra_absAI(1,j),~,stats5]=ttest(IntraAIabsRest(:,j),IntraAIabsTask(:,j));
    t_intra_absAI(1,j)=stats5.tstat;  
    
end

t_intra(1:2:384,1)=t_intra_L;
t_intra(2:2:384,1)=t_intra_R;

SaveAsAtlasNii(t_intra,atlas,statspath,'Intra_diff_2state',0)

SaveAsAtlasNii(t_homo,atlas,statspath,'Homo_diff_2state',1)
SaveAsAtlasNii(t_intra_AI,atlas,statspath,'IntraAI_diff_2state',1)
SaveAsAtlasNii(t_intra_absAI,atlas,statspath,'IntraAIabs_diff_2state',1)

NiiProj2Surf([statspath,'Intra_diff_2state','.nii'],'inf','tri','bil',[-50 50]);
NiiProj2Surf([statspath,'Homo_diff_2state','.nii'],'inf','tri','hemi',[-10 100]);
NiiProj2Surf([statspath,'IntraAI_diff_2state','.nii'],'inf','tri','hemi',[-10 25]);
NiiProj2Surf([statspath,'IntraAIabs_diff_2state','.nii'],'inf','tri','hemi',[-10 25]);

FCScp_AS.homo=t_homo;
FCScp_AS.intraL=t_intra_L;
FCScp_AS.intraR=t_intra_R;
FCScp_AS.intraAI=t_intra_AI;
FCScp_AS.intraAIabs=t_intra_absAI;

%% mean across regions, corr across subjects

[r_ho_mrcs,p_ho_mrcs]=PlotCorr(statspath,'Homo_S_RestxTask',Homo_RavgR,Homo_TavgR);
[r_itaL_mrcs,p_ita_L_mrcs]=PlotCorr(statspath,'IntraL_S_RestxTask',IntraL_RavgR,IntraL_TavgR);
[r_itaR_mrcs,p_ita_R_mrcs]=PlotCorr(statspath,'IntraR_S_RestxTask',IntraR_RavgR,IntraR_TavgR);
[r_ita_AI_mrcs,p_ita_AI_mrcs]=PlotCorr(statspath,'IntraLI_S_RestxTask',IntraAI_RavgR,IntraAI_TavgR);
[r_ita_absAI_mrcs,p_ita_absAI_mrcs]=PlotCorr(statspath,'IntraLIabs_S_RestxTask',IntraAIabs_RavgR,IntraAIabs_TavgR);

FCScp_AS.homo_mrcs=r_ho_mrcs;
FCScp_AS.intraL_mrcs=r_itaL_mrcs;
FCScp_AS.intraR_mrcs=r_itaR_mrcs;
FCScp_AS.intraAI_mrcs=r_ita_AI_mrcs;
FCScp_AS.intraAIabs_mrcs=r_ita_absAI_mrcs;

%% across regions

for i=1:length(ia)
    
    [r_homo(i,1),p_homo(i,1)]=corr(HomoRest(i,nid)',HomoTask(i,nid)');
    [r_intra_L(i,1),p_intra_L(i,1)]=corr(IntraLRest(i,nid)',IntraLTask(i,nid)');
    [r_intra_R(i,1),p_intra_R(i,1)]=corr(IntraRRest(i,nid)',IntraRTask(i,nid)');
    [r_intra_AI(i,1),p_intra_AI(i,1)]=corr(IntraAIRest(i,nid)',IntraAITask(i,nid)');    
    [r_intra_absAI(i,1),p_intra_absAI(i,1)]=corr(IntraAIabsRest(i,nid)',IntraAIabsTask(i,nid)');

end

PlotCorr(statspath,'Homocp_AR_Subdist',r_homo);
PlotCorr(statspath,'IntraLIcp_AR_Subdist',r_intra_AI);
PlotCorr(statspath,'IntraLIabscp_AR_Subdist',r_intra_absAI);
PlotCorr(statspath,'IntraLcp_AR_Subdist',r_intra_L);
PlotCorr(statspath,'IntraRcp_AR_Subdist',r_intra_R);

FCScp_AR.homo=r_homo;
FCScp_AR.intraL=r_intra_L;
FCScp_AR.intraR=r_intra_R;
FCScp_AR.intraAI=r_intra_AI;
FCScp_AR.intraAIabs=r_intra_absAI;


%% mean across subjects, corr across regions

[r_ho_mscr,p_ho_mscr]=PlotCorr(statspath,'Homo_R_RestxTask',Homo_RavgS,Homo_TavgS);

[r_itaL_mscr,p_ita_L_mscr]=PlotCorr(statspath,'IntraL_R_RestxTask',IntraL_RavgS,IntraL_TavgS);

[r_itaR_mscr,p_ita_R_mscr]=PlotCorr(statspath,'IntraR_R_RestxTask',IntraR_RavgS,IntraR_TavgS);

[r_ita_AI_mscr,p_ita_AI_mscr]=PlotCorr(statspath,'IntraLI_R_RestxTask',IntraAI_RavgS,IntraAI_TavgS);

[r_ita_absAI_mscr,p_ita_absAI_mscr]=PlotCorr(statspath,'IntraLIabs_R_RestxTask',IntraAIabs_RavgS,IntraAIabs_TavgS);


FCScp_AR.homo_mscr=r_ho_mscr;
FCScp_AR.intraL_mscr=r_itaL_mscr;
FCScp_AR.intraR_mscr=r_itaR_mscr;
FCScp_AR.intraAI_mscr=r_ita_AI_mscr;
FCScp_AR.intraAIabs_mscr=r_ita_absAI_mscr;

% reshape and all corr

