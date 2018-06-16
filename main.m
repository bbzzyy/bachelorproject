clear;
clc;
tic;
I=imread('C:\Users\zy\Desktop\3.jpg');
I=imresize(rgb2gray(I),1/12);

gs=fspecial('gaussian',7,3);
I1=imfilter(I,gs,'symmetric');%高斯滤波平滑
image=lightenhance(I1,31,31,1.5);%图像质量增强
I1=floor(image./32);%灰度降级
% figure,imshow(I1,[]);
cyclefeature=extfz(I1,61);%提取车辙周期特征

I2=lightenhance(I,31,31,1.5);%图像质量增强
% figure,imshow(I2,[]);
sideangle=extsideangle(I);%提取车辙纹理角度
[gabormean,gabordeviation]=extractgabor(I2,25,23,sideangle);
% figure,imshow(gabormean,[]);
% figure,imshow(gabordeviation,[]);
[locationmat,featurevectormat]=featurestructure(gabormean,gabordeviation,cyclefeature);
[~,U]=fcm(featurevectormat,2,[nan nan nan 0]);
weight=featureweight(featurevectormat,U,100);
featurevectormat=rebuildvector(weight,featurevectormat);
[center,U]=fcm(featurevectormat,2,[nan nan nan 0]);
rutimage = imagesegment(center,U,locationmat);
% figure,imshow(rutimage);

%%
%后处理形态学运算
rutimage=bwareaopen(rutimage,10);
se1=strel('line',10,0);
rutimage=imerode(rutimage,se1);
se2=strel('disk',30);
rutimage=imopen(rutimage,se2);
rutimage=imclose(rutimage,se2);

figure,imshow(rutimage);
%%
%画圈
g=edge(rutimage,'canny');
se=strel('square',2);
g=imdilate(g,se);
[m,n]=size(I);
I=repmat(I,[1,1,3]);
for i=1:m
    for j=1:n
        if g(i,j)==1
            I(i,j,1)=255;
            I(i,j,2)=0;
            I(i,j,3)=0;
        end
    end
end
figure,imshow(I);
toc;
