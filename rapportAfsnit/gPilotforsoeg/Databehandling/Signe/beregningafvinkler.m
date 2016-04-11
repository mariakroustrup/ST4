clear all

Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L; 

%% loader data
Nedogop = load('Nedogop1');

%% For beregning af offsetværdien:

% Accelerometer 1:
Nedogop1 = (Nedogop.data (1,:));
Nedogop2 = (Nedogop.data (2,:));
Nedogop3 = (Nedogop.data (3,:));
NedogopD1 = ((Nedogop1(1:L) + Nedogop2(1:L) + Nedogop3(1:L))/3);

Nedogopmean1 = mean(Nedogop1)
Nedogopmean2 = mean(Nedogop2)
Nedogopmean3 = mean(Nedogop3)

Nedogop1afv = ((Nedogopmean1-1.7)/1.7)
Nedogop2afv = ((Nedogopmean2-1.7)/1.7)
Nedogop3afv = ((Nedogopmean3-1.7)/1.7)

Offset1 = Nedogopmean1-Nedogop1afv
Offset2 = Nedogopmean2-Nedogop2afv
Offset3 = Nedogopmean3-Nedogop3afv

% beregner gemmemsnit af offset - Da den skiller sig mest ud i 2, er dette
% sensitiviteten
offsetg1 = ((Offset1 + Offset3)/2)

% Accelerometer 2:
Nedogop4 = (Nedogop.data (4,:));
Nedogop5 = (Nedogop.data (5,:));
Nedogop6 = (Nedogop.data (6,:));
NedogopD2 = ((Nedogop4(1:L) + Nedogop5(1:L) + Nedogop6(1:L))/3);

Nedogopmean4 = mean(Nedogop4)
Nedogopmean5 = mean(Nedogop5)
Nedogopmean6 = mean(Nedogop6)

Nedogop4afv = ((Nedogopmean4-3.4/2))/(3.4/2)
Nedogop5afv = ((Nedogopmean5-3.4/2))/(3.4/2)
Nedogop6afv = ((Nedogopmean6-3.4/2)/(3.4/2))

Offset4 = Nedogopmean4-Nedogop4afv
Offset5 = Nedogopmean5-Nedogop5afv
Offset6 = Nedogopmean6-Nedogop6afv
% beregner gemmemsnit af offset - Da den skiller sig mest ud i 5, er dette
% sensitiviteten
offsetg2 = ((Offset4 + Offset6)/2)

%% For beregning af sensitiviteten

% Accelerometer 1:
paavirkning1 = Nedogopmean2-Nedogop2afv %Påvirkning i 1g 

sensitivitet1 = paavirkning1-offsetg1

%Accelerometer 2:
paavirkning2 = Nedogopmean5-Nedogop5afv %Påvirkning i 1g

sensitivitet2 = paavirkning2-offsetg2

%% Beregning af grader  - OBS  DETTE KAN DER MÅSKE FINDES EN SMARTERE MÅDE AT GØRE DET PÅ!!!!
% Accelerometer 1:  

acc1=zeros([1 90]);
for ii =1:90
    acc1(ii)=offsetg1+(sensitivitet1*(1*ii))
end

acc2=zeros([1 90]);
for ii =1:90
    acc2(ii)=offsetg2+(sensitivitet2*(1*ii))
end

acc = offsetg2+(sensitivitet2*90) 
figure
subplot(2,1,1);
plot(acc1);
title('Accelerometer 1')
xlabel('Grader [\circ]')
ylabel('Spænding [V]')

subplot(2,1,2);
plot(acc2);
title('Accelerometer 2')
xlabel('Grader [\circ]')
ylabel('Spænding [V]')
% grad1_1 = offsetg1 + (sensitivitet1 * 1)
% grad1_2 = offsetg1 + (sensitivitet1 * 2)
% 
% % Accelerometer 2:
% grad2_1 = offsetg2 + (sensitivitet2 * 1)
% grad2_2 = offsetg2 + (sensitivitet2 * 2)