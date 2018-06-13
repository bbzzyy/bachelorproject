function [gabormean,gabordeviation]=extractgabor(I,extsize,filtersize,sideangle)
%extractgabor����ȡͼ���gabor��������׼��;�ֵ��
%���룺
%I���Ҷ�ͼ��
%extsize��������ȡ���ڴ�С
%filtersize���˲������ڴ�С��23��
%sideangle�����޲�ƫ��
%�����
%gabormean��gabor��ֵ����
%gabordeviation��gabor��׼������

[~,IG1] = gaborfilter(I,sideangle,filtersize,filtersize,5);
[~,IG2] = gaborfilter(I,sideangle,filtersize,filtersize,10);
[~,IG3] = gaborfilter(I,sideangle,filtersize,filtersize,15);
[~,IG4] = gaborfilter(I,sideangle,filtersize,filtersize,20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %
% figure,imshow(IG1,[]);
% figure,imshow(IG2,[]);
% figure,imshow(IG3,[]);
% figure,imshow(IG4,[]);
% %
[m,n]=size(I);
total=m*n;
l1=reshape(IG1,total,1);
l2=reshape(IG2,total,1);
l3=reshape(IG3,total,1);
l4=reshape(IG4,total,1);
stdm=[];
stdm(1,1)=std(l1);
stdm(1,2)=std(l2);
stdm(1,3)=std(l3);
stdm(1,4)=std(l4);
h=stdm./sum(stdm);
IG=h(1)*IG1+h(2)*IG2+h(3)*IG3+h(4)*IG4;
% figure,imshow(IG,[]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IG=(IG1+IG2+IG3+IG4)/4;
% figure,imshow(IG,[]);

IG=duichen(IG);

zd=(extsize-1)/2;
nxs=m+1;
nxt=2*m;
nys=n+1;
nyt=2*n;

h=waitbar(0,'gabor����������');
for i=nxs:nxt
    for j=nys:nyt
        p(:,:)=IG(i-zd:i+zd,j-zd:j+zd);
        gabormean(i-m,j-n)=mean(p(:));
        summ=0;
        for x=1:extsize
            for y=1:extsize
                cha=p(x,y)-gabormean(i-m,j-n);
                summ=summ+cha^2;
            end
        end
        gabordeviation(i-m,j-n)=sqrt(summ/(extsize^2));
    end
    waitbar((i-m)/m);
end
close(h);

end

