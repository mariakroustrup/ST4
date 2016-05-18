load('lavpass_data.mat');
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
ylim([-0.05 0.8]) 
ylabel('EMG [V]')
legend('Input', 'Output')
set(gca,'fontsize',20);