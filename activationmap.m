%{
% load('matlab.mat');
close all;
clc;
clear all;
back1=xlsread('D:\Program Files\MATLAB\R2010b\my programs\Processing program\good2\duanzhaojun2\1.xls',1);
back2=xlsread('D:\Program Files\MATLAB\R2010b\my programs\Processing program\good2\duanzhaojun2\3.xls',2);
back3=xlsread('D:\Program Files\MATLAB\R2010b\my programs\Processing program\good2\duanzhaojun2\3.xls',3);
back_1=xlsread('D:\Program Files\MATLAB\R2010b\my programs\Processing program\good2\duanzhaojun2\1.xls',1);
back_2=xlsread('D:\Program Files\MATLAB\R2010b\my programs\Processing program\good2\duanzhaojun2\3.xls',2);
back_3=xlsread('D:\Program Files\MATLAB\R2010b\my programs\Processing program\good2\duanzhaojun2\3.xls',3);
%male Choose
oxy=[mean(back1(:,1:16));mean(back2(:,1:16));mean(back3(:,1:16))];
deoxy=[mean(back1(:,17:32));mean(back2(:,17:32));mean(back3(:,17:32))];
tot=[mean(back1(:,33:48));mean(back2(:,33:48));mean(back3(:,33:48))];
% %female Choose
% oxy=[mean(back_1(:,1:16));mean(back_2(:,1:16));mean(back_3(:,1:16))];
% deoxy=[mean(back_1(:,17:32));mean(back_2(:,17:32));mean(back_3(:,17:32))];
% tot=[mean(back_1(:,33:48));mean(back_2(:,33:48));mean(back_3(:,33:48))];
%}

% load('matlab.mat');
%只有能测试一个确定BACK下不同正确率的PSD图
close all;
clc;
clear all;
set(0,'DefaultAxesLineStyleOrder','-|-.|--|:');
get_accuracy_total=[];
get_back_total=[];
psd_total_each_channel=cell(100,16);
%%%%for acitonmap
action_oxy=cell(100,2);
action_deoxy=cell(100,2);
action_tot=cell(100,2);
for i=1:100
    action_oxy{i,1}=zeros(701,301)';
    action_oxy{i,2}=zeros(1,1);
    action_deoxy{i,1}=zeros(701,301)';
    action_deoxy{i,2}=zeros(1,1);
    action_tot{i,1}=zeros(701,301)';
    action_tot{i,2}=zeros(1,1);
end

    
%%%%
sel=1;
time=0;
nn=0;
%%%%time getting
aver_time=[];
%%%%
  for l=1:32 
     % if (l~=1)&(l~=9)&(l~=11)&(l~=15)&(l~=16)&(l~=18)&(l~=21)&(l~=28)&(l~=30)
      %if (l~=0)&(l~=4)&(l~=6)&(l~=11)&(l~=1)&(l~=10)
if (l~=0)&(l~=27)    %%%for 1 back
%if (l~=0)&(l~=1)&(l~=2)&(l~=4)&(l~=6)&(l~=9)&(l~=11)&(l~=14)&(l~=15)&(l~=16)&(l~=22)&(l~=23)&(l~=25)   %%%for 2 back
                                              %user 2 for the only one line, user22 for the 因为在89中，产生了一个很大阶跃，user9,14，15 ，25for the 因为在100中，起始位太低，
                                              %user6 for the 因为在96中，0。45-0.6之间的值超过了100的对应值，舍弃 
                                          %user 4 for the power
                                          %a=100,user16,a=96,to increase
                                          %the a96,user1,for the
                                          %increase,of the power ,a=89,to
                                          %test
                                        
                                          
                                  
% if (l~=0)&(l~=7)&(l~=21)&(l~=25)&(l~=32)      %%%for 3 back  
                                      %25用户在100中，单一的例子，舍弃，用户32在92的正确率中，使得其开始偏低，用户21在92的正确率中，dai ce使得其开始偏低,7用户在88正确率时，在0.07处太高了
                                      %15,16用户中的导致power有点低,16 for 
                                                
      time=time+1;
%  l=1;    
 backall=xlsread(strcat('C:\Users\Admin\Desktop\czx\Processing program\good1 - to likai\',int2str(l),'\1.xls'),1);
%backall=xlsread('C:\Users\Admin\Desktop\czx\Processing program\good1 - to likai\liusiting\1.xls',1)
[r,c]=find(0<backall&backall<101)
%[r,c,v]=find(0<backall&backall<101)
get_back_order=[backall(1,1);backall(36,1);backall(71,1)];%可能是123也可能是132之类需要进行下次匹配，行向量,
get_accuracy=[backall(34,1);backall(69,1);backall(104,1)];%每次的order之后进行的正确率，行向量
get_accuracy_total=[get_accuracy_total,get_accuracy]
get_back_total=[get_back_total,get_back_order]

%[r,c]=find(0<backall)
for i=3:32
  get_back_order_time(1,i-2)=backall(i,4);%对应次数back的responsetime进行分析
end
for i=38:74
  get_back_order_time(2,i-37)=backall(i,4);
end
for i=73:102
  get_back_order_time(3,i-72)=backall(i,4);
end

%strcat('C:\Users\Admin\Desktop\czx\Processing program\good1 - to likai\',int2str(l),'\oxy_Hb')
load(strcat('C:\Users\Admin\Desktop\czx\Processing program\good1 - to likai\',int2str(l),'\oxy_Hb'));   %加载数据
load(strcat('C:\Users\Admin\Desktop\czx\Processing program\good1 - to likai\',int2str(l),'\deoxy_Hb'));
load(strcat('C:\Users\Admin\Desktop\czx\Processing program\good1 - to likai\',int2str(l),'\tot_Hb'));



Fs=2.62;
divide_1=floor(20*Fs);
divide_2=floor(128*Fs);
divide_3=floor(140*Fs);
divide_4=floor(240*Fs);
divide_5=floor(260*Fs);
divide_6=floor(360*Fs);

%{
Fs=3.3;
divide_1=floor(0*Fs+1);
divide_2=floor(90*Fs);
divide_3=floor(91*Fs);
divide_4=floor(181*Fs);
divide_5=floor(182*Fs);
divide_6=floor(271*Fs);
%}

T = 1/Fs;                     
L = 990;                    
t = (0:L-1)*T; 
%提取不同任务的数据
%进入匹配，得到每个back对应的正确率，含量值

%发过来寻找，利用find，If的判断太多了,但是粗略判断了一下，还是有很多的back
%a1=find(get_back_order==1)
if get_back_order(1,1)==1&&get_back_order(2,1)==2&&get_back_order(3,1)==3
    
    firstBackOxy_Hb=oxy_Hb(:,divide_1:divide_2);   %第一次back，HbO2的数据
    firstBackDeoxy_Hb=deoxy_Hb(:,divide_1:divide_2);
    firstBackTot_Hb=tot_Hb(:,divide_1:divide_2);
    %%%%%%%%%%%%%%%get the response time
    %%%不方便，用find 语句来构造
    
    %%%%%%%%%%%%%%%
    
    
    secondBackOxy_Hb=oxy_Hb(:,divide_3:divide_4); %第二次back，HbO2的数据
    secondBackDeoxy_Hb=deoxy_Hb(:,divide_3:divide_4);
    secondBackTot_Hb=tot_Hb(:,divide_3:divide_4);
    
    thirdBackOxy_Hb=oxy_Hb(:,divide_5:divide_6);  %第三次back，HbO2的数据
    thirdBackDeoxy_Hb=deoxy_Hb(:,divide_5:divide_6);
    thirdBackTot_Hb=tot_Hb(:,divide_5:divide_6);
    
    firstback_accuracy=get_accuracy(1,1);
    secondback_accuracy=get_accuracy(2,1);
    thirdback_accuracy=get_accuracy(3,1);
    
   elseif get_back_order(1,1)==1&&get_back_order(2,1)==3&&get_back_order(3,1)==2
        firstBackOxy_Hb=oxy_Hb(:,divide_1:divide_2);   %第一次back，HbO2的数据
        firstBackDeoxy_Hb=deoxy_Hb(:,divide_1:divide_2);
        firstBackTot_Hb=tot_Hb(:,divide_1:divide_2);
        
         thirdBackOxy_Hb=oxy_Hb(:,divide_3:divide_4); %第二次back，HbO2的数据
         thirdBackDeoxy_Hb=deoxy_Hb(:,divide_3:divide_4);
         thirdBackTot_Hb=tot_Hb(:,divide_3:divide_4);
         
          secondBackOxy_Hb=oxy_Hb(:,divide_5:divide_6);  %第三次back，HbO2的数据
           secondBackDeoxy_Hb=deoxy_Hb(:,divide_5:divide_6);
            secondBackTot_Hb=tot_Hb(:,divide_5:divide_6);  
            
            firstback_accuracy=get_accuracy(1,1);
    thirdback_accuracy=get_accuracy(2,1);
    secondback_accuracy=get_accuracy(3,1);
    
         
        
        elseif get_back_order(1,1)==2&&get_back_order(2,1)==1&&get_back_order(3,1)==3
             secondBackOxy_Hb=oxy_Hb(:,divide_1:divide_2);   %第一次back，HbO2的数据
    secondBackDeoxy_Hb=deoxy_Hb(:,divide_1:divide_2);
    secondBackTot_Hb=tot_Hb(:,divide_1:divide_2);
    
    firstBackOxy_Hb=oxy_Hb(:,divide_3:divide_4); %第二次back，HbO2的数据
    firstBackDeoxy_Hb=deoxy_Hb(:,divide_3:divide_4);
    firstBackTot_Hb=tot_Hb(:,divide_3:divide_4);
    
    thirdBackOxy_Hb=oxy_Hb(:,divide_5:divide_6);  %第三次back，HbO2的数据
    thirdBackDeoxy_Hb=deoxy_Hb(:,divide_5:divide_6);
    thirdBackTot_Hb=tot_Hb(:,divide_5:divide_6);
    
    secondback_accuracy=get_accuracy(1,1);
    firstback_accuracy=get_accuracy(2,1);
    thirdback_accuracy=get_accuracy(3,1);
    
             elseif get_back_order(1,1)==2&&get_back_order(2,1)==3&&get_back_order(3,1)==1
                  secondBackOxy_Hb=oxy_Hb(:,divide_1:divide_2);   %第一次back，HbO2的数据
    secondBackDeoxy_Hb=deoxy_Hb(:,divide_1:divide_2);
    secondBackTot_Hb=tot_Hb(:,divide_1:divide_2);
    
    thirdBackOxy_Hb=oxy_Hb(:,divide_3:divide_4); %第二次back，HbO2的数据
    thirdBackDeoxy_Hb=deoxy_Hb(:,divide_3:divide_4);
    thirdBackTot_Hb=tot_Hb(:,divide_3:divide_4);
    
    firstBackOxy_Hb=oxy_Hb(:,divide_5:divide_6);  %第三次back，HbO2的数据
    firstBackDeoxy_Hb=deoxy_Hb(:,divide_5:divide_6);
    firstBackTot_Hb=tot_Hb(:,divide_5:divide_6);
    
      secondback_accuracy=get_accuracy(1,1);
    thirdback_accuracy=get_accuracy(2,1);
    firstback_accuracy=get_accuracy(3,1);
    
                  elseif get_back_order(1,1)==3 && get_back_order(2,1)==1 && get_back_order(3,1)==2
                      thirdBackOxy_Hb=oxy_Hb(:,divide_1:divide_2);   %第一次back，HbO2的数据
    thirdBackDeoxy_Hb=deoxy_Hb(:,divide_1:divide_2);
    thirdBackTot_Hb=tot_Hb(:,divide_1:divide_2);
    
    firstBackOxy_Hb=oxy_Hb(:,divide_3:divide_4); %第二次back，HbO2的数据
    firstBackDeoxy_Hb=deoxy_Hb(:,divide_3:divide_4);
    firstBackTot_Hb=tot_Hb(:,divide_3:divide_4);
    
    secondBackOxy_Hb=oxy_Hb(:,divide_5:divide_6);  %第三次back，HbO2的数据
    secondBackDeoxy_Hb=deoxy_Hb(:,divide_5:divide_6);
    secondBackTot_Hb=tot_Hb(:,divide_5:divide_6);
    
     thirdback_accuracy=get_accuracy(1,1);
    firstback_accuracy=get_accuracy(2,1);
   secondback_accuracy=get_accuracy(3,1);
else
   
            thirdBackOxy_Hb=oxy_Hb(:,divide_1:divide_2);   %第一次back，HbO2的数据
    thirdBackDeoxy_Hb=deoxy_Hb(:,divide_1:divide_2);
    thirdBackTot_Hb=tot_Hb(:,divide_1:divide_2);
    
    secondBackOxy_Hb=oxy_Hb(:,divide_3:divide_4); %第二次back，HbO2的数据
    secondBackDeoxy_Hb=deoxy_Hb(:,divide_3:divide_4);
    secondBackTot_Hb=tot_Hb(:,divide_3:divide_4);
    
    firstBackOxy_Hb=oxy_Hb(:,divide_5:divide_6);  %第三次back，HbO2的数据
    firstBackDeoxy_Hb=deoxy_Hb(:,divide_5:divide_6);
    firstBackTot_Hb=tot_Hb(:,divide_5:divide_6);    
    
    thirdback_accuracy=get_accuracy(1,1);
    secondback_accuracy=get_accuracy(2,1);
   firstback_accuracy=get_accuracy(3,1);
end                  
                   

  
%{
firstBackOxy_Hb=oxy_Hb(:,divide_1:divide_2);   %第一次back，HbO2的数据
secondBackOxy_Hb=oxy_Hb(:,divide_3:divide_4); %第二次back，HbO2的数据
thirdBackOxy_Hb=oxy_Hb(:,divide_5:divide_6);  %第三次back，HbO2的数据

firstBackDeoxy_Hb=deoxy_Hb(:,divide_1:divide_2);
secondBackDeoxy_Hb=deoxy_Hb(:,divide_3:divide_4);
thirdBackDeoxy_Hb=deoxy_Hb(:,divide_5:divide_6);

firstBackTot_Hb=tot_Hb(:,divide_1:divide_2);
secondBackTot_Hb=tot_Hb(:,divide_3:divide_4);
thirdBackTot_Hb=tot_Hb(:,divide_5:divide_6);
    %}

%{
firstBackDeoxy_Hb=deoxy_Hb(:,54:313);
secondBackDeoxy_Hb=deoxy_Hb(:,367:626);
thirdBackDeoxy_Hb=deoxy_Hb(:,679:938);

firstBackTot_Hb=tot_Hb(:,54:313);
secondBackTot_Hb=tot_Hb(:,367:626);
thirdBackTot_Hb=tot_Hb(:,679:938);
%}   

% window=hanning(57);
%不能求和平均
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if sel==1      
        
%%%%%%get the response time
    sum_aver_time=0;
    line=find(get_back_order==1);
    for ii=1:30
    sum_aver_time=get_back_order_time(line,ii)+sum_aver_time;
    end
    aver_time=[sum_aver_time/30,aver_time];
%%%%%%

for ii=70:100
if firstback_accuracy==ii  
       nn=nn+1;
       
     %%%%%%%%%%%%%%%%%求colormap   
     oxy=[mean(firstBackOxy_Hb');mean(secondBackOxy_Hb');mean(thirdBackOxy_Hb')];
     deoxy=[mean(firstBackDeoxy_Hb');mean(secondBackDeoxy_Hb');mean(thirdBackDeoxy_Hb')];
     tot=[mean(firstBackTot_Hb');mean(secondBackTot_Hb');mean(thirdBackTot_Hb')];
    
    
    i=1

for i=1:3
    OxyHb=oxy(i,:);
    DeoxyHb=deoxy(i,:);
    TotHb=tot(i,:);
    Dhb=[0 0 0 0 0 0 0 0;DeoxyHb(15) DeoxyHb(13) DeoxyHb(11) DeoxyHb(9) DeoxyHb(7) DeoxyHb(5) DeoxyHb(3) DeoxyHb(1);DeoxyHb(16) DeoxyHb(14) DeoxyHb(12) DeoxyHb(10) DeoxyHb(8) DeoxyHb(6) DeoxyHb(4) DeoxyHb(2);0 0 0 0 0 0 0 0];
    Dhb=Dhb';
    Ohb=[0 0 0 0 0 0 0 0;OxyHb(15) OxyHb(13) OxyHb(11) OxyHb(9) OxyHb(7) OxyHb(5) OxyHb(3) OxyHb(1);OxyHb(16) OxyHb(14) OxyHb(12) OxyHb(10) OxyHb(8) OxyHb(6) OxyHb(4) OxyHb(2);0 0 0 0 0 0 0 0];
    Ohb=Ohb';
    Thb=[0 0 0 0 0 0 0 0;TotHb(15) TotHb(13) TotHb(11) TotHb(9) TotHb(7) TotHb(5) TotHb(3) TotHb(1);TotHb(16) TotHb(14) TotHb(12) TotHb(10) TotHb(8) TotHb(6) TotHb(4) TotHb(2);0 0 0 0 0 0 0 0];
    Thb=Thb';
    x=0:3;y=0:7;[X,Y]=meshgrid(x,y);
    xi=0:0.01:3;
    yi=0:0.01:7;
    [XI,YI]=meshgrid(xi,yi);
    ZID=interp2(X,Y,Dhb,XI,YI,'*spline');
    ZID(find(ZID>-0.001&ZID<0.001))=0/0;
    figure(1),subplot(3,3,3*i),imagesc(ZID',[-0.015 0.015]);
    colormap('jet')
    colorbar('location','southoutside');
    title('Deoxy-Hb');
    axis image;
    axis off
    figure(2),subplot(3,3,3*i);plot((ZID(351,:)).*10);
    axis([0,301,-0.15, 0.15]);
    title('Deoxy-Hb');
    
    ZIO=interp2(X,Y,Ohb,XI,YI,'*spline');
    ZIO(find(ZIO<0.0001))=0/0;
    figure(1),subplot(3,3,3*i-2),imagesc(ZIO',[0.02 0.08]);
    colormap('jet')
    colorbar('location','southoutside');
    title('Oxy-Hb');
    axis image;
    axis off
    figure(2),subplot(3,3,3*i-2);plot((ZIO(351,:)).*10);
    axis([0,301,0.2, 1]);
    title('Oxy-Hb');
    
    ZIT=interp2(X,Y,Thb,XI,YI,'*spline');
    ZIT(find(ZIT<0.04))=0/0;
    figure(1),subplot(3,3,3*i-1),imagesc(ZIT',[0.02 0.08]);
    colormap('jet')
    colorbar('location','southoutside');
    title('Tot-Hb');
    axis image;
    axis off
    figure(2),subplot(3,3,3*i-1),plot((ZIT(351,:)).*10);
    axis([0,301,0.2, 1]);
    title('Tot-Hb');
end
end
end

