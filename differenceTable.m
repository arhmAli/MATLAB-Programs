clearvars;
clc;
xValues=[-2:1:4];
yValues=[15 1 2 -3 4 81 93];
len=length(xValues);
% M=zeros(n,n+1);
H(:,1)=xValues;
H(:,2)=yValues;
for j=3:len+1
    for i=1:len-j+2
        H(i,j)= H(i+1,j-1)-H(i,j-1);
    end
end
H