a = 0.5;
m = 32; %oversample by a lot to get smooth plot
length1 = 2; % where to truncate the time domain response
length2 = 5;
[rc1,time1] = raised_cosine(a,m,length1);
[rc2,time2] = raised_cosine(a,m,length2);
%(one-sided, multiple of symbol time)
%%----------------------------------------%%%%%%%%
ts=1/32; %sampling interval
time_interval = 0:ts:1; %sampling time instants
signal_timedomain = rc1; %sinusoidal pulse in our example
fs_desired = 1/64; %desired frequency granularity
Nmin = ceil(1/(fs_desired*ts)); %minimum length DFT for desired frequency granularity
%for efficient computation, choose FFT size to be power of 2
Nfft = 2^(nextpow2(Nmin)); %FFT size = the next power of 2 at least as big as Nmin
signal_freqdomain = ts*fft(signal_timedomain,Nfft);
%fftshift function shifts DC to center of spectrum
signal_freqdomain_centered = fftshift(signal_freqdomain);
fs=1/(Nfft*ts); %actual frequency resolution attained
freqs = ((1:Nfft)-1-Nfft/2)*fs;
%%-----------------------------------------%%%%%%%%%%%
%%----------------------------------------%%%%%%%%
ts1=1/32; %sampling interval
time_interval1 = 0:ts1:1; %sampling time instants
signal_timedomain1 = rc2; %sinusoidal pulse in our example
fs_desired1 = 1/64; %desired frequency granularity
Nmin1 = ceil(1/(fs_desired1*ts1)); %minimum length DFT for desired frequency granularity
%for efficient computation, choose FFT size to be power of 2
Nfft1 = 2^(nextpow2(Nmin1)); %FFT size = the next power of 2 at least as big as Nmin
signal_freqdomain1 = ts1*fft(signal_timedomain1,Nfft1);
%fftshift function shifts DC to center of spectrum
signal_freqdomain_centered1 = fftshift(signal_freqdomain1);
fs1=1/(Nfft1*ts1); %actual frequency resolution attained
freqs1 = ((1:Nfft1)-1-Nfft1/2)*fs1;
%%-----------------------------------------%%%%%%%%%%%

pxx1 = abs((signal_freqdomain_centered)).*abs((signal_freqdomain_centered))/2*length1;
pxx2 = abs((signal_freqdomain_centered1)).*abs((signal_freqdomain_centered1))/2*length2;
figure;obw(pxx1,freqs,[min(freqs),max(freqs)],95);
figure;obw(pxx2,freqs1,[min(freqs1),max(freqs1)],95);