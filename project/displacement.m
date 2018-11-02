%DISPLACEMENT ALONG G
function xcc = displacement(signal,blank,sampleTime,blankLength,signalLength)   
    [mean,deviation] = SdMean(blank,blankLength);
    disp("Deviation is: "+deviation);
    disp("Mean is: "+mean);
    for i=1:signalLength
        signal(1,i) = signal(1,i) - mean(1);
        signal(2,i) = signal(2,i) - mean(2);
        signal(3,i) = signal(3,i) - mean(3);
    end
    vector = mean/(mean(1)*mean(1)+mean(2)*mean(2)+mean(3)*mean(3));
    acc = transpose(vector)*signal;
    vcc = zeros(signalLength,1);
    for i=2:signalLength
        vcc(i) = (acc(i-1) + acc(i))/2;
        vcc(i) = vcc(i)*sampleTime;
    end
    xcc = zeros(signalLength,1);
    for i =2:signalLength
        xcc(i) = (vcc(i-1) + vcc(i))/2;
        xcc(i) = xcc(i)*sampleTime;
    end
end