clear all
clc
a = arduino('COM7','Uno','Libraries','rotaryEncoder'); % place number of COM port
encoder = rotaryEncoder(a,'D2','D3',475);
RPM=0; %initial value
r=pause(20); 
RPM=readSpeed(encoder);
inputSpeed=300 ; % Students are required to put some value here to avoid program error
maxSpeed=300;  % determine by your self (hint previous lab)
writeDigitalPin(a,'D5',1); 
writeDigitalPin(a,'D4',0);
outputSpeed=readSpeed(encoder);
es=inputSpeed-outputSpeed;
kt=19;

pwm=0;
for jj=1:50
    outputSpeed=readSpeed(encoder);
    RPM(jj)=outputSpeed; 
    
    es=inputSpeed-outputSpeed; 
    k(jj)=es;
    pwm=es*kt/maxSpeed;
if pwm>1 pwm=1;
end
writePWMDutyCycle(a,"D9",pwm);
waitfor(r);
end
writePWMDutyCycle(a,"D9",0);

t=0:0.24:11.99;
subplot(1,2,1)
plot(t,RPM);
subplot(1,2,2)
plot(t,k)