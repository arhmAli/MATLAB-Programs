// To control the speed of the DC motor using arduino in MATLAB IDE
 Speed control of DC motor
a=arduino()
for i=1:5;
   %As we know that the arduino has the fixed voltage pin of 5V so we vary the speed from 0 to 5 and check the speed
    writePWMVoltage(a,'D9',i);
    % 3 seconds pause to ensure that we take out time to notice the diff as each 1V diff is added.
    pause(3)
end
   for i=5:-1:0;
    writePWMVoltage(a,'D9',i);
    pause(2)
   end
   
