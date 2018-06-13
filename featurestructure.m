function [locationmat,featurevectormat]=featurestructure(gabormean,gabordeviation,cyclefeature)
%featurestructure�����������������������λ�þ���
%���룺
%gabormean��gabor��ֵ����
%gabordeviation��gabor��׼������
%cyclefeature��������������
%�����
%locationmat���������
%featurevectormat��������������

[m,n]=size(gabormean);
sum=0;
locationmat=[];
featurevectormat=[];
for i=1:m
    for j=1:n
        sum=sum+1;
        locationmat(sum,:)=[i,j];
        featurevectormat(sum,:)=[gabormean(i,j),gabordeviation(i,j),cyclefeature(i,j)];%gabor������Ƶ������
    end
end

end

