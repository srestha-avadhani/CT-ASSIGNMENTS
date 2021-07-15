function outar = epsk(inar)
    index = zeros(1,floor(length(inar)/3));
    jj = 1;
    for ii = 1:3:length(inar)
        if(inar(ii))
            index(jj) = (-((fpam(inar((ii+1):(ii+2)))-3)/2)+4);
        else
            index(jj) = (fpam(inar((ii+1):(ii+2)))+3)/2;
        end
        jj = jj + 1;
    end
    outar = exp(1j*2*pi*index/8);
end

