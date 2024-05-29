[ID_V12,is_V12,IS_V12]=intersect(FCS_VCIND1.subid,FCS_VCIND2.subid);[ID_V13,is_V13,IS_V13]=intersect(FCS_VCIND1.subid,FCS_VCIND3.subid);
[ID_C12,is_C12,IS_C12]=intersect(FCS_VCINDcog1.subid,FCS_VCINDcog2.subid);[ID_C13,is_C13,IS_C13]=intersect(FCS_VCINDcog1.subid,FCS_VCINDcog3.subid);
inte_VCIND12=FCS_VCIND1.inte(is_V12,:);seg_VCIND12=FCS_VCIND1.seg(is_V12,:);intra_VCIND12=FCS_VCIND1.intra_LI(is_V12,:);he_VCIND12=FCS_VCIND1.he_LI(is_V12,:);homo_VCIND12=FCS_VCIND1.homo(is_V12,:);
inte_VCINDcog12=FCS_VCINDcog1.inte(is_C12,:);seg_VCINDcog12=FCS_VCINDcog1.seg(is_C12,:);intra_VCINDcog12=FCS_VCINDcog1.intra_LI(is_C12,:);he_VCINDcog12=FCS_VCINDcog1.he_LI(is_C12,:);homo_VCINDcog12=FCS_VCINDcog1.homo(is_C12,:);
inte_VCIND2=FCS_VCIND2.inte(IS_V12,:);seg_VCIND2=FCS_VCIND2.seg(IS_V12,:);intra_VCIND2=FCS_VCIND2.intra_LI(IS_V12,:);he_VCIND2=FCS_VCIND2.he_LI(IS_V12,:);homo_VCIND2=FCS_VCIND2.homo(IS_V12,:);
inte_VCINDcog2=FCS_VCINDcog2.inte(IS_C12,:);seg_VCINDcog2=FCS_VCINDcog2.seg(IS_C12,:);intra_VCINDcog2=FCS_VCINDcog2.intra_LI(IS_C12,:);he_VCINDcog2=FCS_VCINDcog2.he_LI(IS_C12,:);homo_VCINDcog2=FCS_VCINDcog2.homo(IS_C12,:);
inte_VCIND13=FCS_VCIND1.inte(is_V13,:);seg_VCIND13=FCS_VCIND1.seg(is_V13,:);intra_VCIND13=FCS_VCIND1.intra_LI(is_V13,:);he_VCIND13=FCS_VCIND1.he_LI(is_V13,:);homo_VCIND13=FCS_VCIND1.homo(is_V13,:);
inte_VCINDcog13=FCS_VCINDcog1.inte(is_C13,:);seg_VCINDcog13=FCS_VCINDcog1.seg(is_C13,:);intra_VCINDcog13=FCS_VCINDcog1.intra_LI(is_C13,:);he_VCINDcog13=FCS_VCINDcog1.he_LI(is_C13,:);homo_VCINDcog13=FCS_VCINDcog1.homo(is_C13,:);
inte_VCIND3=FCS_VCIND3.inte(IS_V13,:);seg_VCIND3=FCS_VCIND3.seg(IS_V13,:);intra_VCIND3=FCS_VCIND3.intra_LI(IS_V13,:);he_VCIND3=FCS_VCIND3.he_LI(IS_V13,:);homo_VCIND3=FCS_VCIND3.homo(IS_V13,:);
inte_VCINDcog3=FCS_VCINDcog3.inte(IS_C13,:);seg_VCINDcog3=FCS_VCINDcog3.seg(IS_C13,:);intra_VCINDcog3=FCS_VCINDcog3.intra_LI(IS_C13,:);he_VCINDcog3=FCS_VCINDcog3.he_LI(IS_C13,:);homo_VCINDcog3=FCS_VCINDcog3.homo(IS_C13,:);



for i=1:24
    for j=1:12
    ji=find(label(2,:)==j);
    ji_inte_VCIND12=inte_VCIND12(i,ji);ji_inte_VCIND2=inte_VCIND2(i,ji);inte=[ji_inte_VCIND12;ji_inte_VCIND2];D_inte_VCIND12(i,:)=similarity(inte); ji_Dcos_inteVCIND12(i,j)=D_inte_VCIND12(i,4);
    ji_seg_VCIND12=seg_VCIND12(i,ji);ji_seg_VCIND2=seg_VCIND2(i,ji);seg=[ji_seg_VCIND12;ji_seg_VCIND2];D_seg_VCIND12(i,:)=similarity(seg); ji_Dcos_segVCIND12(i,j)=D_seg_VCIND12(i,4);
    ji_intra_VCIND12=intra_VCIND12(i,ji);ji_intra_VCIND2=intra_VCIND2(i,ji);intra=[ji_intra_VCIND12;ji_intra_VCIND2];D_intra_VCIND12(i,:)=similarity(intra); ji_Dcos_intraVCIND12(i,j)=D_intra_VCIND12(i,4);
    ji_he_VCIND12=he_VCIND12(i,ji);ji_he_VCIND2=he_VCIND2(i,ji);he=[ji_he_VCIND12;ji_he_VCIND2];D_he_VCIND12(i,:)=similarity(he); ji_Dcos_heVCIND12(i,j)=D_he_VCIND12(i,4);
    ji_homo_VCIND12=homo_VCIND12(i,ji);ji_homo_VCIND2=homo_VCIND2(i,ji);homo=[ji_homo_VCIND12;ji_homo_VCIND2];D_homo_VCIND12(i,:)=similarity(homo); ji_Dcos_homoVCIND12(i,j)=D_homo_VCIND12(i,4);
    end
   
end

for i=1:21
    for j=1:12
    ji=find(label(2,:)==j);
    ji_inte_VCIND13=inte_VCIND13(i,ji);ji_inte_VCIND3=inte_VCIND3(i,ji);inte=[ji_inte_VCIND13;ji_inte_VCIND3];D_inte_VCIND13(i,:)=similarity(inte); ji_Dcos_inteVCIND13(i,j)=D_inte_VCIND13(i,4);
    ji_seg_VCIND13=seg_VCIND13(i,ji);ji_seg_VCIND3=seg_VCIND3(i,ji);seg=[ji_seg_VCIND13;ji_seg_VCIND3];D_seg_VCIND13(i,:)=similarity(seg); ji_Dcos_segVCIND13(i,j)=D_seg_VCIND13(i,4);
    ji_intra_VCIND13=intra_VCIND13(i,ji);ji_intra_VCIND3=intra_VCIND3(i,ji);intra=[ji_intra_VCIND13;ji_intra_VCIND3];D_intra_VCIND13(i,:)=similarity(intra); ji_Dcos_intraVCIND13(i,j)=D_intra_VCIND13(i,4);
    ji_he_VCIND13=he_VCIND13(i,ji);ji_he_VCIND3=he_VCIND3(i,ji);he=[ji_he_VCIND13;ji_he_VCIND3];D_he_VCIND13(i,:)=similarity(he); ji_Dcos_heVCIND13(i,j)=D_he_VCIND13(i,4);
    ji_homo_VCIND13=homo_VCIND13(i,ji);ji_homo_VCIND3=homo_VCIND3(i,ji);homo=[ji_homo_VCIND13;ji_homo_VCIND3];D_homo_VCIND13(i,:)=similarity(homo); ji_Dcos_homoVCIND13(i,j)=D_homo_VCIND13(i,4);
    end
   
end


for i=1:23
    for j=1:12
    ji=find(label(2,:)==j);
    ji_inte_VCINDcog12=inte_VCINDcog12(i,ji);ji_inte_VCINDcog2=inte_VCINDcog2(i,ji);inte=[ji_inte_VCINDcog12;ji_inte_VCINDcog2];D_inte_VCINDcog12(i,:)=similarity(inte); ji_Dcos_inteVCINDcog12(i,j)=D_inte_VCINDcog12(i,4);
    ji_seg_VCINDcog12=seg_VCINDcog12(i,ji);ji_seg_VCINDcog2=seg_VCINDcog2(i,ji);seg=[ji_seg_VCINDcog12;ji_seg_VCINDcog2];D_seg_VCINDcog12(i,:)=similarity(seg); ji_Dcos_segVCINDcog12(i,j)=D_seg_VCINDcog12(i,4);
    ji_intra_VCINDcog12=intra_VCINDcog12(i,ji);ji_intra_VCINDcog2=intra_VCINDcog2(i,ji);intra=[ji_intra_VCINDcog12;ji_intra_VCINDcog2];D_intra_VCINDcog12(i,:)=similarity(intra); ji_Dcos_intraVCINDcog12(i,j)=D_intra_VCINDcog12(i,4);
    ji_he_VCINDcog12=he_VCINDcog12(i,ji);ji_he_VCINDcog2=he_VCINDcog2(i,ji);he=[ji_he_VCINDcog12;ji_he_VCINDcog2];D_he_VCINDcog12(i,:)=similarity(he); ji_Dcos_heVCINDcog12(i,j)=D_he_VCINDcog12(i,4);
    ji_homo_VCINDcog12=homo_VCINDcog12(i,ji);ji_homo_VCINDcog2=homo_VCINDcog2(i,ji);homo=[ji_homo_VCINDcog12;ji_homo_VCINDcog2];D_homo_VCINDcog12(i,:)=similarity(homo); ji_Dcos_homoVCINDcog12(i,j)=D_homo_VCINDcog12(i,4);
    end
   
end

for i=1:14
    for j=1:12
    ji=find(label(2,:)==j);
    ji_inte_VCINDcog13=inte_VCINDcog13(i,ji);ji_inte_VCINDcog3=inte_VCINDcog3(i,ji);inte=[ji_inte_VCINDcog13;ji_inte_VCINDcog3];D_inte_VCINDcog13(i,:)=similarity(inte); ji_Dcos_inteVCINDcog13(i,j)=D_inte_VCINDcog13(i,4);
    ji_seg_VCINDcog13=seg_VCINDcog13(i,ji);ji_seg_VCINDcog3=seg_VCINDcog3(i,ji);seg=[ji_seg_VCINDcog13;ji_seg_VCINDcog3];D_seg_VCINDcog13(i,:)=similarity(seg); ji_Dcos_segVCINDcog13(i,j)=D_seg_VCINDcog13(i,4);
    ji_intra_VCINDcog13=intra_VCINDcog13(i,ji);ji_intra_VCINDcog3=intra_VCINDcog3(i,ji);intra=[ji_intra_VCINDcog13;ji_intra_VCINDcog3];D_intra_VCINDcog13(i,:)=similarity(intra); ji_Dcos_intraVCINDcog13(i,j)=D_intra_VCINDcog13(i,4);
    ji_he_VCINDcog13=he_VCINDcog13(i,ji);ji_he_VCINDcog3=he_VCINDcog3(i,ji);he=[ji_he_VCINDcog13;ji_he_VCINDcog3];D_he_VCINDcog13(i,:)=similarity(he); ji_Dcos_heVCINDcog13(i,j)=D_he_VCINDcog13(i,4);
    ji_homo_VCINDcog13=homo_VCINDcog13(i,ji);ji_homo_VCINDcog3=homo_VCINDcog3(i,ji);homo=[ji_homo_VCINDcog13;ji_homo_VCINDcog3];D_homo_VCINDcog13(i,:)=similarity(homo); ji_Dcos_homoVCINDcog13(i,j)=D_homo_VCINDcog13(i,4);
    end
   
end

ji_Dhe_VCIND=[ji_Dcos_heVCIND12;ji_Dcos_heVCIND13];ji_Dhe_VCINDcog=[ji_Dcos_heVCINDcog12;ji_Dcos_heVCINDcog13];ji_Dintra_VCIND=[ji_Dcos_intraVCIND12;ji_Dcos_intraVCIND13];ji_Dintra_VCINDcog=[ji_Dcos_intraVCINDcog12;ji_Dcos_intraVCINDcog13];
ji_Dseg_VCIND=[ji_Dcos_segVCIND12;ji_Dcos_segVCIND13];ji_Dseg_VCINDcog=[ji_Dcos_segVCINDcog12;ji_Dcos_segVCINDcog13];ji_Dinte_VCIND=[ji_Dcos_inteVCIND12;ji_Dcos_inteVCIND13];ji_Dinte_VCINDcog=[ji_Dcos_inteVCINDcog12;ji_Dcos_inteVCINDcog13];
ji_Dhomo_VCIND=[ji_Dcos_homoVCIND12;ji_Dcos_homoVCIND13];ji_Dhomo_VCINDcog=[ji_Dcos_homoVCINDcog12;ji_Dcos_homoVCINDcog13];
Dis_VCINDCog.he=ji_Dhe_VCINDcog;Dis_VCINDCog.intra=ji_Dintra_VCINDcog;Dis_VCINDCog.seg=ji_Dseg_VCINDcog;Dis_VCINDCog.inte=ji_Dinte_VCINDcog;Dis_VCINDCog.homo=ji_Dhomo_VCINDcog;


for j=1:12
[r_dishe_VCIND12(1,j),p_dishe_VCIND12(1,j)]=partialcorr(ji_Dcos_heVCIND12(:,j),behav(30:53,26),[behav(30:53,4:6),FCS_VCIND2.global(IS_V12),fd(30:53,2),behav(30:53,8)]);
[r_disintra_VCIND12(1,j),p_disintra_VCIND12(1,j)]=partialcorr(ji_Dcos_intraVCIND12(:,j),behav(30:53,26),[behav(30:53,4:6),FCS_VCIND2.global(IS_V12),fd(30:53,2),behav(30:53,8)]);
[r_disseg_VCIND12(1,j),p_disseg_VCIND12(1,j)]=partialcorr(ji_Dcos_segVCIND12(:,j),behav(30:53,26),[behav(30:53,4:6),FCS_VCIND2.global(IS_V12),fd(30:53,2),behav(30:53,8)]);
[r_disinte_VCIND12(1,j),p_disinte_VCIND12(1,j)]=partialcorr(ji_Dcos_inteVCIND12(:,j),behav(30:53,26),[behav(30:53,4:6),FCS_VCIND2.global(IS_V12),fd(30:53,2),behav(30:53,8)]);
[r_dishomo_VCIND12(1,j),p_dishomo_VCIND12(1,j)]=partialcorr(ji_Dcos_homoVCIND12(:,j),behav(30:53,18),[behav(30:53,4:6),FCS_VCIND2.global(IS_V12),fd(30:53,2),behav(30:53,8)]);

[r_dishe_VCINDcog12(1,j),p_dishe_VCINDcog12(1,j)]=partialcorr(ji_Dcos_heVCINDcog12(:,j),behav(105:127,26),[behav(105:127,4:6),FCS_VCINDcog2.global(IS_C12),fd(105:127,2),behav(105:127,8)]);
[r_disintra_VCINDcog12(1,j),p_disintra_VCINDcog12(1,j)]=partialcorr(ji_Dcos_intraVCINDcog12(:,j),behav(105:127,26),[behav(105:127,4:6),FCS_VCINDcog2.global(IS_C12),fd(105:127,2),behav(105:127,8)]);
[r_disinte_VCINDcog12(1,j),p_disinte_VCINDcog12(1,j)]=partialcorr(ji_Dcos_inteVCINDcog12(:,j),behav(105:127,26),[behav(105:127,4:6),FCS_VCINDcog2.global(IS_C12),fd(105:127,2),behav(105:127,8)]);
[r_disseg_VCINDcog12(1,j),p_disseg_VCINDcog12(1,j)]=partialcorr(ji_Dcos_segVCINDcog12(:,j),behav(105:127,26),[behav(105:127,4:6),FCS_VCINDcog2.global(IS_C12),fd(105:127,2),behav(105:127,8)]);
[r_dishomo_VCINDcog12(1,j),p_dishomo_VCINDcog12(1,j)]=partialcorr(ji_Dcos_homoVCINDcog12(:,j),behav(105:127,26),[behav(105:127,4:6),FCS_VCINDcog2.global(IS_C12),fd(105:127,2),behav(105:127,8)]);

[r_dishe_VCIND13(1,j),p_dishe_VCIND13(1,j)]=partialcorr(ji_Dcos_heVCIND13(:,j),behav(54:74,26),[behav(54:74,4:6),FCS_VCIND3.global(IS_V13),fd(54:74,2),behav(54:74,8)]);
[r_disintra_VCIND13(1,j),p_disintra_VCIND13(1,j)]=partialcorr(ji_Dcos_intraVCIND13(:,j),behav(54:74,26),[behav(54:74,4:6),FCS_VCIND3.global(IS_V13),fd(54:74,2),behav(54:74,8)]);
[r_disseg_VCIND13(1,j),p_disseg_VCIND13(1,j)]=partialcorr(ji_Dcos_segVCIND13(:,j),behav(54:74,26),[behav(54:74,4:6),FCS_VCIND3.global(IS_V13),fd(54:74,2),behav(54:74,8)]);
[r_disinte_VCIND13(1,j),p_disinte_VCIND13(1,j)]=partialcorr(ji_Dcos_inteVCIND13(:,j),behav(54:74,26),[behav(54:74,4:6),FCS_VCIND3.global(IS_V13),fd(54:74,2),behav(54:74,8)]);
[r_dishomo_VCIND13(1,j),p_dishomo_VCIND13(1,j)]=partialcorr(ji_Dcos_homoVCIND13(:,j),behav(54:74,26),[behav(54:74,4:6),FCS_VCIND3.global(IS_V13),fd(54:74,2),behav(54:74,8)]);

[r_dishe_VCINDcog13(1,j),p_dishe_VCINDcog13(1,j)]=partialcorr(ji_Dcos_heVCINDcog13(:,j),behav(128:end,26),[behav(128:end,4:6),FCS_VCINDcog3.global(IS_C13),fd(128:end,2),behav(128:end,8)]);
[r_disintra_VCINDcog13(1,j),p_disintra_VCINDcog13(1,j)]=partialcorr(ji_Dcos_intraVCINDcog13(:,j),behav(128:end,26),[behav(128:end,4:6),FCS_VCINDcog3.global(IS_C13),fd(128:end,2),behav(128:end,8)]);
[r_disinte_VCINDcog13(1,j),p_disinte_VCINDcog13(1,j)]=partialcorr(ji_Dcos_inteVCINDcog13(:,j),behav(128:end,26),[behav(128:end,4:6),FCS_VCINDcog3.global(IS_C13),fd(128:end,2),behav(128:end,8)]);
[r_disseg_VCINDcog13(1,j),p_disseg_VCINDcog13(1,j)]=partialcorr(ji_Dcos_segVCINDcog13(:,j),behav(128:end,26),[behav(128:end,4:6),FCS_VCINDcog3.global(IS_C13),fd(128:end,2),behav(128:end,8)]);
[r_dishomo_VCINDcog13(1,j),p_dishomo_VCINDcog13(1,j)]=partialcorr(ji_Dcos_homoVCINDcog13(:,j),behav(128:end,26),[behav(128:end,4:6),FCS_VCINDcog3.global(IS_C13),fd(128:end,2),behav(128:end,8)]);

[r_he_VCIND12(1,j),p_he_VCIND12(1,j)]=partialcorr(jiFCS_VCIND2.he(IS_V12,j),behav(30:53,18),[behav(30:53,4:6),FCS_VCIND2.global(IS_V12),fd(30:53,2),behav(30:53,8)]);
[r_intra_VCIND12(1,j),p_intra_VCIND12(1,j)]=partialcorr(jiFCS_VCIND2.intra(IS_V12,j),behav(30:53,18),[behav(30:53,4:6),FCS_VCIND2.global(IS_V12),fd(30:53,2),behav(30:53,8)]);
[r_seg_VCIND12(1,j),p_seg_VCIND12(1,j)]=partialcorr(jiFCS_VCIND2.seg(IS_V12,j),behav(30:53,18),[behav(30:53,4:6),FCS_VCIND2.global(IS_V12),fd(30:53,2),behav(30:53,8)]);
[r_inte_VCIND12(1,j),p_inte_VCIND12(1,j)]=partialcorr(jiFCS_VCIND2.inte(IS_V12,j),behav(30:53,18),[behav(30:53,4:6),FCS_VCIND2.global(IS_V12),fd(30:53,2),behav(30:53,8)]);
[r_homo_VCIND12(1,j),p_homo_VCIND12(1,j)]=partialcorr(jiFCS_VCIND2.homo(IS_V12,j),behav(30:53,18),[behav(30:53,4:6),FCS_VCIND2.global(IS_V12),fd(30:53,2),behav(30:53,8)]);

[r_he_VCINDcog12(1,j),p_he_VCINDcog12(1,j)]=partialcorr(jiFCS_VCINDcog2.he(IS_C12,j),behav(105:127,18),[behav(105:127,4:6),FCS_VCINDcog2.global(IS_C12),fd(105:127,2),behav(105:127,8)]);
[r_intra_VCINDcog12(1,j),p_intra_VCINDcog12(1,j)]=partialcorr(jiFCS_VCINDcog2.intra(IS_C12,j),behav(105:127,18),[behav(105:127,4:6),FCS_VCINDcog2.global(IS_C12),fd(105:127,2),behav(105:127,8)]);
[r_inte_VCINDcog12(1,j),p_inte_VCINDcog12(1,j)]=partialcorr(jiFCS_VCINDcog2.inte(IS_C12,j),behav(105:127,18),[behav(105:127,4:6),FCS_VCINDcog2.global(IS_C12),fd(105:127,2),behav(105:127,8)]);
[r_seg_VCINDcog12(1,j),p_seg_VCINDcog12(1,j)]=partialcorr(jiFCS_VCINDcog2.seg(IS_C12,j),behav(105:127,18),[behav(105:127,4:6),FCS_VCINDcog2.global(IS_C12),fd(105:127,2),behav(105:127,8)]);
[r_homo_VCINDcog12(1,j),p_homo_VCINDcog12(1,j)]=partialcorr(jiFCS_VCINDcog2.homo(IS_C12,j),behav(105:127,18),[behav(105:127,4:6),FCS_VCINDcog2.global(IS_C12),fd(105:127,2),behav(105:127,8)]);

[r_he_VCIND13(1,j),p_he_VCIND13(1,j)]=partialcorr(jiFCS_VCIND3.he(IS_V13,j),behav(54:74,18),[behav(54:74,4:6),FCS_VCIND3.global(IS_V13),fd(54:74,2),behav(54:74,8)]);
[r_intra_VCIND13(1,j),p_intra_VCIND13(1,j)]=partialcorr(jiFCS_VCIND3.intra(IS_V13,j),behav(54:74,18),[behav(54:74,4:6),FCS_VCIND3.global(IS_V13),fd(54:74,2),behav(54:74,8)]);
[r_seg_VCIND13(1,j),p_seg_VCIND13(1,j)]=partialcorr(jiFCS_VCIND3.seg(IS_V13,j),behav(54:74,18),[behav(54:74,4:6),FCS_VCIND3.global(IS_V13),fd(54:74,2),behav(54:74,8)]);
[r_inte_VCIND13(1,j),p_inte_VCIND13(1,j)]=partialcorr(jiFCS_VCIND3.inte(IS_V13,j),behav(54:74,18),[behav(54:74,4:6),FCS_VCIND3.global(IS_V13),fd(54:74,2),behav(54:74,8)]);
[r_homo_VCIND13(1,j),p_homo_VCIND13(1,j)]=partialcorr(jiFCS_VCIND3.homo(IS_V13,j),behav(54:74,18),[behav(54:74,4:6),FCS_VCIND3.global(IS_V13),fd(54:74,2),behav(54:74,8)]);

[r_he_VCINDcog13(1,j),p_he_VCINDcog13(1,j)]=partialcorr(jiFCS_VCINDcog3.he(IS_C13,j),behav(128:end,18),[behav(128:end,4:6),FCS_VCINDcog3.global(IS_C13),fd(128:end,2),behav(128:end,8)]);
[r_intra_VCINDcog13(1,j),p_intra_VCINDcog13(1,j)]=partialcorr(jiFCS_VCINDcog3.intra(IS_C13,j),behav(128:end,18),[behav(128:end,4:6),FCS_VCINDcog3.global(IS_C13),fd(128:end,2),behav(128:end,8)]);
[r_inte_VCINDcog13(1,j),p_inte_VCINDcog13(1,j)]=partialcorr(jiFCS_VCINDcog3.inte(IS_C13,j),behav(128:end,18),[behav(128:end,4:6),FCS_VCINDcog3.global(IS_C13),fd(128:end,2),behav(128:end,8)]);
[r_seg_VCINDcog13(1,j),p_seg_VCINDcog13(1,j)]=partialcorr(jiFCS_VCINDcog3.seg(IS_C13,j),behav(128:end,18),[behav(128:end,4:6),FCS_VCINDcog3.global(IS_C13),fd(128:end,2),behav(128:end,8)]);
[r_homo_VCINDcog13(1,j),p_homo_VCINDcog13(1,j)]=partialcorr(jiFCS_VCINDcog3.homo(IS_C13,j),behav(128:end,18),[behav(128:end,4:6),FCS_VCINDcog3.global(IS_C13),fd(128:end,2),behav(128:end,8)]);

end