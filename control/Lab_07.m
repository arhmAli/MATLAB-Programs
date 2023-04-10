Part A - Position Control in Closed Loop

clear all
a=arduino('COM6', 'Uno', 'Libraries', 'RotaryEncoder');
encoder = rotaryEncoder(a,'D2','D3',475);
r=rateControl(200);
t=0.1:1/10:5;
length=50;
resetCount(encoder);
posRef=360*pi/180;
kp=100;
for i=1:1:length
    pos(i)=(readCount(encoder)/4)*(360/480)*(pi/180);
    err=(posRef-pos(i))/(2*pi);
    Gc=(kp*err);
    if(err>0)
        writeDigitalPin(a,'D4',0);
        writeDigitalPin(a,'D5',1);
    else
        writeDigitalPin(a,'D4',1);
        writeDigitalPin(a,'D5',0);
    end
    if(abs(Gc)>255)
        Gc=255;
    end
    writePWMDutyCycle(a,'D9',abs(Gc)/255);
    waitfor(r);
end
writePWMDutyCycle(a,'D9',0);
resetCount(encoder);
figure(4);
plot(t,(180/pi)*pos, '-r', 'LineWidth', 2);
hold on;
plot(t,posRef*(180/pi),'.b','LineWidth',1);
grid on;
title('Close Loop Response (Kp='+string(kp)+')');
xlabel('Time (s)');
ylabel('Position (D)');

________________________________________________________________________

PI Control in Closed Loop

clear all
a=arduino('COM6', 'Uno', 'Libraries', 'RotaryEncoder');
encoder = rotaryEncoder(a,'D2','D3',475);
f=10;
T=1/f;
length=50;
freq=rateControl(f);

t=0.1:1/10:5;
length=50;
resetCount(encoder);
posRef=360*pi/180;
kp=100;
ki=30;
cumErr=0;

for i=1:1:length
    pos(i)=(readCount(encoder)/4)*(360/480)*(pi/180);
    err=(posRef-pos(i))/(2*pi);
    cumErr=cumErr+err*(1/f);
    Gc=(kp*err)+(ki*cumErr);
    if(err>0)
        writeDigitalPin(a,'D4',0);
        writeDigitalPin(a,'D5',1);
    else
        writeDigitalPin(a,'D4',1);
        writeDigitalPin(a,'D5',0);
    end
    if(abs(Gc)>255)
        Gc=255;
    end
    writePWMDutyCycle(a,'D9',abs(Gc)/255);
    waitfor(freq);
end
writePWMDutyCycle(a,'D9',0);
resetCount(encoder);
figure(5);
plot(t,(180/pi)*pos,'-r','LineWidth',2);
hold on;
plot(t,(180/pi)*posRef,'.b','LineWidth',1);
grid on;
title('Close Loop (Kp='+string(kp)+', Ki='+string(ki)+')');
xlabel('Time (s)');
ylabel('Position (D)');

__________________________________________________________________________________

Part C PID Closed Loop Control


change the reference position as
 posRef=360*pi/180;

rest code is same.




____________________________________________________________________________________
Part D PID Closed Loop Control (analogue adjustable ref position)

clear all
uno=arduino('COM6', 'Uno', 'BaudRate', 500000, 'Libraries', 'RotaryEncoder');
sg1='D2';
sg2='D3';
in1='D4';
in2='D5';
en='D9';
encoder=rotaryEncoder(uno,sg1,sg2,480);
f=10;
T=1/f;
length=50;
freq=rateControl(f);
t=0:T:(length-1)*T;
t=t';
pos=ones(length,1);
resetCount(encoder);
kp = 78;
ki = 0.22;
kd = 39;
cumErr=0;
prevErr=0;
for i=1:1:length
    posRef=(360/5)*readVoltage(uno,'A0')*(pi/180);
    pos(i)=(readCount(encoder)/4)*(360/480)*pi/180;
    err=(posRef-pos(i));
    cumErr=cumErr+err*T;
    diffErr=(err-prevErr)/T;
    Gc=(kp*err)+(ki*cumErr)+(kd*diffErr);
    if(err>0)
        writeDigitalPin(uno,in1,0);
        writeDigitalPin(uno,in2,1);
    elseif(err<0)
        writeDigitalPin(uno,in1,1);
        writeDigitalPin(uno,in2,0);
    else
        writeDigitalPin(uno,in1,0);
        writeDigitalPin(uno,in2,0);
    end
    if(abs(Gc)>255)
        Gc=255;
    end
    writePWMDutyCycle(uno,en,abs(Gc)/255);
    prevError=err;
    waitfor(freq);
end
writePWMDutyCycle(uno,en,0);
resetCount(encoder);
figure(5)
plot(t,(180/pi)*pos,'-r','LineWidth',2);
hold on;
plot(t,(180/pi)*posRef,'.b','LineWidth',1);
grid on;
title('Close Loop (Kp='+string(kp)+', Ki='+string(ki)+', Kd='+string(kd)+')');
xlabel('Time (s)');
ylabel('Position (D)');
