function outar = fpam(inar)
outar = zeros(1,length(inar)/2);
jj = 1;
for ii = 1:2:length(inar)
    if(inar(ii) == 0 && inar(ii+1) == 0)
        outar(jj) = -3;
    elseif(inar(ii) == 0 && inar(ii+1) == 1)
        outar(jj) = -1;
    elseif (inar(ii) == 1 && inar(ii+1) == 1)
        outar(jj) = 1;
    else
        outar(jj) = 3;
    end 
    jj = jj +1;  
end
end