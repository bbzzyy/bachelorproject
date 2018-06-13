function [image,IG] = gaborfilter(I,jd,m,n,fu)
%gaborfilter gabor滤波函数
%input：
%      I：输入车辙灰度图像,需要double转换
%     jd：车辙角度
%    m,n：滤波器大小
%     fu：?滤波器频率大小?
%output：
%  image：输出gabor响应图，为复数
%     IG：输出图像绝对值
I=double(I);
%<<<--------滤波器大小设置
% m=51;
% n=51;
gama = sqrt(2);
eta = sqrt(2);
%角度方向
tetav=(jd/180)*pi;
%频率
% fu=1/42;
fu=1/fu;
alpha = fu/gama;
beta = fu/eta;
%构建gabor滤波器
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