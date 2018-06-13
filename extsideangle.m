function sideangle = extsideangle(I)
%extsideangle：提取车辙纹理的方向角度
%输入：
%I：灰度图像
%输出：
%sideangle：车辙侧偏角

[m,n]=size(I);
If=fft2(I);
Ifs=fftshift(If);
Ia=abs(Ifs);
spfsal=Ia.^2;
% xz：x方向上的中点
% yz：y方向上的中点
xz=m/2+1;
yz=n/2+1;
for alpha=0:179
    theta=(alpha*pi)/180;
    he=0;
    for i=1:xz
        for j=1:n
            r=sqrt(((xz-i)^2)+((j-yz)^2));
            x=j-yz;
            jiao=acos(x/r);
            if jiao>=theta && jiao<theta+(1*pi/180) && r<200
                he=he+spfsal(i,j);
            end
        end
    end
    sigma(alpha+1)=he;
end

% %显示傅里叶频谱角度分布，选择注释
% figure,plot(sigma);

[~,place]=sort(sigma,'descend');
% 纹理方向角度特征提取
if place(1)==1 && (place(2)==91 || place(3)==90)
    te=place(4);
elseif place(1)==1
    te=place(2);
else
    te=place(1);
end
te=(te*pi)/180;
%角度换算公式
sideangle=(atan(1/(-tan(te-pi)*(n/m)))*180)/pi;

end

