clear all
clc
h = 0.5;
x = 0:0.5:3;
y = 2;
n = x(end)/h;
f = inline('4*exp(0.8*x)-0.5*y','x','y');

for i=1:n
    
k1=f(x(i),y(i));
k2=f(x(i)+(h/2),y(i)+h*(k1/2));
k3=f(x(i)+(h/2),y(i)+h*(k2/2));
k4=f(x(i)+h,y(i)+h*k3);
y(i+1) = y(i)+(h/6)*(k1+2*k2+2*k3+k4);
end
disp(y)
   