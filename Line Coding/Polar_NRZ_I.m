clc;
clear;

bits=[0 1 0 0 1 1];

sampleSize=200;
bitRate=1;
totalBit=length(bits);
totalSampleSize=sampleSize*totalBit;
totaSampleTime=(totalBit/bitRate);
dTime=totaSampleTime/totalSampleSize;
t=0:dTime:totaSampleTime;
y=zeros(1,length(t));
pre=1;

for i=0:totalBit-1;
    if bits(i+1)==1
      if pre==1
        pre=-1;
        y(i*sampleSize+1 : (i+1)*sampleSize)=-1;
        
      else
        pre=1;
        y(i*sampleSize+1 : (i+1)*sampleSize)=1;
      end;
    else
       y(i*sampleSize+1 : (i+1)*sampleSize)=pre;
    end
      
end;
plot(t,y,'LineWidth',3);
axis([0 t(end) -2 2]);
grid on;
title('NRZ-I');


%Decoding

p=1;
x=0;
for i=1:200:length(y)-1
  if p==y(i)
    x=x+1;
    ans_bit(x)=0;
  else
    x=x+1;
    ans_bit(x)=1;
    p=-p;
  end
end

 
disp(ans_bit);



