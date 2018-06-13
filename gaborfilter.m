function [image,IG] = gaborfilter(I,jd,m,n,fu)
%gaborfilter gabor�˲�����
%input��
%      I�����복�޻Ҷ�ͼ��,��Ҫdoubleת��
%     jd�����޽Ƕ�
%    m,n���˲�����С
%     fu��?�˲���Ƶ�ʴ�С?
%output��
%  image�����gabor��Ӧͼ��Ϊ����
%     IG�����ͼ�����ֵ
I=double(I);
%<<<--------�˲�����С����
% m=51;
% n=51;
gama = sqrt(2);
eta = sqrt(2);
%�Ƕȷ���
tetav=(jd/180)*pi;
%Ƶ��
% fu=1/42;
fu=1/fu;
alpha = fu/gama;
beta = fu/eta;
%����gabor�˲���
gfilter=zeros(m,n);
for x = 1:m
    for y = 1:n
        xprime = (x-((m+1)/2))*cos(tetav)+(y-((n+1)/2))*sin(tetav);
        yprime = -(x-((m+1)/2))*sin(tetav)+(y-((n+1)/2))*cos(tetav);
        gfilter(x,y) = (fu^2/(pi*gama*eta))*exp(-((alpha^2)*(xprime^2)...
            +(beta^2)*(yprime^2)))*exp(1i*2*pi*fu*xprime);
    end
end
image=imfilter(I,gfilter,'replicate');
IG=abs(image);
end