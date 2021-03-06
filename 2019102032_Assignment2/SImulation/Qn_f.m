fs= 100;
t = -1:1/fs:1;
fc = 100000;
Am =1;
Ac =2;
m = sawtooth(1000*t);
c = cos(2*pi*fc*t);
UDsbfc = (Ac + Am*m).*c;
plot(t,UDsbfc);
ylabel('UDSB-fc waveform');
xlabel('time');