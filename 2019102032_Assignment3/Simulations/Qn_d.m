fc = 10000;
fs = 100000;
t = -0.04:1/fs:0.04;
t1 = -0.04:1/fs:0.04-1/fs;
Ac = 10;
kf = 1;
m = zeros(1,length(t));
for ii = 1:length(t)
    if t(ii)>=-0.02 && t(ii)<=-0.01
        m(ii) = 100*t(ii) +2;
    end
    if t(ii)>=-0.01 && t(ii)<=0.01
        m(ii) = -100*t(ii);
    end
    if t(ii)>=0.01 && t(ii)<=0.02
        m(ii) = 100*t(ii) -2;
    end
end
c = Ac*cos(2*pi*fc*t);
phi = 2*pi*cumsum(m)/fm;
U = Ac*cos(2*pi*fc*t + phi);
Y1 = diff(U)/fs;
[yupper,ylower] = envelope(Y1);
dc = mean(yupper);
mu = fc*(-dc + yupper)/2*pi;
Z1 = fft(m);
Z2 = fft(U);
Z3 = fft(Y1);
Z4 = fft(mu);
figure;
subplot(3,1,1);
plot(t,m,'g');grid on;
title('Message Signal');
subplot(3,1,2);
plot(t,c,'g');grid on;
title('Carrier Signal');
subplot(3,1,3);
plot(t,U,'g');grid on;
title('Modulated Signal');
figure;
subplot(2,1,1);
plot(t1,Y1,'g');grid on;
title('Rectified Signal');
subplot(2,1,2);
plot(t1,mu,'g');grid on;
title('Recovered Signal');
figure;
subplot(2,2,1);
plot(t,real(fftshift(Z1)),'g');grid on;
title('Spectrum of Message');
subplot(2,2,2);
plot(t,real(fftshift(Z2)),'g');grid on;
title('Spectrum of Modulated FM');
subplot(2,2,3);
plot(t1,real(fftshift(Z3)),'g');grid on;
title('Spectrum of Rectified ');
subplot(2,2,4);
plot(t1,real(fftshift(Z4)),'g');grid on;
title('Spectrum of Recovered');