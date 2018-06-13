function  Id  = duichen( I )
%对称，图像边缘对称，结合成大图 
%输入
%  I：灰度图像
%输出
% Id：对称图像

[m,n]=size(I);
tformh=maketform('affine',[-1 0 0;0 1 0;0 n 1]);
Ih=imtransform(I,tformh,'nearest');%水平对称
tformv=maketform('affine',[1 0 0;0 -1 0;0 m 1]);
Iv=imtransform(I,tformv,'nearest');%垂直对称
Ij=imtransform(Iv,tformh,'nearest');%旋转180度对称
Id=[Ij,Iv,Ij;I,I,I;Ij,Iv,Ij];
% figure,imshow(Id);

end