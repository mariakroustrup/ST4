%% Nirusha Baseline
% Baseline m�ling 1
Nirusha = load('Baseline1');
Ndata = Nirusha.data;

figure
subplot(2,3,1)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(1,:))
plot(Ndata(2,:))
plot(Ndata(3,:))
title('Baseline m�ling 1, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'])


subplot(2,3,4)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(4,:))
plot(Ndata(5,:))
plot(Ndata(6,:))
title('Baseline m�ling 1, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southeast')


%Baseline m�ling 2
Nirusha = load('Baseline2');
Ndata = Nirusha.data;
subplot(2,3,2)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(1,:))
plot(Ndata(2,:))
plot(Ndata(3,:))
title('Baseline m�ling 2, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'])


subplot(2,3,5)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(4,:))
plot(Ndata(5,:))
plot(Ndata(6,:))
title('Baseline m�ling 2, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southeast')

% Baseline m�line 3
Nirusha = load('Baseline3');
Ndata = Nirusha.data;
subplot(2,3,3)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(1,:))
plot(Ndata(2,:))
plot(Ndata(3,:))
title('Baseline m�ling 3, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'])


subplot(2,3,6)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(4,:))
plot(Ndata(5,:))
plot(Ndata(6,:))
legend(['x-akse';'y-akse';'z-akse'],'Location','Southeast')
title('Baseline m�ling 3, accelerometer 2')

%% Nirusha 1. m�ling
Nirusha = load('Ned1');
Ndata = Nirusha.data;

figure
subplot(2,3,1)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Ndata(1,:))
plot(Ndata(2,:))
plot(Ndata(3,:))
title('1. m�ling, 1, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,4)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Ndata(4,:))
plot(Ndata(5,:))
plot(Ndata(6,:))
title('1. m�ling, 1, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')


%1. m�ling, 2
Nirusha = load('Ned2');
Ndata = Nirusha.data;
subplot(2,3,2)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Ndata(1,:))
plot(Ndata(2,:))
plot(Ndata(3,:))
title('1. m�ling, 2, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,5)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Ndata(4,:))
plot(Ndata(5,:))
plot(Ndata(6,:))
title('1. m�ling, 2, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')

% 1. m�ling, 3
Nirusha = load('Ned3');
Ndata = Nirusha.data;
subplot(2,3,3)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Ndata(1,:))
plot(Ndata(2,:))
plot(Ndata(3,:))
title('1. m�ling, 3 accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,6)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Ndata(4,:))
plot(Ndata(5,:))
plot(Ndata(6,:))
title('1. m�ling, 3, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')

%% Nirusha 2. m�ling
Nirusha = load('Nedogop1');
Ndata = Nirusha.data;

figure
subplot(2,3,1)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(1,:))
plot(Ndata(2,:))
plot(Ndata(3,:))
title('2. m�ling, 1, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,4)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(4,:))
plot(Ndata(5,:))
plot(Ndata(6,:))
title('2. m�ling, 2, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')


%2. m�ling, 2
Nirusha = load('Nedogop2');
Ndata = Nirusha.data;
subplot(2,3,2)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(1,:))
plot(Ndata(2,:))
plot(Ndata(3,:))
title('2. m�ling, 2, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,5)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(4,:))
plot(Ndata(5,:))
plot(Ndata(6,:))
title('2. m�ling, 2, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')

% 2. m�ling, 3
Nirusha = load('Nedogop3');
Ndata = Nirusha.data;
subplot(2,3,3)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(1,:))
plot(Ndata(2,:))
plot(Ndata(3,:))
title('2. m�ling, 3, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,6)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Ndata(4,:))
plot(Ndata(5,:))
plot(Ndata(6,:))
title('2. m�ling, 3 , accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')


