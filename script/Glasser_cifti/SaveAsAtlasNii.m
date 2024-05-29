function SaveAsAtlasNii(metric,atlas,savepath,name,hemiflag)
% project results to according atlas
%
% mertic: results
% atlas: nii
% savepath: dir to save 
% name: save as 


A=load_untouch_nii(atlas);
B=A;
metric(1,172)=0;
if hemiflag==1
    for i=1:1:180
        
        B.img(A.img==i) = metric(i);
    end
    
    for j=181:1:360
        B.img(A.img==j) = metric(j-180);
    end
    
elseif hemiflag==0
    
    for i=1:246
        B.img(A.img==i) = metric(i);
    end
end

save_untouch_nii(B,[savepath name '.nii']);