function image = lightenhance( I,m,n,gama)
%lightenhance��ͼ��Ԥ����У����
%���룺
%I���Ҷ�ͼ��
%m��n����˹�˺����˲�����С��31,31��
%gama��У��ϵ����1.5��
%�����
%image����ǿ��ĳ���ͼ��

I1=double(I);
I0=log(I1);
sum=0;
%
c=100;
%
for u=1:m
    for v=1:n
        x=u-((m+1)/2);
        y=v-((n+1)/2);
        sum=sum+exp(-(x^2+y^2)/(c^2));
    end
end
lam=1/sum;
for u=1:m
    for v=1:n
        x=u-((m+1)/2);
        y=v-((n+1)/2);
        g(u,v)=lam*exp(-(x^2+y^2)/(c^2));
    end
end
I2=imfilter(I1,g,'replicate');
%
% figure,imshow(I2,[]);
%
R=im2uint8(mat2gray(exp(I0-log(I2))));

% gama=1.5;
p=255/255^(gama);p=(1/p)^(1/gama);
[u,v]=size(R);
for i=1:u
    for j=1:v
        image(i,j)=floor(p*double(R(i,j))^(1/gama));
    end
end

end

