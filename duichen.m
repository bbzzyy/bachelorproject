function  Id  = duichen( I )
%�Գƣ�ͼ���Ե�Գƣ���ϳɴ�ͼ 
%����
%  I���Ҷ�ͼ��
%���
% Id���Գ�ͼ��

[m,n]=size(I);
tformh=maketform('affine',[-1 0 0;0 1 0;0 n 1]);
Ih=imtransform(I,tformh,'nearest');%ˮƽ�Գ�
tformv=maketform('affine',[1 0 0;0 -1 0;0 m 1]);
Iv=imtransform(I,tformv,'nearest');%��ֱ�Գ�
Ij=imtransform(Iv,tformh,'nearest');%��ת180�ȶԳ�
Id=[Ij,Iv,Ij;I,I,I;Ij,Iv,Ij];
% figure,imshow(Id);

end