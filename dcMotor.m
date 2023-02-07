// %Direction Control of DC MOTOR using Arduino in MATLAB IDE
%direction control
a=arduino()
for i=1:1;
    writeDigitalPin(a,'D6',0);
    writeDigitalPin(a,'D9',1);
    pause(5)
    writeDigitalPin(a,'D6',1);
    writeDigitalPin(a,'D9',0);
end
