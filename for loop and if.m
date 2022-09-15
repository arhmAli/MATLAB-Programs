a=[1,2,3,4];
b=[2,3,4,5];
c=[a,b];
e=1;
f=3;
d=9;
k=0;
M=0;
for i=1:d
    for L=1:2
     M(i,L)=i+L;
    end
end
if a(1)+b(1)==4
    a(1)=5;
else
    a(1)=10
end

