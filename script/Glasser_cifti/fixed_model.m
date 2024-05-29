LI=ji_he_cog(:,3);
bl = table(mean(LI,2),categorical(behav(:,2)),num2cell(subj),age,fd,'VariableNames',{'LI','Time','Sub','Age','FD'});
% bl.Time=categorical(bl.Time);
lme = fitlme(bl,'LI~Time+Age+FD+(Time|Sub)');
[Tvalue,Pvalue]=plot_fixed_model_lmeLevel1_adjustedCV(lme,bl.Sub,'age_scan','LI',{'LI'},'/data/newjiao/Sharefolder/Results/dHCP/dHCP_results/256/33','plot_LI',1,1)

bl = table(Ho,Age,sub,covarate(:,1),covarate(:,2),'VariableNames',{'Ho','age_scan','Sub','FCS','Sex'});
% bl.Sex=categorical(bl.Sex);
lme = fitlme(bl,'Ho~age_scan+FCS+Sex+(age_scan|Sub)');
[Tvalue,Pvalue]=plot_fixed_model_lmeLevel1_adjustedCV(lme,bl.Sub,'age_scan','HO',{'Ho'},'/data/newjiao/Sharefolder/Results/dHCP/dHCP_results/256/33','plot_Ho',1,1)