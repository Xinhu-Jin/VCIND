function [] = giiProj2Surf(Nii,surftype,projtype,hemitype,cbm)
% surftype = 'mid', mid-surface ; 'inf', inflated surface. 
% hemitype = 'bil', bi-hemisphere map; 'hemi', single left hemisphere map.
% projtype = 'ec', enclosing method; 'tri', trilinear method.
%
%
%

SurfAvgMidL='/data1/Public/jxhu/atlas/HCP_S1200_GroupAvg_v1/S1200.L.midthickness_MSMAll.32k_fs_LR.surf.gii';
SurfAvgMidR='/data1/Public/jxhu/atlas/HCP_S1200_GroupAvg_v1/S1200.R.midthickness_MSMAll.32k_fs_LR.surf.gii';

if strcmp(surftype,'mid')
    sL=gifti(SurfAvgMidL);
    sR=gifti(SurfAvgMidR);
    
elseif strcmp(surftype,'inf')
    
    SurfAvgInfL='/data1/Public/jxhu/atlas/HCP_S1200_GroupAvg_v1/S1200.L.very_inflated_MSMAll.32k_fs_LR.surf.gii';
    SurfAvgInfR='/data1/Public/jxhu/atlas/HCP_S1200_GroupAvg_v1/S1200.R.very_inflated_MSMAll.32k_fs_LR.surf.gii';
    
    sL=gifti(SurfAvgInfL);
    sR=gifti(SurfAvgInfR);
end
    
    
avsurfl.coord=sL.vertices';
avsurfl.tri=sL.faces;

avsurfr.coord=sR.vertices';
avsurfr.tri=sR.faces;

avsurf.coord=[avsurfl.coord,avsurfr.coord];
avsurf.tri=[avsurfl.tri;avsurfr.tri+32492];


[niipath,niiname,~]=fileparts(Nii);
if strcmp(projtype,'ec')
    cmd_projec=['unset LD_LIBRARY_PATH;source /etc/profile;wb_command -cifti-separate ' Nii ' COLUMN -metric CORTEX_LEFT '  ' ' niipath '/' niiname '_L_ec.func.gii ' '-metric CORTEX_RIGHT' ' ' niipath '/' niiname '_R_ec.func.gii'];

    system(cmd_projec)

    smetricL=gifti([niipath '/' niiname '_L_ec.func.gii']);
    smetricR=gifti([niipath '/' niiname '_R_ec.func.gii']);
    
elseif strcmp(projtype,'tri')
    cmd_projti=['unset LD_LIBRARY_PATH;source /etc/profile;wb_command -cifti-separate ' Nii ' COLUMN -metric CORTEX_LEFT '  ' ' niipath '/' niiname '_L_tri.func.gii ' '-metric CORTEX_RIGHT' ' ' niipath '/' niiname '_R_tri.func.gii'];
    system(cmd_projti);

    smetricL=gifti([niipath '/' niiname '_L_tri.func.gii']);
    smetricR=gifti([niipath '/' niiname '_R_tri.func.gii']);    
    
end

sml=smetricL.cdata';
smr=smetricR.cdata';

if strcmp(hemitype,'bil')
    
    a=figure,SurfStatViewData_lxy([sml,smr],avsurf, cbm, niiname),
    saveas(a,[niipath '/' niiname '.tif'],'tif');
    close(a);
    
elseif strcmp(hemitype,'hemi')
    b=figure,SurfStatViewData_lxy(sml,avsurfl, cbm,niiname),
    saveas(b,[niipath '/' niiname '.tif'],'tif');
    close(b)
end

end

