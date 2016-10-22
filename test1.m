clear;
clc;
Standardresponse=xlsread('F:\presentation\Demo\test\cc\Book1.xls',3,'D1:D200');
Trialn=zeros(2,1);
Response=zeros(2,1);
Responsetime=zeros(2,1);

k=1;
for k = 1:8
    fid=fopen(strcat(num2str(k),'.txt'));
    tline=fgetl(fid);
    i=1;
    while ischar(tline)
        disp(tline);
        ind=find(tline==' ');
        temp=tline(1:(ind(1)-1));
        Trialn(i)=str2num(temp);

        temp=tline(ind(2)+1);
        Response(i)=str2num(temp);

        temp=tline((ind(4)+1):(ind(5)-1));
        Responsetime(i)=str2double(temp);

        i=i+1;
        tline = fgetl(fid);
    end
    fclose(fid);
    Responsecalibrated=zeros(200,1);
    
    for j=1:i-1    
        Responsecalibrated(Trialn(j))=Response(j);
    end
    ind=find(Responsecalibrated==Standardresponse);
    Accuracy(k,1)=length(ind)/200;
    Errrate(k,1)=1-Accuracy(k,1);
    Meanresponsetime(k,1)=mean(Responsetime);
    Behaviorperformance(k,1)=Accuracy(k,1)/Meanresponsetime(k,1);
end
figure(1)
plot(Accuracy','*','MarkerSize',10);
x=1:8;
p=polyfit(x,Accuracy',3);
f=polyval(p,x);
plot(Accuracy','*','MarkerSize',10);
hold on;
plot(x,f,'-');
xlabel('#');
ylabel('Accuracy');
figure(2)
plot(Meanresponsetime','*','MarkerSize',10);
x=1:8;
p=polyfit(x,Meanresponsetime',3);
f=polyval(p,x);
plot(Meanresponsetime','*','MarkerSize',10);
hold on;
plot(x,f,'-');
ylabel('Mean response time');
xlabel('#');
figure(3)
x=1:8;
p=polyfit(x,Behaviorperformance',3);
f=polyval(p,x);
plot(Behaviorperformance','*','MarkerSize',10);
hold on;
plot(x,f,'-');
xlabel('#');
ylabel('Behavior performance degree');

% figure(1)
% plot(Accuracy')
% figure(2)
% plot(Meanresponsetime')
% figure(3)
% plot(Behaviorperformance')
% save('Accuracyjlaa.txt', 'Accuracy', '-ASCII');
% save('Meanresponsetimejlaa.txt', 'Meanresponsetime', '-ASCII');
% save('Behaviorperformancejlaa.txt', 'Behaviorperformance', '-ASCII');



