function [rc,time_axis] = raised_cosine(a,m,length)
length_os = floor(length*m);
z = cumsum(ones(length_os,1))/m;
A= sin(pi*z)./(pi*z);
B= cos(pi*a*z); 
C= 1 - (2*a*z).^2;
zerotest = m/(2*a); 
if (zerotest == floor(zerotest))
B(zerotest) = pi*a;
C(zerotest) = 4*a;
end
D = (A.*B)./C;
rc = [flipud(D);1;D];
time_axis = [flipud(-z);0;z];