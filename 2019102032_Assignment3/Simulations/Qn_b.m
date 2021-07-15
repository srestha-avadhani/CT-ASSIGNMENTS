fm = 1000;
fc = 10000;
fs = 1001;
t = -1:1/fs:1;
t1 = -1:1/fs:1-1/fs;
Am = 1;
Ac = 10;
kf = 50;
m = Am*cos(2*pi*fm*t);
c = Ac*cos(2*pi*fc*t);
phi = (kf/fm)*cumsum(m);
U = Ac*cos(2*pi*fc*t + phi);
Y1 = diff(U);
[yupper,ylower] = envelope(Y1);
dc = mean(yupper);
mu = 2*(dc - yupper);
figure;
subplot(2,1,1);
plot(t1,yupper,'g');grid on;
title('Rectified signal');
subplot(2,1,2);
plot(t1,mu,'g');grid on;
title('Recovered signal');