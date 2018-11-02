%FOURIER TRANSFORM MAGNITUDE SPECTRUM
function transform = fourierTransform(signal,length,nyquistFrequency,leastCount)
    transformr = zeros(nyquistFrequency/leastCount,3);
    for k =1:3
        for j = 1:nyquistFrequency/leastCount
            for i=1:length
                transformr(j,k)= transformr(j,k)+signal(i,k)*cos(j*i);
            end
            transformr(j,k) = transformr(j,k)*transformr(j,k);
        end
    end
    transformi = zeros(nyquistFrequency/leastCount,3);
    for k =1:3
        for j = 1:nyquistFrequency/leastCount
            for i=1:length
                transformi(j,k)= transformi(j,k)+signal(i,k)*sin(j*i);
            end
            transformi(j,k) = transformi(j,k)*transformi(j,k);
        end
    end 
    transform = zeros(nyquistFrequency/leastCount,3);
    for k =1:3
        for j= 1:nyquistFrequency/leastCount
            transform(j,k) = (transformr(j,k)+transformi(j,k))^0.5;
        end
    end
end