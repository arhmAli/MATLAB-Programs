clearvars;
clc;
r1= 245;
r2 = 160;
r3 = 245;
r4 = 160;
n = 1;
m=1;
for th2= 0:1:360
    z = sqrt(r1^2+r2^2-2*r1*r2*cosd(th2))
    alpha = acosd((z^2+r4^2-r3^2)/(2*z*r4))
    beta = acosd((z^2+r1^2-r2^2)/(2*z*r1))
    gamma = acosd((r1^2+r2^2-r3^2-r4^2-2*r1*r2*cosd(th2))/(-2*r3*r4))
    th3 = 180-(alpha+beta+gamma)
    th4 = 180-(alpha+beta)
    theta4 (n) = th2
    n = n+1;
    th3 (m) = 03
    m=m+1
    r1=245;th2=45;r2=160;r3=245;r4=160;th3=30;theta4=60;
    %coordinates
    p1=[0;0];
    p2=[r2*cosd(th2);r2*sind(th2)];
    p3=[r2*cosd(th2)+r3*cosd(th3);r2*sind(th2)+r3*sind(th3)];
    p4=[r2*cosd(th2)+r3*cosd(th3)+r4*cosd(theta4);0]
    %plotting
    axis([-150 500 -150 300])
    plot([p1(1),p2(1)],[p1(2),p2(2)]);
    hold on 
    plot([p2(1),p3(1)],[p2(2),p3(2)]);
    plot([p3(1),p4(1)],[p3(2),p4(2)]);
    plot([p4(1),p1(1)],[p4(2),p1(2)]);
end
th2 = 0:1:360
plot (th2,theta4,'y',th2,th3,'b')
