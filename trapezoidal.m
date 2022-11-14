
num=input('input the type of method ');

switch (num)
          case (trapezoidal)
                    x=input('x:');
                    y=input('f(X):');
                    h=x(2)-x(1);
                    n=length(y);
                    value2=0;

                    for i=2:n-1
                        value2=value2+2*(y(i));
                    end

                    I=(h/2)*((y(1)+y(end)+value2))
          case (1by3)
                    x=input('X:');
                    y=input('f(X):');
                    h=x(2)-x(1);
                    n=length(y);
                    val2=0;
                    val3=0;

                    for i=2:2:n-1
                        val2=val2+2*(y(i));
                    end

                    for j=3:2:n-2
                        val3=val3+4*(y(j));
                    end

                    I=(h/3)*((y(1)+y(end)+val2+val3))
          case (3by8)
                    x=input('X:');
                    y=input('f(X):');
                    h=x(2)-x(1);
                    n=length(y);
                    value2=0;
                    value3=0;

                    for i=2:n-1
                        if rem(i,3)==1
                        val2=val2+2*(y(i));

                        else
                        val3=val3+3*(y(i));
                        end
                    end

                    I=((3*h)/8)*((y(1)+y(end)+val2+val3))
          otherwise
            disp('Error!')
        end
