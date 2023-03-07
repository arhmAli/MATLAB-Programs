%After certain testings the best
%parameters are selected for the motor connected with arduino 
%to have good step response for the given Pulse 
clear all 
a=arduino('COM4', 'Uno', 'Libraries', 'RotaryEncoder'); 
encoder = rotaryEncoder(a,'D2','D3',475);
r=rateControl(150); 
resetCount(encoder); 
figure(1)
t=0.1:1/10:5; 
resetCount(encoder); 
stepSignal=ones(50,1); 
pos=ones(50,1); 
squareSignal=square(2*pi*0.5*t); 
for i=1:1:50 
    pos(i)=(readCount(encoder)/4)*(360/475)*(pi/180); 
    if(squareSignal(i)>0) 
        writeDigitalPin(a,'D4',0);
        writeDigitalPin(a,'D5',1); 
    elseif(squareSignal(i)<0) 
        writeDigitalPin(a,'D4',1); 
        writeDigitalPin(a,'D5',0); 
    end 
    writePWMDutyCycle(a,'D9',abs(squareSignal(i))); 
    waitfor(r); 
end 
writePWMDutyCycle(a,'D9',0); subplot(2,1,1); plot(t,squareSignal,'-b','LineWidth',2); grid on; 
title('Step Input Signal'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
subplot(2,1,2); plot(t,(180/pi)*pos,'-r','LineWidth',2); grid on; 
title('Square Input Response for Position'); xlabel('Time (s)'); 
ylabel('Position (D)'); 
