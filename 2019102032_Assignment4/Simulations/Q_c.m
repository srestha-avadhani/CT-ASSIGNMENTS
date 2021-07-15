fm = 100;
fc = 1000;
fs = 100000;
t = 0:1/fs:4999/fs;
Am = 1;
Ac = 1;
kf = 0.06;
m = Am*cos(2*pi*fm*t);
c = Ac*cos(2*pi*fc*t);
phi = 2*pi*kf*cumsum(m);
U = Ac*cos(2*pi*fc*t + phi);
U_hat = Ac*(cos(2*pi*fc*t + phi) + 1j*sin(2*pi*fc*t + phi));

phi_hat(1)=30; 
e(1)=0; 
phd(1)=0; 
vco(1)=0;

kp=0.15;
ki=0.1;

for ii = 2:length(U_hat)
vco(ii) = cos(2*pi*ii*fc/fs + phi_hat(ii-1)) -1j*sin(2*pi*ii*fc/fs + phi_hat(ii-1));
phd(ii) = imag(U_hat(ii)*vco(ii));
e(ii) = e(ii-1)+(kp+ki)*phd(ii)-ki*phd(ii-1);
phi_hat(ii) = e(ii) + phi_hat(ii-1);
end

plot(t(1:1000),m(1:1000),'g');grid on;
hold on;
plot(t(1:1000),e(1:1000),'r');grid on;
xlabel('Time (seconds)');
ylabel('Amplitude');
hold off;