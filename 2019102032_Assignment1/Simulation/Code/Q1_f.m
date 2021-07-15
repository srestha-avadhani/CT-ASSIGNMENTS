N=10;
fs = 240;
t = 0:1/fs:11;
t1 = 0:1/(2*fs):11;
s =length(t);
Uc = ones(s,1);
Us = ones(s,1);
for ii = 1:N
    bc(ii) = sign(-.5 + rand());
    bs(ii) = sign(-.5 + rand());
end
for jj = 1:N
for ii = jj*fs:(jj+1)*fs
    Uc(ii) = bc(jj);
    Us(ii) = bs(jj);
end
end
c = cos(40*pi*t);
d = sin(40*pi*t);
c1 = cos(40*pi*t+pi/4);
d1 = sin(40*pi*t+pi/4);
Up = Uc.*c' - Us.*d';
h = rectangularPulse(0,0.25,t);
v1 = 2*Up .* c1';
v2 = 2*Up .* (-d1');
vc = conv(v1,h);
vs = conv(v2,h);
figure;
subplot(2,1,1);
plot(2*t1,vc);
xlabel('symbols');
ylabel('vc');
xlim([1,11]);
subplot(2,1,2);
plot(2*t1,vs);
xlabel('symbols');
ylabel('vs');
xlim([1,11]);



