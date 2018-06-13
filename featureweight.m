function weight = featureweight(featurevectormat,U,sn)
%featureweight：计算各特征在特征向量中的权重
%输入：
%featurevectormat：特征向量
%U：隶属度矩阵
%sn：选取的特征个数（100）
%输出：
%weight：权重矩阵

U=U';
length=size(featurevectormat,2);
[~,place1]=sort(U(:,1),'descend');
[~,place2]=sort(U(:,2),'descend');
tz1=[];
tz2=[];
for i=1:sn
    tz1(i,:)=featurevectormat(place1(i),:);
    tz2(i,:)=featurevectormat(place2(i),:);
end
ma=max(featurevectormat);
mi=min(featurevectormat);
weight=[];
for a=1:length
    diffhit=0;
    diffmiss=0;
    p=ma(a)-mi(a);
    for i=1:sn
        diffhit=diffhit+(abs(tz1(1,a)-tz1(i,a))/p);
    end
    for i=1:sn
        diffmiss=diffmiss+(abs(tz1(1,a)-tz2(i,a))/p);
    end
    weight(a)=-(diffhit/sn)+(diffmiss/sn);
end

end

