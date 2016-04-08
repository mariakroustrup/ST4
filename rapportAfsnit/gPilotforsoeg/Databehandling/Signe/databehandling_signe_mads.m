%% Signe Baseline
% Baseline m�ling 1
Signe = load('Baseline1');
Sdata = Signe.data;

figure
subplot(2,3,1)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(1,:))
plot(Sdata(2,:))
plot(Sdata(3,:))
title('Baseline m�ling 1, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'])


subplot(2,3,4)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(4,:))
plot(Sdata(5,:))
plot(Sdata(6,:))
title('Baseline m�ling 1, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southeast')


%Baseline m�ling 2
Signe = load('Baseline2');
Sdata = Signe.data;
subplot(2,3,2)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(1,:))
plot(Sdata(2,:))
plot(Sdata(3,:))
title('Baseline m�ling 2, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'])


subplot(2,3,5)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(4,:))
plot(Sdata(5,:))
plot(Sdata(6,:))
title('Baseline m�ling 2, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southeast')

% Baseline m�line 3
Signe = load('Baseline3');
Sdata = Signe.data;
subplot(2,3,3)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(1,:))
plot(Sdata(2,:))
plot(Sdata(3,:))
title('Baseline m�ling 3, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'])


subplot(2,3,6)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(4,:))
plot(Sdata(5,:))
plot(Sdata(6,:))
legend(['x-akse';'y-akse';'z-akse'],'Location','Southeast')
title('Baseline m�ling 3, accelerometer 2')

%% Signe 1. m�ling
Signe = load('Ned1');
Sdata = Signe.data;

figure
subplot(2,3,1)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Sdata(1,:))
plot(Sdata(2,:))
plot(Sdata(3,:))
title('1. m�ling, 1, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,4)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Sdata(4,:))
plot(Sdata(5,:))
plot(Sdata(6,:))
title('1. m�ling, 1, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')


%1. m�ling, 2
Signe = load('Ned2');
Sdata = Signe.data;
subplot(2,3,2)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Sdata(1,:))
plot(Sdata(2,:))
plot(Sdata(3,:))
title('1. m�ling, 2, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,5)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Sdata(4,:))
plot(Sdata(5,:))
plot(Sdata(6,:))
title('1. m�ling, 2, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')

% 1, m�ling, 3
Signe = load('Ned3');
Sdata = Signe.data;
subplot(2,3,3)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Sdata(1,:))
plot(Sdata(2,:))
plot(Sdata(3,:))
title('1. m�ling, 3 accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,6)
xlim([0 600])
ylim([1.3 2])
hold on
plot(Sdata(4,:))
plot(Sdata(5,:))
plot(Sdata(6,:))
title('1. m�ling, 3, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')

%% Signe 2. m�ling
Signe = load('Nedogop1');
Sdata = Signe.data;

figure
subplot(2,3,1)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(1,:))
plot(Sdata(2,:))
plot(Sdata(3,:))
title('2. m�ling, 1, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,4)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(4,:))
plot(Sdata(5,:))
plot(Sdata(6,:))
title('2. m�ling, 2, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')


%2. m�ling, 2
Signe = load('Nedogop2');
Sdata = Signe.data;
subplot(2,3,2)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(1,:))
plot(Sdata(2,:))
plot(Sdata(3,:))
title('2. m�ling, 2, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,5)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(4,:))
plot(Sdata(5,:))
plot(Sdata(6,:))
title('2. m�ling, 2, accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')

% 2. m�ling, 2
Signe = load('Nedogop3');
Sdata = Signe.data;
subplot(2,3,3)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(1,:))
plot(Sdata(2,:))
plot(Sdata(3,:))
title('2. m�ling, 3, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


subplot(2,3,6)
xlim([0 1000])
ylim([1.3 2])
hold on
plot(Sdata(4,:))
plot(Sdata(5,:))
plot(Sdata(6,:))
title('2. m�ling, 3 , accelerometer 2')
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')



m1Y  = fft();
m1P2 = abs(m1Y/L);
m1P1 = m1P2(1:L/2+1);
m1P1(2:end-1) = 2*m1P1(2:end-1);


figure

hold on
plot(fft(Sdata(1,:)))
plot(fft(Sdata(2,:)))
plot(fft(Sdata(3,:)))
title('2. m�ling, 1, accelerometer 1')
legend(['x-akse';'y-akse';'z-akse'], 'Location', 'Northwest')


