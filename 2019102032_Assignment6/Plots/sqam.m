function outar = sqam(inar)
    outar = zeros(1,length(inar)/4);
    jj = 1;
    for ii = 1:4:length(inar)
        outar(jj) = fpam(inar(ii:ii+1));
        outar(jj) = outar(jj) + 1i*fpam(inar((ii+2):(ii+3))); 
        jj = jj + 1;
    end
end