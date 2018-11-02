%Variable definition
prompt = 'Which track?\n';
x = input(prompt);
if(x == 2)
    rangeBlankX = 'B10:B875';
    rangeBlankY = 'D10:D875';
    rangeBlankZ = 'F10:F875';
    sheetBlank = 16;
    BlankLength = 866;
end
if(x==1)
    rangeBlankX = 'B5:B4068';
    rangeBlankY = 'D5:D4068';
    rangeBlankZ = 'F5:F4068';
    sheetBlank = 1;
    BlankLength = 4064;
end

filename = 'datafield';
rangeDataX = 'B14:B1290';
rangeDataY = 'D14:D1290';
rangeDataZ = 'F14:F1290';
sheetData = 10;
DataLength = 1290-14+1;

%Code starts
axWAP4 = xlsread(filename,sheetData,rangeDataX);
ayWAP4 = xlsread(filename,sheetData,rangeDataY);
azWAP4 = xlsread(filename,sheetData,rangeDataZ);
axWAP4 = axWAP4/16384;
ayWAP4 = ayWAP4/16384;
azWAP4 = azWAP4/16384;
blankx = xlsread(filename,sheetBlank,rangeBlankX);
blanky = xlsread(filename,sheetBlank,rangeBlankY);
blankz = xlsread(filename,sheetBlank,rangeBlankZ);
blankx = blankx/16384;
blanky = blanky/16384;
blankz = blankz/16384;
signal = [axWAP4,ayWAP4,azWAP4];
blank = [blankx,blanky,blankz];
signal = transpose(signal);
blank = transpose(blank);
time=linspace(0,DataLength*0.0054,DataLength);
frequency = linspace(0,92,920);
displacementArray = 9.81*displacement(signal,blank,0.0054,BlankLength,DataLength);
prompt = 'Frequency = 1; Time = 2';
y = input(prompt);
if (y==2)
    plot(time,displacementArray,'red');
end
if(y==1)
    displacementArray = removeAcc(displacementArray,x);
    plot(frequency,abs(fourierTranfrom1D(transpose(displacementArray),DataLength-2,92,0.1)),'red');
end