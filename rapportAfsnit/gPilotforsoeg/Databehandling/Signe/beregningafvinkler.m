clear all

Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L; 

%% loader data
Nedogop = load('Nedogop1');

%% For beregning af offsetv�rdien:

% Accelerometer 1:
Nedogop1 = (Nedogop.data (1,:));
Nedogop2 = (Nedogop.data (2,:));
Nedogop3 = (Nedogop.data (3,:));

% % Beregner afvigelse
% Nedogop1_afv=zeros([1 1170]);
% for ii =1:1170
%     Nedogop1_afv(ii)=(Nedogop1(ii)-1.7)/1.7;
% end
% 
% Nedogop2_afv=zeros([1 1170]);
% for ii =1:1170
%     Nedogop2_afv(ii)=(Nedogop2(ii)-1.7)/1.7;
% end
% 
% Nedogop3_afv=zeros([1 1170]);
% for ii =1:1170
%     Nedogop3_afv(ii)=(Nedogop3(ii)-1.7)/1.7;
% end

% Beregner mean
Nedogopmean1 = mean(Nedogop1)
Nedogopmean2 = mean(Nedogop2)
Nedogopmean3 = mean(Nedogop3)

Nedogop1afv = ((Nedogopmean1-1.7)/1.7)
Nedogop2afv = ((Nedogopmean2-1.7)/1.7)
Nedogop3afv = ((Nedogopmean3-1.7)/1.7)

Offset1 = Nedogopmean1-Nedogop1afv
% Offset2 = Nedogopmean2-Nedogop2afv
Offset3 = Nedogopmean3-Nedogop3afv

Offset11= (Offset1+Offset3)/2

% % Beregner offset
% Offset1=zeros([1 1170]);
% for ii =1:1170
%     Offset1(ii)=Nedogop1(ii)-Nedogop1_afv(ii);
% end
% 
% 
% Offset3=zeros([1 1170]);
% for ii =1:1170
%     Offset3(ii)=Nedogop3(ii)-Nedogop3_afv(ii);
% end

% Gennemsnit af offset 
% Offset11=zeros([1 1170]);
% for ii =1:1170
%     Offset11(ii)=(Offset1(ii)+Offset3(ii))/2;
% end


% Beregner p�virkning i 1 g
 
Paavirk1=Nedogopmean2-Nedogop2afv

Sensi1=Paavirk1-Offset11;
% Paavirk1=zeros([1 1170]);
% for ii =1:1170
%     Paavirk1(ii)=Nedogop2(ii)-Nedogop2_afv(ii);
% end 
%  
% 
% % Beregner sensitivitet
% Sensi1=zeros([1 1170]);
% for ii =1:1170
%     Sensi1(ii)=Paavirk1(ii)-Offset11;
% end 

% Beregner graderne
acc1=zeros([1 1170]);
for ii =1:1170
    acc1(ii)=Offset11(ii)+(Sensi1(ii)*(1*ii));
end

grader=zeros([1 90]);
for ii =1:90
    grader(ii)=-(Offset11(ii)-Nedogop2(ii))/Sensi1(ii);
end


%% Accelerometer 2

Nedogop4 = (Nedogop.data (4,:));
Nedogop5 = (Nedogop.data (5,:));
Nedogop6 = (Nedogop.data (6,:));

% Beregner afvigelse
Nedogop4_afv=zeros([1 1170]);
for ii =1:1170
    Nedogop4_afv(ii)=(Nedogop4(ii)-1.7)/1.7;
end

Nedogop5_afv=zeros([1 1170]);
for ii =1:1170
    Nedogop5_afv(ii)=(Nedogop5(ii)-1.7)/1.7;
end

Nedogop6_afv=zeros([1 1170]);
for ii =1:1170
    Nedogop6_afv(ii)=(Nedogop6(ii)-1.7)/1.7;
end

% Beregner offset

Offset4=zeros([1 1170]);
for ii =1:1170
    Offset4(ii)=Nedogop4(ii)-Nedogop4_afv(ii);
end

Offset6=zeros([1 1170]);
for ii =1:1170
    Offset6(ii)=Nedogop6(ii)-Nedogop6_afv(ii);
end

% Gennemsnit af offset 
Offset22=zeros([1 1170]);
for ii =1:1170
    Offset22(ii)=(Offset4(ii)+Offset6(ii))/2;
end


% Beregner p�virkning i 1 g
 
Paavirk2=zeros([1 1170]);
for ii =1:1170
    Paavirk2(ii)=Nedogop5(ii)-Nedogop5_afv(ii);
end 
 

% Beregner sensitivitet
Sensi2=zeros([1 1170]);
for ii =1:1170
    Sensi2(ii)=Paavirk2(ii)-Offset22(ii);
end 

% Beregner graderne
acc2=zeros([1 1170]);
for ii =1:1170
    acc2(ii)=Offset22(ii)+(Sensi2(ii)*(1*ii));
end

% 
for i= 1:1170 
    degree(i) = calc_degree(voltage(i));
end


%% Plots!
figure
subplot(2,1,1);
plot(acc1, Nedogop2);
title('Accelerometer 1')

subplot(2,1,2);
plot(acc2, Nedogop5);
% ylim([1.3 1.5])
xlim([0 150]);
set(gca,'XTick',[0: 10: 150]);
title('Accelerometer 2')


xlabel('Vinkel [\circ]')
ylabel('Sp�nding [V]')


 
% % acc3=zeros([1 575]);
% % for ii =1:575
% %     acc3(ii)=offsetg1+(sensitivitet1*(1*ii));
% % end
% % 
% % acc4=zeros([1 575]);
% % for ii =1:575
% %     acc4(ii)=offsetg1+(sensitivitet1*(1*ii));
% % end
% 
