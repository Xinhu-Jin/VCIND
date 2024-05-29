function SaveAsNii(whole_cortex,savepath,name)
% project results to according atlas
%
% mertic: results
% atlas: nii
% savepath: dir to save 
% name: save as 

    group_dlabel = cifti_read('/data1/Public/jxhu/atlas/Q1-Q6_RelatedValidation210.CorticalAreas_dil_Final_Final_Areas_Group_Colors.32k_fs_LR.dlabel.nii');
%     whole_cortex(172,1)=0;
    for label = 1:180
        tmp_index_R = find(group_dlabel.cdata==label); 
 
        group_dlabel.cdata(tmp_index_R) =whole_cortex(label,1);
    end
    
        for label = 181:360
        tmp_index_L = find(group_dlabel.cdata==label); 
 
        group_dlabel.cdata(tmp_index_L) = whole_cortex(label-180,1);
%         group_dlabel.cdata(tmp_index_L) = whole_cortex(label,1);

    end

cifti_write(group_dlabel,[savepath name '.nii']);