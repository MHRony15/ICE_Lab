clc;
clear;
bits=[0 1 0 0 1 ];
sampleSize=100;
bitRate=1;
totalBit=length(bits);
totalSampleSize=2*sampleSize*totalBit;
totaSampleTime=(totalBit/bitRate);
dTime=totaSampleTime/totalSampleSize;
t=0:dTime:totaSampleTime;
y=zeros(1,length(t));
    for i=0:1:(totalBit-1);
        if bits(i+1)==1
            y(i*2*sampleSize+1 : (2*i+1)*sampleSize)=1; %first
        else
            y(i*2*sampleSize+1 : (2*i+1)*sampleSize)=-1;%first
        end;
    end;
     plot(t,y);
     axis([0 t(end) -2 2]);
     grid on;
     title('Polar RZ');
     
     
     %Decoding
     x=0;
     for i=1:200:length(y)-1
       if y(i)==-1
         x=x+1;
         ans_bit(x)=0;
        else
         x=x+1;
         ans_bit(x)=1;
       end
       
     end
     
     disp(ans_bit);
     
