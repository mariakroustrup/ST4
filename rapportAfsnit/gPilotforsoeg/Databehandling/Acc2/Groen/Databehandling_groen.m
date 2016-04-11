%% Behandling for grøn elektrode
%% Konstanter
frekvens     = 100;
samplelength = 10;
tid  = [0 : +1/frekvens : samplelength-1/frekvens];
grader = [0 20 40 60 80 90 100 120 140 160 180];

%% Data for 'z' i z-akse målinger

dataG0 = load('z_0_grader.mat');
groenZ0 = dataG0.data(3,:);
groenZ0 = groenZ0(1:length(tid));
groenZ0 = mean(groenZ0);

dataG20 = load('z_20_grader.mat');
groenZ20 = dataG20.data(3,:);
groenZ20 = groenZ20(1:length(tid));
groenZ20 = mean(groenZ20);

dataG40 = load('z_40_grader.mat');
groenZ40 = dataG40.data(3,:);
groenZ40 = groenZ40(1:length(tid));
groenZ40 = mean(groenZ40);

dataG60 = load('z_60_grader.mat');
groenZ60 = dataG60.data(3,:);
groenZ60 = groenZ60(1:length(tid));
groenZ60 = mean(groenZ60);

dataG80 = load('z_80_grader');
groenZ80 = dataG80.data(3,:);
groenZ80 = groenZ80(1:length(tid));
groenZ80 = mean(groenZ80);

dataG90 = load('z_90_grader');
groenZ90 = dataG90.data(3,:);
groenZ90 = groenZ90(1:length(tid));
groenZ90 = mean(groenZ90);

dataG100 = load('z_100_grader');
groenZ100 = dataG100.data(3,:);
groenZ100 = groenZ100(1:length(tid));
groenZ100 = mean(groenZ100);

dataG120 = load('z_120_grader');
groenZ120 = dataG120.data(3,:);
groenZ120 = groenZ120(1:length(tid));
groenZ120 = mean(groenZ120);

dataG140 = load('z_140_grader');
groenZ140 = dataG140.data(3,:);
groenZ140 = groenZ140(1:length(tid));
groenZ140 = mean(groenZ140);

dataG160 = load('z_160_grader');
groenZ160 = dataG160.data(3,:);
groenZ160 = groenZ160(1:length(tid));
groenZ160 = mean(groenZ160);

dataG180 = load('z_180_grader');
groenZ180 = dataG180.data(3,:);
groenZ180 = groenZ180(1:length(tid));
groenZ180 = mean(groenZ180);

groenZ = [groenZ0 groenZ20 groenZ40 groenZ60 groenZ80 groenZ90 groenZ100 groenZ120 groenZ140 groenZ160 groenZ180];
%% Data for 'y' i y-akse målinger
dataG0 = load('y_0_grader');
groenY0 = dataG0.data(2,:);
groenY0 = groenY0(1:length(tid)); 
groenY0 = mean(groenY0);

dataG20 = load('y_20_grader');
groenY20 = dataG20.data(2,:);
groenY20 = groenY20(1:length(tid));
groenY20 = mean(groenY20);

dataG40 = load('y_40_grader');
groenY40 = dataG40.data(2,:);
groenY40 = groenY40(1:length(tid));
groenY40 = mean(groenY40);

dataG60 = load('y_60_grader');
groenY60 = dataG60.data(2,:);
groenY60 = groenY60(1:length(tid));
groenY60 = mean(groenY60);

dataG80 = load('y_80_grader');
groenY80 = dataG80.data(2,:);
groenY80 = groenY80(1:length(tid));
groenY80 = mean(groenY80);

dataG90 = load('y_90_grader');
groenY90 = dataG90.data(2,:);
groenY90 = groenY90(1:length(tid));
groenY90 = mean(groenY90);

dataG100 = load('y_100_grader');
groenY100 = dataG100.data(2,:);
groenY100 = groenY100(1:length(tid));
groenY100 = mean(groenY100);

dataG120 = load('y_120_grader');
groenY120 = dataG120.data(2,:);
groenY120 = groenY120(1:length(tid));
groenY120 = mean(groenY120);

dataG140 = load('y_140_grader');
groenY140 = dataG140.data(2,:);
groenY140 = groenY140(1:length(tid));
groenY140 = mean(groenY140);

dataG160 = load('y_160_grader');
groenY160 = dataG160.data(2,:);
groenY160 = groenY160(1:length(tid));
groenY160 = mean(groenY160);

dataG180 = load('y_180_grader');
groenY180 = dataG180.data(2,:);
groenY180 = groenY180(1:length(tid));
groenY180 = mean(groenY180);

groenY = [groenY0 groenY20 groenY40 groenY60 groenY80 groenY90 groenY100 groenY120 groenY140 groenY160 groenY180];
%% Data for 'x' i x-akse målinger
dataG0 = load('x_0_grader');
groenX0 = dataG0.data(1,:);
groenX0 = groenX0(1:length(tid)); 
groenX0 = mean(groenX0);

dataG20 = load('x_20_grader');
groenX20 = dataG20.data(1,:);
groenX20 = groenX20(1:length(tid));
groenX20 = mean(groenX20);

dataG40 = load('x_40_grader');
groenX40 = dataG40.data(1,:);
groenX40 = groenX40(1:length(tid));
groenX40 = mean(groenX40);

dataG60 = load('x_60_grader');
groenX60 = dataG60.data(1,:);
groenX60 = groenX60(1:length(tid));
groenX60 = mean(groenX60);

dataG80 = load('x_80_grader');
groenX80 = dataG80.data(1,:);
groenX80 = groenX80(1:length(tid));
groenX80 = mean(groenX80);

dataG90 = load('x_90_grader');
groenX90 = dataG90.data(1,:);
groenX90 = groenX90(1:length(tid));
groenX90 = mean(groenX90);

dataG100 = load('x_100_grader');
groenX100 = dataG100.data(1,:);
groenX100 = groenX100(1:length(tid));
groenX100 = mean(groenX100);

dataG120 = load('x_120_grader');
groenX120 = dataG120.data(1,:);
groenX120 = groenX120(1:length(tid));
groenX120 = mean(groenX120);

dataG140 = load('x_140_grader');
groenX140 = dataG140.data(1,:);
groenX140 = groenX140(1:length(tid));
groenX140 = mean(groenX140);

dataG160 = load('x_160_grader');
groenX160 = dataG160.data(1,:);
groenX160 = groenX160(1:length(tid));
groenX160 = mean(groenX160);

dataG180 = load('x_180_grader');
groenX180 = dataG180.data(1,:);
groenX180 = groenX180(1:length(tid));
groenX180 = mean(groenX180);

groenX = [groenX0 groenX20 groenX40 groenX60 groenX80 groenX90 groenX100 groenX120 groenX140 groenX160 groenX180];

%% Grafer og linear reggresion! 
figure('units','normalized','outerposition',[0 0 1 1])
hold on 
xlabel('Grader');
ylabel('Spænding (v)')

% Vender x-akse data 
% Start 
    groenX = flip(groenX)
% Slut 

%scatter(grader,groenX)
scatter(grader,groenX,'MarkerEdgeColor','b')
scatter(grader,groenY,'MarkerEdgeColor','r')
scatter(grader,groenZ,'MarkerEdgeColor','y')
title({'Accelerometer måling:' ; 'ved forskellige grader'})
legend(['x-akse';'y-akse';'z-akse'],'Location','west')
set(gca,'fontsize',20)



