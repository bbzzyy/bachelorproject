function sideangle = extsideangle(I)
%extsideangle����ȡ��������ķ���Ƕ�
%���룺
%I���Ҷ�ͼ��
%�����
%sideangle�����޲�ƫ��

[m,n]=size(I);
If=fft2(I);
Ifs=fftshift(If);
Ia=abs(Ifs);
spfsal=Ia.^2;
% xz��x�����ϵ��е�
% yz��y�����ϵ��е�
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

% %��ʾ����ҶƵ�׽Ƕȷֲ���ѡ��ע��
% figure,plot(sigma);

[~,place]=sort(sigma,'descend');
% ������Ƕ�������ȡ
if place(1)==1 && (place(2)==91 || place(3)==90)
    te=place(4);
elseif place(1)==1
    te=place(2);
else
    te=place(1);
end
te=(te*pi)/180;
%�ǶȻ��㹫ʽ
sideangle=(atan(1/(-tan(te-pi)*(n/m)))*180)/pi;

end

