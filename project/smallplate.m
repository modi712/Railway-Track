%variable definition
leastCountInFrequency = 0.1;
NyquistMax = 92 ;

%code starts
az = xlsread('datafield.xslx','B:B');
Zr=zeros(NyquistMax/leastCountInFrequency);
for j = 1:NyquistMax/leastCountInFrequency
    for i=1:1203
        Zr(j)= Zr(j)+az(i)*cos(j*i)*9.053/4.62;
    end
end

%variable definition

%time = 20/1000;
leastCountInFrequency = 0.1;
%sampRate = 1/time;
NyquistMax = 92;
sheet = 19;
rangez = 'A1:A1540';
fileName = 'datafield';
omega = linspace(0,NyquistMax,NyquistMax/leastCountInFrequency);

%code starts

az = xlsread(fileName,sheet,rangez);
Z1=zeros(NyquistMax/leastCountInFrequency);
for j = 1:NyquistMax/leastCountInFrequency
    for i=1:1540
        Z1(j)= Z1(j)+az(i)*cos(j*i);
    end
end
%only system response
%for j=1:NyquistMax/leastCountInFrequency
 %  Z1(j)=abs(Z1(j))/abs(Zr(j)); 
%end

plot(omega,abs(Z1)/max2,'blue');



