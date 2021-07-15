fm = 2000;
fc = 100000;
fs = 1001;
t = -1:1/fs:1;
A1 = 1;
A2 = 2;
m = A1*cos(2*pi*fm*t);
c = A2*cos(2*pi*fc*t);
figure;
subplot(2,1,1);
plot(t,m);
xlabel('time');
ylabel('message signal');
subplot(2,1,2)
plot(t,c);
xlabel('time');
ylabel('carrier signal');
