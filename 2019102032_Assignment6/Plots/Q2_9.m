ak = 6.31; % EbN0 found is 6.31 which in normal scale is this
variance = 5/(4*ak);
a = 0.5;
n = 6000;
m = 4;

samples = randombits(12000);
samplesp = fpam(samples);

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

%Appropriate Decision Rule
out1=zeros(1,n);
out2=zeros(1,n);
for ii=1:n
    if rx(ii)>=2
        out1(ii)=1;
        out2(ii)=1;
    elseif rx(ii)>=0 && rx(ii)<2
        out1(ii)=1;
        out2(ii)=0;
    elseif rx(ii)>=-2 && rx(ii)<0
        out1(ii)=0;
        out2(ii)=0;
    else
        out1(ii)=0;
        out2(ii)=1;
    end
end
cnt1 = zeros(1,n);
cnt2 = zeros(1,n);
for ii = 1:n
   if out1(ii) == samplesp(ii)
       cnt1(ii) = 1;
   else
       cnt1(ii) = 0;
   end
   if out2(ii) == samplesp(ii)
       cnt2(ii) = 1;
   else
       cnt2(ii) = 0;
   end
end
cnt3 = 0;
for ii = 1:n
    cnt3 = cnt3 + and(cnt1(ii),cnt2(ii));
end
disp(1 - (cnt3/n))
