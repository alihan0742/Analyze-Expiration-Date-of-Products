function letter=read_letter(imagn,num_letras)
global templates
comp=[ ]; % COMPARE ETMEK ���N BO� B�R MATR�X TANIMLIYORUZ.
for n=1:num_letras % 1'DEN 36'YA KADAR.
    sem=corr2(templates{1,n},imagn); % HER B�R KARAKTERLERLE OLAN BENZERL���N� BULUYOR.
    comp=[comp sem]; % BULUNAN BENZERL�KLER� COMP MATR�X�NE TEK SATIR OLU�TURACAK �EK�LDE YERLE�T�R�YORUZ.
end
vd=find(comp==max(comp)); % COMP MATR�X�NDEK� EN Y�KSEK ORANDA OLANINI, YAN� EN �OK BENZEYEN�N� ALIYORUZ.
if vd==1
    letter='A';
elseif vd==2
    letter='B';
elseif vd==3
    letter='C';
elseif vd==4
    letter='D';
elseif vd==5
    letter='E';
elseif vd==6
    letter='F';
elseif vd==7
    letter='G';
elseif vd==8
    letter='H';
elseif vd==9
    letter='I';
elseif vd==10
    letter='J';
elseif vd==11
    letter='K';
elseif vd==12
    letter='L';
elseif vd==13
    letter='M';
elseif vd==14
    letter='N';
elseif vd==15
    letter='O';
elseif vd==16
    letter='P';
elseif vd==17
    letter='Q';
elseif vd==18
    letter='R';
elseif vd==19
    letter='S';
elseif vd==20
    letter='T';
elseif vd==21
    letter='U';
elseif vd==22
    letter='V';
elseif vd==23
    letter='W';
elseif vd==24
    letter='X';
elseif vd==25
    letter='Y';
elseif vd==26
    letter='Z';
    %*-*-*-*-*
elseif vd==27
    letter='1';
elseif vd==28
    letter='2';
elseif vd==29
    letter='3';
elseif vd==30
    letter='4';
elseif vd==31
    letter='5';
elseif vd==32
    letter='6';
elseif vd==33
    letter='7';
elseif vd==34
    letter='8';
elseif vd==35
    letter='9';
else
    letter='I';
end

