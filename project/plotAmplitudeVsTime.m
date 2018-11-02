%variable definition

time = 20/1000;
leastCountInFrequency = 0.1;
sampRate = 1/time;
NyquistMax = sampRate/2;
sheet = 5;
rangez = 'F13:F1215';
fileName = 'datafield';
omega = linspace(0,NyquistMax,NyquistMax/leastCountInFrequency);

%code starts

az = xlsread(fileName,sheet,rangez);
Zr=zeros(NyquistMax/leastCountInFrequency);
for j = 1:NyquistMax/leastCountInFrequency
    for i=1:1203
        Zr(j)= Zr(j)+az(i)*cos(j*i);
    end
end
plot(omega,Zr);
