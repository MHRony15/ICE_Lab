clc;
clear;

bits=[1 0 1 1 0 0 1 1 1 0];

sampleSize=100;
bitRate=1;
totalBit=length(bits);
totalSampleSize=sampleSize*totalBit;
totaSampleTime=(totalBit/bitRate);
dTime=totaSampleTime/totalSampleSize;
t=0:dTime:totaSampleTime;
y=zeros(1,length(t));
for i=0:totalBit-1;
    if bits(i+1)==1
        y(i*sampleSize+1 : (i+1)*sampleSize)=1;
    end;
end;
plot(t,y,'LineWidth',3);
axis([0 t(end) -2 2]);
grid on;
title('NRZ-L');
disp("Decoding: ");
x = 0;
for i=1:length(t)
    if t(i)>x
        x = x + 1;
        ans_bits(x) = y(i);
    end
end
disp(ans_bits);






