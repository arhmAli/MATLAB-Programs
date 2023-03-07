clear all 
a=arduino('COM4', 'Uno', 'Libraries', 'RotaryEncoder'); 
encoder = rotaryEncoder(a,'D2','D3',475);
r=rateControl(200); 
resetCount(encoder); 
