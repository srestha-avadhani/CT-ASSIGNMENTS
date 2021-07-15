fm = 2000;
fc = 100000;
fs = 1001;
t = -1:1/fs:1;
t1 = -1:1/(2*fs):1;
A1 = 1;
A2 = 2;
m = A1*cos(2*pi*fm*t);
c = A2*cos(2*pi*fc*t);
Udsb1 = m.*cos(2*pi*fc*t);
DUdsb1 = Udsb1 .* c;
Out1 = lowpass(DUdsb1,(pi/fc));

Udsb2 = m.*cos(2*pi*(fc-1)*t);
DUdsb2 = Udsb2 .* c;
Out2 = lowpass(DUdsb2,(pi/fc));

Udsb3 = m.*cos(2*pi*(fc-2)*t);
DUdsb3 = Udsb3 .* c;
Out3 = lowpass(DUdsb3,(pi/fc));

Udsb4 = m.*cos(2*pi*fc*t);
DUdsb4 = Udsb4 .* c;
Out4 = lowpass(DUdsb4,(pi/fc));

Udsb5 = m.*cos(2*pi*(fc)*t + pi/4);
DUdsb5 = Udsb5 .* c;
Out5 = lowpass(DUdsb5,(pi/fc));

Udsb6 = m.*cos(2*pi*(fc)*t + pi/2);
DUdsb6 = Udsb6 .* c;
Out6 = lowpass(DUdsb6,(pi/fc));
figure;
subplot(3,2,1);
plot(t,Out1);
xlabel('time');
ylabel('Demodulated');
title('delta f = 0');
subplot(3,2,3);
plot(t,Out2);
xlabel('time');
ylabel('Demodulated');
title('delta f = 1');
subplot(3,2,5);
plot(t,Out3);
xlabel('time');
ylabel('Demodulated');
title('delta f = 2');
subplot(3,2,2);
plot(t,Out4);
xlabel('time');
ylabel('Demodulated');
title('delta phi = 0');
subplot(3,2,4);
plot(t,Out5);
xlabel('time');
ylabel('Demodulated');
title('delta phi = pi/4');
subplot(3,2,6);
plot(t,Out6);
xlabel('time');
ylabel('Demodulated');
title('delta phi = pi/2');






