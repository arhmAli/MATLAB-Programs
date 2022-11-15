clear all;
clearvars;
clc;
h=input('enter the step size :')
x=input('enter starting value of "x": '):h:input('enter the end value of"x":')
y=zeros(size(x));
y(1)=1;
n=numel(y);
for i=1:n
     dydx=(x(i).^3.*exp(-2.*x(i))+2.*y(i))
    y(i+1)=y(i)+dydx*h;
    fprintf('"Yn"=\n\t   %0.01f',y(i));
end
