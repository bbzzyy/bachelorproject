function featurevectormat = rebuildvector( weight,featurevectormat )
%rebuildvector������Ȩ�ش�С���¹�����������
%���룺
%weight��Ȩ������
%featurevectormat��������������
%�����
%featurevectormat����Ȩ���������������

m=size(featurevectormat,1);
for i=1:m
    featurevectormat(i,:)=[weight(1)*featurevectormat(i,1),...
                           weight(2)*featurevectormat(i,2),...
                           weight(3)*featurevectormat(i,3)];%gabor������Ƶ������
end

end

