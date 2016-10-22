close all
clear all
load('C:\Users\Admin\Desktop\czx\Processing program\good1 - to likai\fengchenchen\oxy_Hb');   %加载数据
load('C:\Users\Admin\Desktop\czx\Processing program\good1 - to likai\fengchenchen\deoxy_Hb');
load('C:\Users\Admin\Desktop\czx\Processing program\good1 - to likai\fengchenchen\tot_Hb');
%提取不同任务的数据
firstBackOxy_Hb=oxy_Hb(:,54:313);   %第一次back，HbO2的数据
secondBackOxy_Hb=oxy_Hb(:,367:626); %第二次back，HbO2的数据
thirdBackOxy_Hb=oxy_Hb(:,679:938);  %第三次back，HbO2的数据

firstBackDeoxy_Hb=deoxy_Hb(:,54:313);
secondBackDeoxy_Hb=deoxy_Hb(:,367:626);
thirdBackDeoxy_Hb=deoxy_Hb(:,679:938);

firstBackTot_Hb=tot_Hb(:,54:313);
secondBackTot_Hb=tot_Hb(:,367:626);
thirdBackTot_Hb=tot_Hb(:,679:938);
Fs=2.62;
T = 1/Fs;                     
L = 990;                    
t = (0:L-1)*T;                
% window=hanning(57);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:16
    subplot(4,4,i)
    [Pxx,Wxx]=pwelch(firstBackOxy_Hb(i,:),128,[],[],Fs);
    %[Pxy,Wxy]=cpsd(firstBackOxy_Hb(i,:),firstBackTot_Hb(i,:),128,[],[],Fs);
   % Hf=Pxy./Pxx;
   % [Coh,Wcoh]=mscohere(firstBackOxy_Hb(i,:),firstBackTot_Hb(i,:),128,[],[],Fs);
   % faif=atand(imag(Hf)./real(Hf));
   % ww=0:0.001:1.3;
   % faif=interp1(Wcoh,faif,ww);
   % Coh=interp1(Wcoh,Coh,ww);
    axis([0 0.2 0 1])
 %   [AX,H1,H2]=plotyy(ww,faif,ww,Coh)
 plot(Wxx,Pxx)
    hold on
    
  %   y=-20.*ones(1,1301);
   %  plot(ww,y)

  %  set(get(AX(1),'Ylabel'),'String','\Phi(f)'); 
 % %  set(get(AX(2),'Ylabel'),'String','Coh(f)');
 %   xlabel('Frequency(Hz)'); 
 %   title('\Phi(f) and Coh(f) at firstBack HbO2 vs.Tb');
 %   set(H2,'LineStyle',':');
 %       set(AX(1), 'YLim', [-100 100]);
 %   set(AX(1),'YTick',[-100:100:100]);
 %   set(AX(2), 'YLim', [0 1]);
 %   set(AX(2),'YTick',[0:0.5:1]);

    %set(H2,'YLim',[0,1]);
 %   set(AX(1),'XLim',[0 0.2]);
 %   set(AX(2),'XLim',[0 0.2]) 
end