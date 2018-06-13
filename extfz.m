function cyclefeature = extfz( I,longsize )
%extfz：提取车辙纹理的周期特征
%输入：
%I：灰度图像
%longsize：采样线长度
%输出：
%cyclefeature：周期特征矩阵

[u,v]=size(I);
I1=duichen(I);
hlong=(longsize-1)/2;
cyclefeature=[];
h=waitbar(0,'周期特征计算中');
for i=u+1:2*u
    for j=v+1:2*v
        huidu=[];
        huidu(1:longsize)=I1(i,j-hlong:j+hlong);
        fu=fft(huidu);
        fuzhi=abs(fu);
        [~,place]=sort(fuzhi,'descend');
%         if max(2)==0
%             place(2)=0;
%         end
        cyclefeature(i-u,j-v)=place(2);
    end
    waitbar((i-u)/u);
end
close(h);

% cyclefeature=longsize./cyclefeature;

figure,imshow(cyclefeature,[]);

end

