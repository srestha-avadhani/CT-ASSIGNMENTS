N=4;
fs = 240;
t = 0:1/fs:5;
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
Up = Uc.*c' - Us.*d';
plot(t,Up,'r');
xlabel('symbols');
ylabel('Up');
xlim([1,5]);


