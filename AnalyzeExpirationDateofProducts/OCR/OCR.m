clc, close all, clear all % PROGRAMI �ALI�TIRMADAN �NCE �ALI�IR DURUMDAK� T�M UYGULAMALARI VE PENCERELER� KAPATMAK VE AYRICA COMMAND W�NDOWU TEM�ZLEMEK ���N.
%a=videoinput('winvideo',1);
%start(a);
%preview(a);
%pause;
%a=getsnapshot(a);
%image=a;
image=imread('deneme2.jpg');
image=rgb2gray(image);
m=size(image,1);
r=size(image,2);
t=size(image,3);
    for b=1:m
        for c=1:r
            if image(b,c)>=12
                image(b,c)=255;
            else
                x=1;
            end
        end
    end
imshow(image); % INPUT RESM�N� G�STERME.
imagen=image;
title('INPUT RESMI') % �NPUT RESM�NE BA�LIK KOYMA.
%if size(imagen,3)==3 % RESM� B�NAY YAPMAK ���N �NCE RESM� GRAY KODA D�N��T�R�YORUZ.
%   imagen=rgb2gray(imagen);
%end
threshold = graythresh(imagen); % T�M RESM� BAZ ALARAK(ORTALAMA) MATLAB OTOMAT�K OLARAK THRESHOLD DE�ER� ATIYOR.
imagen =~im2bw(imagen,threshold); % �NPUT RESM�M�ZE UYGULUYORUZ. FAKAT NOT EQUAL OPERATORUNU KULLANIYORUZ CUNKU B�Z�M TEMPLATESLER�M�Z S�YAH �ZER�NE BEYAZ KARAKTERLER.
imagen = bwareaopen(imagen,30);% 30-CONNECTED NE�GHBORHOOD OLMAYANLARI RES�MDEN EL�YORUZ. S�YAH(SIFIR) YAPIYORUZ.
x=[0 1 1 1 0; 1 1 1 1 1; 0 1 1 1 0];
y=[1 1 1 1;1 1 1 1;1 1 1 1];
imagen=imdilate(imagen,x);
imagen=imerode(imagen,y);
word=[ ]; % text DOSYASINA YAZACA�IMIZ KARAKTERLER� WORD STR�NG�NDE DEPOLAYACA�IZ.
re=imagen; % KOLAY YAZMAK ���N KISALTIYORUZ.
sonuc=[];
toplam_puan=0;
fid = fopen('text.txt', 'wt');
load templates % BEL�NEN TEPMLATESLER� Y�KLEME.
global templates % TEMPLATESLER� PROGRAM ��ER�S�NDE GLOBAL YAPMA.
num_letras=size(templates,2); % 36 TANE KARAKTER�M�Z VAR(HARFLER VE RAKAMLAR OLMAK �ZERE)
while 1
    [fl re]=lines(re); % L�NES FONKS�YONU
    imgn=fl;
    [L Ne] = bwlabel(imgn); % BURADA RESM�N ���NDEK� COMPONENTLER�(FARKLI KARAKTERLER�) TANIMLIYORUZ. "NE" KA� TANE KARAKTER OLDU�UNU G�STER�YOR.
    for n=1:Ne
        [r,c] = find(L==n); % MESELA n=2 ���N BULDU�U COMPONENT(KARAKTER) RC MATR�X�N� OLU�TURUYOR. RC MATR�X� ONUN YER�N� BEL�RL�YOR(LOCAT�ON). 
        n1=imgn(min(r):max(r),min(c):max(c)); % N1 COMPONENT�(KARAKTER) ���N SOL �STEN SA� ALTA KADAR SINIRLIYORUZ ONU, O COMPONENT� OLU�TURAN YERLER� BEL�RT�YOR. 
        img_r=imresize(n1,[42 24]); % TEMPLATESLER�M�Z 42X24 P�XEL OLDUKLARI ���N, BULUNAN KARAKTER� YEN�DEN BOYUTLANDIRIYORUZ.
        letter=read_letter(img_r,num_letras); % READ_LETTER FONKS�YONU �A�IRILIYOR.
        word=[word letter]; % WORD MATR�X� ��ER�S�NE BULUNAN KARAKTER YAZILIYOR. HER SEFER�NDE BULUNAN KARAKTER S�L�NMEMES� ���N BU FORMATTA TANIMLIYORUZ.     
    end
    kutuphane=textread('text1.txt','%s'); % TEXT1.TXT DOSYASINDAN SATIR SATIR STRING �EKL�NDE ALIYORUZ DATA'YI.
    a=strfind(kutuphane,word); %HANG� SATIRDA �SE ONU BULUYORUZ.
    sonuc=[sonuc a]; % YAN YANA KEL�MELER�N�N KACINCI SATIRDA OLDUGUNU BELIRTIYOR.
    fprintf(fid,'%s\n',word); % �LK SATIRDAK� T�M KARAKTERLER TANIMLANIP WORD MATR�X�NE YAZILDIKTAN SONRA, �LK SATIRI TEXT DOSYASININ �LK SATIRINA YAZIYORUZ.
    word=[ ]; % �K�NC� SATIR ���N , MATR�S� BO�ALTIYORUZ.
    if isempty(re) % E�ER RE BO�SA LOOPTAN �IKIYORUZ.
        break
    end    
end
sonuc
fclose(fid); % TEXT DOSYASINI KAPATIYORUZ.
winopen('text.txt')
clear all