function rutimage = imagesegment(center,U,locationmat)
%imagesegment：根据输入的隶属度矩阵对特征向量进行分类，完成对图像的初分割
%输入：
%center：聚类中心
%U：隶属度矩阵
%locationmat：位置坐标矩阵
%输出：
%rutimage：类别图像，白色为非车辙，黑色为车辙

U=U';
center=center';
rutimage=[];
if center(1,1)>center(1,2)
    ep=0;
else
    ep=1;
end
total=size(locationmat,1);
for i=1:total
    x=locationmat(i,1);
    y=locationmat(i,2);
    if U(i,1)<U(i,2)
        rutimage(x,y)=-ep+1;
    else
        rutimage(x,y)=ep;
    end
end

end

