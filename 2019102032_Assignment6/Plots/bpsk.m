function outar = bpsk(inar)
outar = zeros(1,length(inar));
for ii = 1:length(inar)
    if (inar(ii) == 1)
        outar(ii) = 1;
    else
        outar(ii) = -1;
    end 
end

