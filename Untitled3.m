clear;
clc;
tic;
I=imread('C:\Users\zy\Desktop\3.jpg');
I=imresize(rgb2gray(I),1/12);

gs=fspecial('gaussian',7,3);
I1=imfilter(I,gs,'symmetric');%��˹�˲�ƽ��
image=lightenhance(I1,31,31,1.5);%ͼ��������ǿ
I1=floor(image./32);%�ҶȽ���
% figure,imshow(I1,[]);
cyclefeature=extfz(I1,61);%��ȡ������������

I2=lightenhance(I,31,31,1.5);%ͼ��������ǿ
% figure,imshow(I2,[]);
sideangle=extsideangle(I);%��ȡ��������Ƕ�
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
%������̬ѧ����
rutimage=bwareaopen(rutimage,10);
se1=strel('line',10,0);
rutimage=imerode(rutimage,se1);
se2=strel('disk',30);
rutimage=imopen(rutimage,se2);
rutimage=imclose(rutimage,se2);

figure,imshow(rutimage);
%%
%��Ȧ
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