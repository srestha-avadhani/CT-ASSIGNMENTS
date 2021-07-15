a1 = 0.25; % desired excess bandwidth
a2 = 0.5;
a3 = 1;
m = 64; %oversample by a lot to get smooth plot
length = 5; % where to truncate the time domain response
%(one-sided, multiple of symbol time)
[rc1,time1] = raised_cosine(a1,m,length);
[rc2,time2] = raised_cosine(a2,m,length);
[rc3,time3] = raised_cosine(a3,m,length);
figure;
%subplot(3,1,1);
plot(time1,rc1,'r');grid on;hold on;
%subplot(3,1,2);
plot(time2,rc2,'g');grid on;hold on;
%subplot(3,1,3);
plot(time3,rc3,'b');grid on;hold off;