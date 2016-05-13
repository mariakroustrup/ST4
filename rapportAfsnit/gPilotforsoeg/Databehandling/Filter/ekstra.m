%vælg datarække
q = a;
%Længde pr. vindue i millisekunder
vindue  = 500; %500
%Overlap i millisekunder
overlap = 0.5*vindue;

%%%  ------------------------------------------------  %%%
vindue  = (vindue/1000)*frekvens;
overlap = (overlap/1000)*frekvens;
v = buffer(q,vindue,overlap);
l = length(v(1,:));
for i = 1:l
    temp = max(v(:,i))-min(v(:,i));
    v_rms(i) = temp;
end 
tid2=[1:length(v_rms)];
tid2=(tid2/l)*interfrek+startfrek;
b=[1:length(v_rms)]*0;

%ideel = tid2;
%ideel = 
% plot(tid2,b+2*0.7)0.1*10*log10((1+ 0.9976^(2) * ( ideel*15^-1 ).^(4) ));
subplot(1,2,2)
%semilogx(tid2,v_rms,'Color','r')
plot(tid2,v_rms,'Color','r')
% hold on 
% hold on 
% plot(tid2,b+2)
% hold on 
% plot(tid2,b+2*0.01)
axis([startfrek-0.03*interfrek slutfrek+0.03*interfrek 0 1.1*max(v_rms)])
%axis([startfrek-0.03*interfrek slutfrek+0.03*interfrek min(v_rms)-0.1*(max(v_rms)) max(v_rms)+0.1*(max(v_rms)) ])
ylabel('Amplitude (V)')
xlabel('Frekvens (Hz)')
set(gca,'fontsize',20);
title('b)')
display('Maximums-værdi')
max(v_rms)
display('Minimums-værdi')
min(v_rms)
display('RMS-værdi')
rms(v_rms)
%1/(sqrt(1+(500/400)^(2*2)))
