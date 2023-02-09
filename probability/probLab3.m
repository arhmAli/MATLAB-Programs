n=6;
sample=[];
for i=1:1:n
    sample(i)=i;
end
prob=1/length(sample);
fprintf("The sample space is: \n")
fprintf("%i \n",sample)
fprintf("The probablity of die with sample space is %f \n",prob)

%if intersection exist AuB=P(A)+P(B)
E=[];
j=5;
for i=1:1:j
E(i)=i;
end
k=[];
l=3;
for i=1:1:j
k(i)=i;
end
probE=(length(E)/length(sample));
probk=(length(k)/length(sample));
inter=intersect(E,k);
probInter=(length(inter)/length(sample));
un=union(E,k);
probun=(length(un)/length(sample));
if inter==0
    fprintf("intersection==0 so \n")
    prob=probE+probk
else
    fprintf("union")
    totalProb=probE+probk-probInter
end
