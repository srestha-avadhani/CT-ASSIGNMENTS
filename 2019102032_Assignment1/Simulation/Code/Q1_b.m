N=4;
fs = 80;
t = 0:1/fs:5;
s =length(t);
Uc = ones(s,1);
Us = ones(s,1);
for ii = 1:N
    bc(ii) = sign(-.5 + rand());
end
for jj = 1:N
for ii = jj*fs:(jj+1)*fs
    Uc(ii) = bc(jj);
end
end
c = cos(40*pi*t);
Up1 = Uc .* c';
plot(t,Up1,'r');
xlabel('symbols');
ylabel('Up1');
xlim([1,5]);


