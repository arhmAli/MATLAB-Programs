clear all
clc;
a=arduino("COM7","UNO","libraries","RotaryEncoder");
encoder=rotaryEncoder(a,"D2","D3",475);
speed=[];
writeDigitalPin(a,"D4",0);
writeDigitalPin(a,"D5",1);
writePWMVoltage(a,"D9",0.5);
r=rateControl(50);
for i=1:100
    speed(i)=readSpeed(encoder);
    waitfor(r);
end
writePWMVoltage(a,"D9",0);
time=linspace(0,10,100);
plot(time,speed);
figure
num=[300];
denom=[0.245 1];
g=tf(num,denom)
step(g,10)

