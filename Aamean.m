 clc,clear all
OD0 = [10;10];
for i=1:16
for t=1:8              %8´Î
%num=[1,49;2,50;3,51;4,52;15,63;16,64;17,68;18,66;5,53;6,54;7,55;8,56;9,57;10,58;21,69;22,70;23,71;24,72;11,59;12,60;13,61;14,62;19,67;20,68]; % 735&850
num=[1,49;2,50;3,51;4,52;15,63;16,64;17,68;18,66;5,53;6,54;7,55;8,56;13,61;14,62;19,67;20,68];%735&850
%for i=1:20  %20¸öÌ½²âÆ÷
Rawdata =  xlsread(strcat(num2str(t),'a.xls'));
%OD0 = [mean(Rawdata(50:100,num(i,1)));mean(Rawdata(50:100,num(i,2)))]; 
[m,k]=size(Rawdata);
CVDI=zeros(3,m);   
 %a[m(i),n(i)]=Rawdata{i};
 for n=1:m 
   CVDI(1,n) = 0.21*(-0.5643*(log10(OD0(1)) - log10(Rawdata(n,num(i,1)))) + (log10(OD0(2)) - log10(Rawdata(n,num(i,2)))));              %hb02
   CVDI(2,n) = 0.21*(0.7538*(log10(OD0(1)) - log10(Rawdata(n,num(i,1))))  - 0.434*(log10(OD0(2)) - log10(Rawdata(n,num(i,2)))));        %hb
   CVDI(3,n) = 0.21*(0.1895*(log10(OD0(1)) - log10(Rawdata(n,num(i,1))))  + 0.5659*(log10(OD0(2)) - log10(Rawdata(n,num(i,2)))));
 end
 hbo2(t)=mean(CVDI(1,:));
  hb(t)=mean(CVDI(2,:));
 
end
 figure(i)
x=1:8;
p=polyfit(x,hbo2,3);
f=polyval(p,x);
plot(hbo2,'r*','MarkerSize',10);
hold on;
plot(x,f,'r-');
 x=1:8;
p=polyfit(x,hb,3);
f=polyval(p,x);
plot(hb,'b*','MarkerSize',10);
hold on;
plot(x,f,'b-');

end
