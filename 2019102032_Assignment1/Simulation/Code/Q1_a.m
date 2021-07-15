N=10;
fs = 80;
t = 0:1/fs:11;
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
figure;
subplot(2,1,1);
plot(t,Uc);
xlabel('symbols');
ylabel('Uc');
xlim([1,11]);
subplot(2,1,2);
plot(t,Us);
xlabel('symbols');
ylabel('Us');
xlim([1,11]);

