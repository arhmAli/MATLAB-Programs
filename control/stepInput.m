clear all 
clc;
a=arduino('COM4', 'Uno', 'Libraries', 'RotaryEncoder'); 
encoder = rotaryEncoder(a,'D2','D3',475);
r=rateControl(200); 
resetCount(encoder); 
% Step Response 
figure(1)
stepSignal=ones( 50,1); 
pos=ones(50,1);
writeDigitalPin(a,'D4',1); 
writeDigitalPin(a,'D5',0);
for i=1:1:50 
    pos(i)=(readCount(encoder)/4)*(360/475)*(pi/180); 
    writePWMDutyCycle(a,'D9',0.15); 
    waitfor(r); 
end
writePWMDutyCycle(a,'D9',0); t=0.1:1/10:5;
subplot(2,1,1); plot(t,stepSignal,'-b','LineWidth',2); title('Step Input Signal'); xlabel('Time (s)'); ylabel('Amplitude'); 
subplot(2,1,2); plot(t,(180/pi)*pos,'-r','LineWidth',2); title('Step Input Response for Position'); xlabel('Time (s)'); 
ylabel('Position (D)'); 
