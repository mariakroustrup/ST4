Signe = load('Daq20160324130256');
Sdata = Signe.data;
figure
xlim([0 600])
ylim([1.3 2])
hold all
plot(Sdata(1,:))
plot(Sdata(2,:))
plot(Sdata(3,:))
legend(['x-akse';'y-akse';'z-akse'],'Location','Northwest')


figure 
xlim([0 600])
ylim([1.3 2])
hold all
plot(Sdata(4,:))
plot(Sdata(5,:))
plot(Sdata(6,:))
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')



Nirusha = load('Daq20160324123600');
Ndata = Nirusha.data;
figure
xlim([0 600])
ylim([1.3 2])
hold all
plot(Ndata(1,:))
plot(Ndata(2,:))
plot(Ndata(3,:))
legend(['x-akse';'y-akse';'z-akse'],'Location','Northwest')

figure 
xlim([0 600])
ylim([1.3 2])
hold all
plot(Ndata(4,:))
plot(Ndata(5,:))
plot(Ndata(6,:))
legend(['x-akse';'y-akse';'z-akse'],'Location','Southwest')