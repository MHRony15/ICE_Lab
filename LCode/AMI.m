clc;
clear;

bits=[1 0 1 1 0 0 1 1 1 0];

sampleSize=200;
bitRate=2;
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
        y(i*sampleSize+1 : (i+1)*sampleSize)=1;
            pre=-pre;
        
        else
            y(i*sampleSize+1 : (i+1)*sampleSize)=-1;
            pre=-pre;
        end;
 
       end;
end;

plot(t,y,'LineWidth',3);
grid on;
title('AMI');

%Decoding
ans_bit=zeros(1,totalBit);
p=1;
x=0;
for i=1:sampleSize:length(y)-1
   l=y(i);
  if l==-1
      x=x+1;
    ans_bit(x)=1;
  else
      x=x+1;
    ans_bit(x)=l; 
  end
end

 
disp(ans_bit);
