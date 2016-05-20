load('matlab1.mat')
load('matlabreturn.mat')

t = linspace(0,10,1000);

figure
hold on
plot(t(1:500),data(1:500))
plot(t(1:500),return_data(1:500));
xlabel('Tid [s]')
ylabel('Størrelse')
legend('Input','Output')
set(gca, 'fontsize', 20)
box off

ny=data(1:100);
nyreturn=return_data(1:100);

x1=find(ny==1000);
x2=t(x1);

y1=find(nyreturn==1000);
y2=t(y1);

a1=x1(1:41)-y1;
forsink=a1*100;
