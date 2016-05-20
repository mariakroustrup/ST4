load('MAVG_DATA.mat');
t = linspace(0,10,1000);

input = data(1:1000)/1000;
output = return_data(1:1000)/1000;

figure
hold on
plot(t(1:1000),input)
hold on
plot(t(1:1000),output)
xlim([0 10])
xlabel('Tid [s]')
ylim([-0.04 0.14]) 
set(gca,'YTick',[-0.04:0.02:0.14])
ylabel('Accelerometer [V]')
legend('Input', 'Output')
set(gca,'fontsize',20);

%% Finder X værdier ud fra kendt Y-værdi
% xo1 = find(output == 0.02)
% xo11 = t(xo1)
% 
% xi1 = find(input == 0.02)
% xi11 = t(xi1)

x = [input ;output];

y=input-output;
y1=mean(y)


