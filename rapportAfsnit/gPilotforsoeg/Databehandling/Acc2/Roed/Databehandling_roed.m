%% Behandling for roed elektrode
%% Konstanter
frekvens     = 100;
samplelength = 10;
tid  = [0 : +1/frekvens : samplelength-1/frekvens];
grader = [0 20 40 60 80 90 100 120 140 160 180];

%% Data for 'z' i z-akse målinger
dataR0 = load('z_0_grader');
roedZ0 = dataR0.data(3,:);
roedZ0 = mean(roedZ0(1:length(tid))); 

dataR20 = load('z_20_grader');
roedZ20 = dataR20.data(3,:);
roedZ20 = mean(roedZ20(1:length(tid)));

dataR40 = load('z_40_grader');
roedZ40 = dataR40.data(3,:);
roedZ40 = mean(roedZ40(1:length(tid)));

dataR60 = load('z_60_grader');
roedZ60 = dataR60.data(3,:);
roedZ60 = mean(roedZ60(1:length(tid)));

dataR80 = load('z_80_grader');
roedZ80 = dataR80.data(3,:);
roedZ80 = mean(roedZ80(1:length(tid)));

dataR90 = load('z_90_grader');
roedZ90 = dataR90.data(3,:);
roedZ90 = mean(roedZ90(1:length(tid)));

dataR100 = load('z_100_grader');
roedZ100 = dataR100.data(3,:);
roedZ100 = mean(roedZ100(1:length(tid)));

dataR120 = load('z_120_grader');
roedZ120 = dataR120.data(3,:);
roedZ120 = mean(roedZ120(1:length(tid)));

dataR140 = load('z_140_grader');
roedZ140 = dataR140.data(3,:);
roedZ140 = mean(roedZ140(1:length(tid)));

dataR160 = load('z_160_grader');
roedZ160 = dataR160.data(3,:);
roedZ160 = mean(roedZ160(1:length(tid)));

dataR180 = load('z_180_grader');
roedZ180 = dataR180.data(3,:);
roedZ180 = mean(roedZ180(1:length(tid)));

roedZ=[roedZ0 roedZ20 roedZ40 roedZ60 roedZ80 roedZ90 roedZ100 roedZ120 roedZ140 roedZ160 roedZ180]
    
%% Data for 'y' i y-akse målinger
dataR0 = load('y_0_grader');
roedY0 = dataR0.data(2,:);
roedY0 = mean(roedY0(1:length(tid))); 

dataR20 = load('y_20_grader');
roedY20 = dataR20.data(2,:);
roedY20 = mean(roedY20(1:length(tid)));

dataR40 = load('y_40_grader');
roedY40 = dataR40.data(2,:);
roedY40 = mean(roedY40(1:length(tid)));

dataR60 = load('y_60_grader');
roedY60 = dataR60.data(2,:);
roedY60 = mean(roedY60(1:length(tid)));

dataR80 = load('y_80_grader');
roedY80 = dataR80.data(2,:);
roedY80 = mean(roedY80(1:length(tid)));

dataR90 = load('y_90_grader');
roedY90 = dataR90.data(2,:);
roedY90 = mean(roedY90(1:length(tid)));

dataR100 = load('y_100_grader');
roedY100 = dataR100.data(2,:);
roedY100 = mean(roedY100(1:length(tid)));

dataR120 = load('y_120_grader');
roedY120 = dataR120.data(2,:);
roedY120 = mean(roedY120(1:length(tid)));

dataR140 = load('y_140_grader');
roedY140 = dataR140.data(2,:);
roedY140 = mean(roedY140(1:length(tid)));

dataR160 = load('y_160_grader');
roedY160 = dataR160.data(2,:);
roedY160 = mean(roedY160(1:length(tid)));

dataR180 = load('y_180_grader');
roedY180 = dataR180.data(2,:);
roedY180 = mean(roedY180(1:length(tid)));

roedY=[roedY0 roedY20 roedY40 roedY60 roedY80 roedY90 roedY100 roedY120 roedY140 roedY160 roedY180]

%% Data for 'x' i x-akse målinger
dataR0 = load('x_0_grader');
roedX0 = dataR0.data(1,:);
roedX0 = mean(roedX0(1:length(tid))); 

dataR20 = load('x_20_grader');
roedX20 = dataR20.data(1,:);
roedX20 = mean(roedX20(1:length(tid)));

dataR40 = load('x_40_grader');
roedX40 = dataR40.data(1,:);
roedX40 = mean(roedX40(1:length(tid)));

dataR60 = load('x_60_grader');
roedX60 = dataR60.data(1,:);
roedX60 = mean(roedX60(1:length(tid)));

dataR80 = load('x_80_grader');
roedX80 = dataR80.data(1,:);
roedX80 = mean(roedX80(1:length(tid)));

dataR90 = load('x_90_grader');
roedX90 = dataR90.data(1,:);
roedX90 = mean(roedX90(1:length(tid)));

dataR100 = load('x_100_grader');
roedX100 = dataR100.data(1,:);
roedX100 = mean(roedX100(1:length(tid)));

dataR120 = load('x_120_grader');
roedX120 = dataR120.data(1,:);
roedX120 = mean(roedX120(1:length(tid)));

dataR140 = load('x_140_grader');
roedX140 = dataR140.data(1,:);
roedX140 = mean(roedX140(1:length(tid)));

dataR160 = load('x_160_grader');
roedX160 = dataR160.data(1,:);
roedX160 = mean(roedX160(1:length(tid)));

dataR180 = load('x_180_grader');
roedX180 = dataR180.data(1,:);
roedX180 = mean(roedX180(1:length(tid)));

roedX=[roedX0 roedX20 roedX40 roedX60 roedX80 roedX90 roedX100 roedX120 roedX140 roedX160 roedX180]


