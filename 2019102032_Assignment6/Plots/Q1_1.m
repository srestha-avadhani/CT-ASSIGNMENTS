n = 100;
sigma = [0.1,0.3,0.5];
for ii = 1:3
   n00 = sigma(ii)*rand(n,1);
   n01 = sigma(ii)*rand(n,1);
   r00 = n00 + 1;
   r01 = n01;
   figure;
   scatter(r00,r01,'x');
   hold on;
   n10 = sigma(ii)*rand(n,1);
   n11 = sigma(ii)*rand(n,1);
   r10 = n10;
   r11 = n11 + 1;
   scatter(r10,r11,'o');
   hold off;
   
   set(gca,'XAxisLocation','origin');
   set(gca,'YAxisLocation','origin');
   xlabel('symbol-1'); grid on;
   ylabel('symbol-2');
   title("Effect of noise on binary communication system (\sigma = "+sigma(ii)+")");
   
end