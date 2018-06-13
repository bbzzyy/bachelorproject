function [locationmat,featurevectormat]=featurestructure(gabormean,gabordeviation,cyclefeature)
%featurestructure：构建特征向量矩阵和坐标位置矩阵
%输入：
%gabormean：gabor均值特征
%gabordeviation：gabor标准差特征
%cyclefeature：车辙周期特征
%输出：
%locationmat：坐标矩阵
%featurevectormat：特征向量矩阵

[m,n]=size(gabormean);
sum=0;
locationmat=[];
featurevectormat=[];
for i=1:m
    for j=1:n
        sum=sum+1;
        locationmat(sum,:)=[i,j];
        featurevectormat(sum,:)=[gabormean(i,j),gabordeviation(i,j),cyclefeature(i,j)];%gabor特征和频率特征
    end
end

end

