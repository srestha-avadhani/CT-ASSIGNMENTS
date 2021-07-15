%NUMBER OF SYMBOLS
nsymbols = 12000;
bitar = randombits(nsymbols);
m = 4;
%parameters for sampled raised cosine pulse
a = 0.5;
length = 10;% (truncated outside [-length*T,length*T])
%raised cosine transmit filter (time vector set to a dummy variable which is not used)
[transmit_filter,dummy] = raised_cosine(a,m,length);
%BPSK SYMBOL GENERATION
symbols = bpsk(bitar);
%UPSAMPLE BY m
nsymbols_upsampled = 1+(nsymbols-1)*m;%length of upsampled symbol sequence
symbols_upsampled = zeros(nsymbols_upsampled,1);%initialize
symbols_upsampled(1:m:nsymbols_upsampled)=symbols;%insert symbols with spacing m
%NOISELESS MODULATED SIGNAL
tx_output = conv(symbols_upsampled,transmit_filter);
plot(tx_output);