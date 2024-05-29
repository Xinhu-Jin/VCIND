
filename = g_ls('/data3_node2/workingFolder/jinxinhu/Control_36P/xcp_d/*/ses-1/func/*task-rest_space-fsLR_atlas-Glasser_den-91k*conmat.pconn.nii');
filename = g_ls('/data3_node2/workingFolder/jinxinhu/24P/VCIND_cog/*/ses-1/func/*task-rest_space-fsLR_atlas-Glasser_den-91k_bold.ptseries.nii');
file = g_ls('/data3_node2/workingFolder/jinxinhu/24P/VCIND_cog/*/ses-1/func/*rest_space-fsLR_desc-framewisedisplacement_bold.tsv');
for i =1:length(filename);
    [a,b,c]= fileparts(filename{i});
    d=cifti_read(filename{i});
    ID{i}=b(5:7);
    id=['sub' num2str(ID{i}) '.mat'];
    time=d.cdata;FD=dlmread(file{i});
    Time=time .* (FD'<0.5);Time(:,all(Time==0))=[];
    r=corrcoef(Time'); r(isnan(r))=0;
    fd=FD .* (FD<0.5);fd=ZCX_no0mean(fd);
    fdmean(i,1)=str2num(char(ID{1,i}));fdmean(i,2)=fd;
    save(['/data3_node2/workingFolder/jinxinhu/results/24P/VCIND_cog/ses-1/', id],'r'); 
end
for i =1:length(filename);
    [a,b,c]= fileparts(filename{i});
    d=cifti_read(filename{i});
    ID{i}=b(5:7);
    id=['sub' num2str(ID{i}) '.mat'];
    r=d.cdata;
%     FD=dlmread(file{i});
%     fd=FD .* (FD<0.5);fd=ZCX_no0mean(fd);
%     fdmean(i,1)=str2num(char(ID{1,i}));fdmean(i,2)=fd;
    save(['/data3_node2/workingFolder/jinxinhu/Control_36P/', id],'r'); 
end

filename= g_ls('/data1/Public/jxhu/results/musician/post_scrubbing/OM/xcp_abcd/*/ses-1/func/*atlas-Glasser_desc-timeseries_res-2_bold.tsv');
for i = 1:length(filename)
    [a,b,c]= fileparts(filename{i});
    d=dlmread(filename{i},1,0);
    cmd=['cp ' filename{i} '  /data1/Public/jxhu/results/musician/atlas_Glasser/NGR/nifti/scrubbing/OM'];

    system(cmd);
end



filename = g_ls('/data1/Public/jxhu/results/musician/post_scrubbing/OM/xcp_abcd/*/ses-1/func/*MNI152*.csv');

for j =1:length(filename);
 
m_volume(j,:)=csvread(filename{j},1,6);

end

filename = g_ls('/data1/Public/jxhu/results/musician/post_scrubbing/OM/xcp_abcd/*/ses-1/func/*fsLR*.csv');
for k =1:length(filename);
 
m_surface(k,:)=csvread(filename{k},1,5);

end