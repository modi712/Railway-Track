function transform=fourierTranfrom1D(signal,length,nyquistFrequency,leastCount)
    transformr = zeros(nyquistFrequency/leastCount,1);
    for j = 1:nyquistFrequency/leastCount
        for i=1:length
           transformr(j)= transformr(j)+signal(i)*cos(j*i);
        end
        transformr(j) = transformr(j)*transformr(j);
    end
    transformi = zeros(nyquistFrequency/leastCount,1);
    for j = 1:nyquistFrequency/leastCount
        for i=1:length
           transformi(j)= transformi(j)+signal(i)*sin(j*i);
        end
        transformi(j) = transformi(j)*transformi(j);
    end
    transform = zeros(nyquistFrequency/leastCount,1);
    for j = 1:nyquistFrequency/leastCount
        transform(j)= (transformr(j)+transformi(j))^0.5;
    end
end