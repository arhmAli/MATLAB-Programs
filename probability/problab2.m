clear all
clc
x=0:0.5:60;
y1= x;
y2= x.^2;
y3= x.*(log(x));
y4= x.*(log(x)).^2;

plot(x,y1,'-o')
hold on

plot(x,y2,'*r')
hold on

plot(x,y3,'-p')
hold on

plot(x,y4,'-b')
hold on

