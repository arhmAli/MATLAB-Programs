%speed control of DC motor
a=arduino()
for i=1:5;
    writePWMVoltage(a,'D9',i);
    pause(3)
end
   for i=5:-1:0;
    writePWMVoltage(a,'D9',i);
    pause(2)
   end