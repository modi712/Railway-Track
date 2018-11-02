%FOURIER TRANSFORM
function transform = Fourier(signal,length,nyquistFrequency,leastCount)
    transform = zeroes(nyquistFrequency/leastCount);
    for j = 1:NyquistMax/leastCountInFrequency
        for i=1:length+1
            transform(j)= transform(j)+signal(i)*cos(j*i);
        end
    end
end

%MEAN AND STANDARD DEVIATION
function [mean,deviation] = meanSD(signal,length)
    mean = zeroes(3);
    for i=1:length+1
        mean(1) = mean(1) + signal(1)(i);
    end
    deviation = 0;
    for i=1:length+1
        deviation = deviation+signal(i)*signal(i);
    end
    deviation = deviation - mean*mean;
    deviation = deviation^0.5;
end

%DISPLACEMENT ALONG G
function displace = displacement(signal,blank,sampleTime,length)   
    [mean,deviation] = meanSD(signal,length);
    disp("Deviation is: "+deviation);
    
end


