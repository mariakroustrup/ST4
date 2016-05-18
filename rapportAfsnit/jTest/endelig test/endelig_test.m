load('matlab.mat')
tempsinus=data(800:1800,1);
sinus=tempsinus*(3.3/2^11);
templowpass=data(800:1800,2);
lowpass=templowpass*(3.3/2^11);
diff=data(800:1800,3);
grader=data(800:1800,4);


