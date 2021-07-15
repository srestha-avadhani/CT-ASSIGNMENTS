ak = 4.17;
variance = 1/(2*ak);
a = 0.5;
n = 12000;
m = 4;

samples = randombits(n);
samplesp = bpsk(samples);

sampled_n = m*(n-1)+1;
arrto_tx = zeros(sampled_n,1);
for ii = 1:m:sampled_n
   arrto_tx(ii) = samplesp(floor((ii-1)/m)+1); 
end

tx = conv(arrto_tx,rcosdesign(a,n,m,'sqrt'));
nos1 = normrnd(0,sqrt(variance),[size(tx)]);
nos2 = normrnd(0,sqrt(variance),[size(tx)]);
tx = tx + nos1 + 1j*nos2;

rx = conv(tx,rcosdesign(a,n,m,'sqrt'));

for ii = 1:n
   rx(ii) = rx(4*ii + sampled_n); 
end

outt = zeros (n,1);
for ii = 1:n
   if real(tx(ii))>=0
       outt(ii) = 1;
   else
       outt(ii) = -1;
   end
end
cnt = 0;
for ii = 1:n
    if outt(ii)== samplesp(ii)
        cnt = cnt + 1;
    end
end
disp(1 - (cnt/n))

outr = zeros (n,1);
for ii = 1:n
   if real(rx(ii))>=0
       outr(ii) = 1;
   else
       outr(ii) = -1;
   end
end
cnt1 = 0;
for ii = 1:n
    if outr(ii) == samplesp(ii)
        cnt1=cnt1+1;
    end
end
disp(1 - (cnt1/n))


