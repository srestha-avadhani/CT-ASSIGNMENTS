ak = 6.31; % EbN0 found is 6.31 which in normal scale is this
variance = 5/(4*ak);
a = 0.5;
n = 3000;
m = 4;

samples = randombits(12000);
samplesp = sqam(samples);

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
out=zeros(1,n);
for ii=1:n
    if real(rx(ii))>=0 && real(rx(ii))<=2 && imag(rx(ii))>=0 && imag(rx(ii))<=2
        out(ii)=1+1i;
    elseif real(rx(ii))>=2 && imag(rx(ii))>=0 && imag(rx(ii))<=2
        out(ii) = 3+1i;
    elseif real(rx(ii))>=0 && real(rx(ii))<=2 && imag(rx(ii))>=2
        out(ii) = 1+3i;
    elseif real(rx(ii))>=2 && imag(rx(ii))>=2
        out(ii) = 3+3i;
    %%%%%%%%%Q2%%%%%%%%%%%%%%%%    
    elseif real(rx(ii))>=-2 && real(rx(ii))<=0 && imag(rx(ii))>=0 && imag(rx(ii))<=2
        out(ii)=-1+1i;
    elseif real(rx(ii))<=-2 && imag(rx(ii))>=0 && imag(rx(ii))<=2
        out(ii) = -3+1i;
    elseif real(rx(ii))>=-2 && real(rx(ii))<=0 && imag(rx(ii))>=2
        out(ii) = -1+3i;
    elseif real(rx(ii))<=-2 && imag(rx(ii))>=2
        out(ii) = 3+3i; 
    %%%%%%%%%%Q3%%%%%%%%%%%%%%%%%
    elseif real(rx(ii))>=-2 && real(rx(ii))<=0 && imag(rx(ii))<=0 && imag(rx(ii))>=-2
        out(ii)=-1-1i;
    elseif real(rx(ii))<=-2 && imag(rx(ii))<=0 && imag(rx(ii))>=-2
        out(ii) = -3-1i;
    elseif real(rx(ii))>=-2 && real(rx(ii))<=0 && imag(rx(ii))<=-2
        out(ii) = -1-3i;
    elseif real(rx(ii))<=-2 && imag(rx(ii))<=-2
        out(ii) = -3-3i; 
    %%%%%%%%%%Q4%%%%%%%%%%%%%%%%%%%%
    elseif real(rx(ii))>=0 && real(rx(ii))<=2 && imag(rx(ii))<=0 && imag(rx(ii))>=-2
        out(ii)=1-1i;
    elseif real(rx(ii))>=2 && imag(rx(ii))<=0 && imag(rx(ii))>=-2
        out(ii) = 3-1i;
    elseif real(rx(ii))>=0 && real(rx(ii))<=2 && imag(rx(ii))<=-2
        out(ii) = 1-3i;
    else
        out(ii) = 3-3i;
    end
end
cnt=0;
for ii = 1:n
   if out(ii) == samplesp(ii)
       cnt = cnt+ 1;
   end
end
disp(1 - (cnt/n))

