function [r,p] = PlotCorr(savepath,tname,VarA,VarB,Cov,Group)

if nargin<4
    fig = figure,hist(VarA),
    title(tname,'Interpreter','none'),
    saveas(fig,[savepath tname '.tif'],'tif'),
    close(fig);
    return
    
elseif nargin<5 | isempty(Cov)
    Group=1;
    subs=length(VarA);
    Cov=zeros(subs,1);
    
elseif nargin<6 | isempty(Group)
    Group=1;
end


if iscolumn(VarA) & iscolumn(VarB)
    if isnumeric(VarA)
        [r,p]=partialcorr(VarA,VarB,Cov);
        fig = figure,SurfStatPlot(term(VarA),term(VarB),1+term(Cov),term(Group),'LineWidth',2, 'MarkerSize',10),
        title([tname ' r=' num2str(r) ' p=' num2str(p)],'Interpreter','none'),
        saveas(fig,[savepath tname '.tif'],'tif'),
        close(fig);
    else
        fig = figure,SurfStatPlot(term(VarA),term(VarB),1+term(Cov),term(Group),'LineWidth',2, 'MarkerSize',10),
        saveas(fig,[savepath tname '.tif'],'tif'),
        close(fig);
    end
    
else

    
end

end

