n=6;
sample=[];
for i=1:1:n
    sample(i)=i;
end
prob=1/length(sample);
fprintf("The sample space is: \n")
fprintf("%i \n",sample)
fprintf("The probablity of die with sample space is %f \n",prob)
