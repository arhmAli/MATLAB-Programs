% Heun's method will give our answer
 f = @(t,y) (1-t)*y;      
 a = input('Enter left end ponit, a:  '); %0
 b = input('Enter right end point, b:  ');%5
 n = input('Enter no. of subintervals, n: '); %5               
 alpha = input('Enter the initial condition, alpha:  ');
 
 h = (b-a)/n;                                                
 t=[a zeros(1,n)]; 
 w=[alpha zeros(1,n)];

 
 for i = 1:n+1 
  t(i+1)=t(i)+h;
  wprime=w(i)+(h/3)*f(t(i),w(i));
  w(i+1)=w(i)+(h/4)*(f(t(i),w(i))+3*f(t(i)+(2*h/3), w(i)+(2*h/3)*f(t(i)+h/3, wprime)));
  fprintf('%5.4f  %11.8f\n', t(i), w(i));
  plot(t(i),w(i),'r*'); grid on; 
  xlabel('t values'); ylabel('w values');
  hold on;
 end
