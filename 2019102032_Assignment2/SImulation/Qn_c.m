fm = 2000;
fc = 100000;
fs = 1001;
t = -1:1/fs:1;
t1 = -1:1/(2*fs):1;
A1 = 1;
A2 = 2;
m = A1*cos(2*pi*fm*t);
c = A2*cos(2*pi*fc*t);
Udsb = m.*c;
DUdsb = Udsb .* c;
[a,b] = butter(1,(pi/fc));
Out = filter(a,b,DUdsb);
plot(t,Out);
xlabel('time');
ylabel('demodulated singal');
hold on;
plot(t,m);
hold off;






