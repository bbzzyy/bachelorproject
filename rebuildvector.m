function featurevectormat = rebuildvector( weight,featurevectormat )
%rebuildvector：按照权重大小重新构建特征向量
%输入：
%weight：权重向量
%featurevectormat：特征向量矩阵
%输出：
%featurevectormat：加权后的特征向量矩阵

m=size(featurevectormat,1);
for i=1:m
    featurevectormat(i,:)=[weight(1)*featurevectormat(i,1),...
                           weight(2)*featurevectormat(i,2),...
                           weight(3)*featurevectormat(i,3)];%gabor特征和频率特征
end

end

