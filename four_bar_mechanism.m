clearvars;
clc;
r1=240;
r2=53;
r3=117;
r4=168;
%l=168;
 
for th2=0:10:130
    z=sqrt(r1^2+r2^2-2*r1*r2*cosd(th2));
    c=acosd((r1^2+r2^2-r3^2-r4^2-2*r1*r2*cosd(th2))/(-2*r3*r4));
    alpha=acosd((z^2+r4^2-r3^2)/(2*z*r4));
    beta=acosd((z^2+r1^2-r2^2)/(2*z*r1));
    th3=180-alpha-beta-c;
    th4=180-(alpha+beta);
    
    axis([-100 400 -80 300])
    
    
   p1=[0;0];
p2=[r2*cosd(th2);r2*sind(th2)];
p3=[r2*cosd(th2)+r3*cosd(th3);r2*sind(th2)+r3*sind(th3)];
p4=[r1;0]
p5=[r1;2*(r2*sind(th2)+r3*sind(th3))];
posx=p5(1)-4;
posy=p5(2)-8;
k1=plot([p1(1),p2(1)],[p1(2),p2(2)])
hold on
k2=plot([p2(1),p3(1)],[p2(2),p3(2)])
k3=plot([p3(1),p4(1)],[p3(2),p4(2)])
k4=plot([p4(1),p1(1)],[p4(2),p1(2)])
%k5=plot([p3(1),p5(1)],[p3(2),p5(2)])
%k6=rectangle('position', [posx posy 8 16]);
drawnow
pause(0.5)
delete(k1)
delete(k2)
delete(k3)
delete(k4)
%delete(k5)
%delete(k6)
end
for th2=130:-10:-1
    z=sqrt(r1^2+r2^2-2*r1*r2*cosd(th2));
 
   alpha=acosd((z^2+r4^2-r3^2)/(2*z*r4));
    beta=acosd((z^2+r1^2-r2^2)/(2*z*r1));
    th3=180-alpha-beta-c;
    th4=180-(alpha+beta);
    
    
    axis([-100 400 -80 300])
    
    
   p1=[0;0];
p2=[r2*cosd(th2);r2*sind(th2)];
p3=[r2*cosd(th2)+r3*cosd(th3);r2*sind(th2)+r3*sind(th3)];
p4=[r1;0]
k1=plot([p1(2),p2(1)],[p1(2),p2(2)])
hold on
k2=plot([p2(1),p3(1)],[p2(2),p3(2)])
k3=plot([p3(1),p4(1)],[p3(2),p4(2)])
k4=plot([p4(1),p1(1)],[p4(2),p1(2)])
drawnow
pause(0.5)
delete(k1)
delete(k2)
delete(k3)
delete(k4)
end