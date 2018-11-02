%MEAN AND STANDARD DEVIATION
function [mean,deviation] = SdMean(signal,length)
    mean = zeros(3,1);
    for j= 1:3
        for i=1:length
            mean(j) = mean(j) + signal(j,i);
        end
    end
    mean = mean/(length);
    deviation = zeros(3,1);
    for j=1:3
        for i=1:length
            deviation(j) = deviation(j)+signal(j,i)*signal(j,i)/(length);
        end
    end
    for j=1:3
        deviation(j) = deviation(j) - mean(j)*mean(j);
    end
    deviation = deviation.^0.5;
end