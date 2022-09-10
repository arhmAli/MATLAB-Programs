clearvars;
clc;
r1=240;
r2=80;
r3=120;
r4=200;
n=1;
for theta2=0:30:360;
    z=sqrt(r1^2 + r2^2 - 2*r1*r2*cosd(theta2))
    y=acosd((z^2 - r3^2- r4^2) / (-2*r3*r4))
    a=acosd((z^2 + r1^2- r2^2) / (2*z*r1))
    b=acosd((z^2 + r4^2- r3^2) / (2*z*r4))
    theta3=180-a-b-y
    theta4=180-a-b
    theta_3(n)= theta3
    theta_4 (n)= theta4
    n=n+1
    P1= [0;0];
    P2= [r2*cosd(theta2) ; r2*sind(theta2)]
    P3= [r2*cosd(theta2)+r3*cosd(theta3) ; r2*sind(theta2)+r3*sind(theta3)]
    P4= [r1;0];
    axis ([-150 300 -200 200])
    k1=plot([P1(1),P2(1)],[P1(2),P2(2)])
    hold on 
    k2=plot([P2(1),P3(1)],[P2(2),P3(2)])
    k3=plot([P3(1),P4(1)],[P3(2),P4(2)])
    k4=plot([P4(1),P1(1)],[P4(2),P1(2)])
    drawnow
    pause(0.5)
    delete(k1)
    delete(k2)

clearvars;
clc;
r1=240;
r2=80;
r3=120;
r4=200;
n=1;
for theta2=0:1:360
    z=sqrt(r1^2 + r2^2 - 2*r1*r2*cosd(theta2))
    y=acosd((z^2 - r3^2- r4^2) / (-2*r3*r4))
    a=acosd((z^2 + r1^2- r2^2) / (2*z*r1))
    b=acosd((z^2 + r4^2- r3^2) / (2*z*r4))
    theta3=180-a-b-y
    theta4=180-a-b
    theta_4 (n)= theta4
    n=n+1
end
theta2=0:1:360;
 plot(theta2,theta_4)
end