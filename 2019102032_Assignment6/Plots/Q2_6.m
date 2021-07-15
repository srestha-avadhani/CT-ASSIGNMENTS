ak = 2.7;
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

scatter(real(rx(1:n)),imag(rx(1:n)),'g');
title('Real v/s imaginary axis');
xlabel('Real axis after output of reciever filter');
ylabel('Imaginary axis for the same');


