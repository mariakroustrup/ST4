%% Behandling for grøn elektrode Z-akse
%% Konstanter
frekvens     = 100;
samplelength = 10;
tid  = [0 : +1/frekvens : samplelength-1/frekvens];

%% Data
dataG0 = load('0 grader');
groenZ0 = dataG0.data(3,:);
groenZ0 = groenZ0(1:length(tid)); 
dataG20 = load('20 grader');
groenZ20 = dataG20.data(3,:);
groenZ20 = groenZ20(1:length(tid));
dataG40 = load('40 grader');
groenZ40 = dataG40.data(3,:);
groenZ40 = groenZ40(1:length(tid));
dataG60 = load('60 grader');
groenZ60 = dataG60.data(3,:);
groenZ60 = groenZ60(1:length(tid));
dataG80 = load('80 grader');
groenZ80 = dataG80.data(3,:);
groenZ80 = groenZ80(1:length(tid));
dataG90 = load('90 grader');
groenZ90 = dataG90.data(3,:);
groenZ90 = groenZ90(1:length(tid));
dataG100 = load('100 grader');
groenZ100 = dataG100.data(3,:);
groenZ100 = groenZ100(1:length(tid));
dataG120 = load('120 grader');
groenZ120 = dataG120.data(3,:);
groenZ120 = groenZ120(1:length(tid));
dataG140 = load('140 grader');
groenZ140 = dataG140.data(3,:);
groenZ140 = groenZ140(1:length(tid));
dataG160 = load('160 grader');
groenZ160 = dataG160.data(3,:);
groenZ160 = groenZ160(1:length(tid));
dataG180 = load('180 grader');
groenZ180 = dataG180.data(3,:);
groenZ180 = groenZ180(1:length(tid));