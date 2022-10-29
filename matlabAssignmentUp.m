
re=6400; %km
Mm= 7.34767309* 10^22 ;%kg
Me=6.0*10^24;
L=384400; %distance between earth and moon
phi=45;
sigma=28.5;
lamda=1;
n=(re/4)*(Mm/Me)*(re/L)^3*3*((cos^2)*(phi)*((cos)^2)*((sigma)-1) +3/2*(sin)*(2*(phi))*(sin)*2*(sigma)*(cos)*(lamda)+3*((cos)^2)*(phi)*((cos)^2)*(sigma)*((cos)^2)*(lamda);
disp(n)