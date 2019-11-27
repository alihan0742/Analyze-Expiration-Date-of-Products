se=imread('ürün.jpg');
f=imresize(se,[400 NaN]);
g=rgb2gray(f);
%g=medfilt2(g,[3 3]);
%se=strel('disk',10);
%gi=imdilate(g,se);
%ge=imerode(g,se);
%gdiff=imsubtract(gi,ge);
%gdiff=mat2gray(gdiff);
%gdiff=conv2(gdiff,[1 1;1 1]);
%gdiff=imadjust(gdiff,[0.5 0.7],[0 1],0.1);
%B=logical(gdiff);
%imshow(gdiff)
%er=imerode(B,strel('line',50,0));
%out1=imsubtract(B,er);
%F=imfill(out1,'holes');
%H=bwmorph(F,'thin',1);
%H=imerode(H,strel('line',3,90));
%final=bwareaopen(H,100);
%imshow(H)
se=strel('rectangle',[20,20]);
%se = strel('disk',9);
tophatFiltered = imtophat(g,se);
contrastAdjusted = imadjust(tophatFiltered);
figure, imshow(contrastAdjusted);
