EbN0_dB = 0:0.1:10;
EbN0 = 10.^(EbN0_dB/10);
BER = 1/2.*erfc(exp(1)*EbN0/(5*sqrt(2)));
semilogy(EbN0_dB,BER);
grid on;
hold on;
y = 0.01;
x = exp(-1)*5*sqrt(2)*(erfcinv(2*y));
x = 10*log(x)/log(10);
plot (x,y,'g*');
ylabel('Bit Error Probability');
xlabel('E_b/N_0 (dB)');
title('Bit Error Rate for 4-PAM');