delta=1
x=-2:delta:4; %the values of x 
y=x.^4;; %the function which i took is f(x)=x^4
n=length(y);
for i=1:n %row operation
    values(i,1)=y(i);
end
for j=2:n %column operation
    for i=1:n-j+1  % it loops over until  1 to length of y-2+1 because the column will have  will have different value so we add 1 in the length 
        values(i,j)=values(i+1,j-1)-values(i,j-1); %here we calculate the difference
    end
end
fprintf('x\t   y      1stOrder 2ndOrder\t  3rd\t 4th\t 5th'); 
for i=1:n %this loop is just for presentation or making the table look good
    fprintf('\n   %.f',x(i));
    for j=1:n-i+1
        fprintf('\t   %.f',values(i,j));
    end
end