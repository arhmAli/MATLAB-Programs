%Initialize an array of numbers
x=[150 231 630 901 402 345 660 890 200 101];
%Reference creation for the sum of the array.
sum=0;
%Global Reference creation for the average of the array 
average=0;
%Loop initialization
for i=1:1:length(x)
    %everytime the loop executes sum variable is updated
    sum=sum+x(i);
    %average is also updated on each iteration
    average=sum/length(x);
end
%At the end of the program we display the result.
disp(average);
