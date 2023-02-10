clear all
clc
syms x
fun=2*x^3+2*x^2+10*x-20;
f=inline(fun);
df=inline(diff(f(x)));
%to het guess
a=1;
b=2;
x=(a+b)/2;

for i=0:30
    x(i+1)=x;
    x=x(i+1)-f(x)/df(x);
    if x==x(i+1)
        break
    end
    
end
x



    

    

    




