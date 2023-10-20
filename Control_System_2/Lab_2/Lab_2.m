figure
M = 0.5;  % mass of the cart
m = 0.2;  % mass of the pendulum
b = 0.1;  % coefficent of the friction for the cart
l = 0.3;  % lwngth if the pendulum
I = 0.006; % momenyt of inertia
g = 9.8;   % gravity

a1 = -((I+m*l^2)b)/I(M+m)+M*m*l^2;
a2 = (m^2*g*l^2)/I*(M+m)+M*m*l^2;
a3 = -(m*l*b)/I*(M+m)+M*m*l^2;
a4 = (m*g*l*(M+m))/I*(M+m)+M*m*l^2;
a5 = (I+m*l^2)/I*(M+m)+M*m*l^2;
a6 = m*l/I*(M+m)+M*m*l^2;

A= [0 1 0 0; 0 a1 a2 0; 0 0 0 1; 0 a3 a4 0];
B= [0; a5; 0; a6];
C=[1    0   0   0];
%matrix
Pc=ctrb(A,B);
%det
detPc=det(Pc);
if detPc==0
    disp('system is not controllable')
else
        disp("system is controllabe")
end

S=stepinfo(sys)
step(sys)
%finding loop gain using desired pole location
i=sqrt(-1);
polDes=[-4+3*i;-4-3*i;-20];

K=place(A,B,polDes);

figure
sysOpen=ss(A,B,C,D);
sysClose=ss(A-B*K,B,C,D);
t=0:0.01:2;
x1=initial(sysClose,[1;0;0],t);
x2=initial(sysClose,[0;1;0],t);
x3=initial(sysClose,[0;0;1],t);
x3Open=initial(sysOpen,[0;0;1],t); 
subplot(4,1,1);plot(t,x1),grid
title('responce to initial condition')
ylabel('static variabel x1')
subplot(4,1,2);plot(t,x2),grid
ylabel('static variabel x2')
subplot(4,1,3);plot(t,x3),grid
ylabel('static variabel x3')
subplot(4,1,4);plot(t,x3Open),grid
ylabel('static variabel Openx3')
xlabel('t (sec)')
figure
plot(t,-x1*K(1)-x2*K(2)-K(3)*x3),grid




