N=10;
fs = 240;
t = 0:1/fs:11;
t1 = 0:1/(2*fs):11;
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
%%-------defining cos and sine terms
c = cos(40*pi*t);
d = sin(40*pi*t);
c1 = cos(40*pi*t+pi/4);
d1 = sin(40*pi*t+pi/4);
c3 = cos(40*pi*t-pi/4);
d3 = sin(40*pi*t-pi/4);
%%%%% -------to get vc and vs
Up = Uc.*c' - Us.*d';
h = rectangularPulse(0,0.25,t);
v1 = 2*Up .* c1';
v2 = 2*Up .* (-d1');
vc = conv(v1,h);
vs = conv(v2,h);
%%%% ----------- To get back Uc and Us
Vp = Uc .*c1' - Us .*d1';
V1 = 2*Vp .* c3';
V2 = 2*Vp .* (-d3');
Uc1 = conv(V1,h);
Us1 = conv(V2,h);
%%%------plots
figure;
% plot(2*t1,Vp);
% xlim([1,11]);
subplot(2,1,1);
plot(2*t1,Uc1);
xlabel('symbols');
ylabel('reconstructed Uc');
xlim([1,11]);
subplot(2,1,2);
plot(2*t1,Us1);
xlabel('symbols');
ylabel('reconstructed Us');
xlim([1,11]);


 



