N=4;
fs = 80;
t = 0:1/fs:5;
s =length(t);
Us = ones(s,1);
for ii = 1:N
    bs(ii) = sign(-.5 + rand());
end
for jj = 1:N
for ii = jj*fs:(jj+1)*fs
    Us(ii) = bs(jj);
end
end
d = sin(40*pi*t);
Up2 = Us .* d';
plot(t,Up2,'r');
xlabel('symbols');
ylabel('Up2');
xlim([1,5]);


