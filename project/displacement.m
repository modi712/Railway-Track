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
    %disp(signal);
    vector = mean/(mean(1)*mean(1)+mean(2)*mean(2)+mean(3)*mean(3))^0.5;
    acc = transpose(vector)*signal;
   % disp(acc);
    temp = zeros(signalLength,1);
    for i=1:signalLength
        temp(i) = sampleTime;
    end
    vcc = sampleTime*cumtrapz(acc);
    disp(vcc);
    temp = zeros(signalLength,1);
    for i=1:signalLength
        temp(i) = sampleTime;
    end
    xcc = sampleTime*cumtrapz(vcc);
%      time = signalLength;
%    xcc = table(time',cdistance','g',{'l','kj'});
%     vcc = zeros(signalLength,1);
%     for i=2:signalLength
%         vcc(i) = (acc(i-1) + acc(i))/2;
%         vcc(i) = vcc(i)*sampleTime;
%     end
%     sum = 0;
%     for i=2:signalLength-1
%         sum=sum+vcc(i);
%         vcc(i+1) =  vcc(i+1)+sum;
%     end
%     xcc = zeros(signalLength,1);
%     for i =2:signalLength
%         xcc(i) = (vcc(i-1) + vcc(i))/2;
%         xcc(i) = xcc(i)*sampleTime;
%     end
%     sum = 0;
%     for i=2:signalLength-1
%         sum=sum+xcc(i);
%         xcc(i+1) =  xcc(i+1)+sum;
%     end
%     disp(xcc(100));
end
