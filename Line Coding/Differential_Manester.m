clc;
clear;
bits=[0 1 0 0 1 1];
sampleSize=100;
bitRate=1;
totalBit=length(bits);
totalSampleSize=2*sampleSize*totalBit;
totaSampleTime=(totalBit/bitRate);
dTime=totaSampleTime/totalSampleSize;
t=0:dTime:totaSampleTime;
pre=1;
y=zeros(1,length(t));
    for i=0:1:(totalBit-1);
        if bits(i+1)==0
          if pre==1
            y(i*2*sampleSize+1 : (2*i+1)*sampleSize)=-1;
            y((i*2+1)*sampleSize+1 : (2*i+2)*sampleSize)=1;
          else
            y(i*2*sampleSize+1 : (2*i+1)*sampleSize)=1;
            y((i*2+1)*sampleSize+1 : (2*i+2)*sampleSize)=-1;
            pre=-1;
          end
          
        else
            y(i*2*sampleSize+1 : (2*i+1)*sampleSize)=pre;
            y((2*i+1)*sampleSize+1 : (2*i+2)*sampleSize)=-pre;
            pre=-pre;
        end;
    end;
     plot(t,y);
     axis([0 t(end) -2 2]);
     grid on;
     title('Diffrtential Manchester');
     
     %Decoding
     p=1;
     x=0;
     for i=1:200:length(y)-1
       if p!=y(i)
            x=x+1;
            ans_bit(x)=0;
       else
        x=x+1;
        ans_bit(x)=1;
        p=-p;
       end
      end
  disp(ans_bit);
     
       
     
     