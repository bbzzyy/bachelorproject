function rutimage = imagesegment(center,U,locationmat)
%imagesegment����������������Ⱦ���������������з��࣬��ɶ�ͼ��ĳ��ָ�
%���룺
%center����������
%U�������Ⱦ���
%locationmat��λ���������
%�����
%rutimage�����ͼ�񣬰�ɫΪ�ǳ��ޣ���ɫΪ����

U=U';
center=center';
rutimage=[];
if center(1,1)>center(1,2)
    ep=0;
else
    ep=1;
end
total=size(locationmat,1);
for i=1:total
    x=locationmat(i,1);
    y=locationmat(i,2);
    if U(i,1)<U(i,2)
        rutimage(x,y)=-ep+1;
    else
        rutimage(x,y)=ep;
    end
end

end

