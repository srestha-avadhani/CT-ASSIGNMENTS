fm = 2000;
fc = 100000;
fs = 1001;
t = -1:1/fs:1;
t1 = -1:1/(2*fs):1;
A1 = 1;
A2 = 2;
m = A1*cos(2*pi*fm*t);
c = A2*cos(2*pi*fc*t);
m1 =  A2*m;
m2 = -(A2*m);
Udsb = m.*c;
y = fft(Udsb);
z = fftshift(y);
figure;
subplot(2,1,1);
plot(t,Udsb,'g');
xlabel('time');
ylabel('UDSB-SC waveform');
hold on;
plot(t,m1,'b');
hold on;
plot(t,m2,'r');
hold off;
subplot(2,1,2);
plot(t,real(z),'g');
xlabel('frequency');
ylabel('spectrum of UDSB-SC');




