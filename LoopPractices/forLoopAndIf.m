%in MATLAB we have to use two dim forloops i.e nested loop first controls
%row second controls columns
%using for and if statement convert a matrix to diagnal matrix


%putting a certain value on a(2,3) &a(3,1) else than that zero
n=1;
i=zeros(3);
for i=1:3
for j=1:3
    if i==2&j==3;
     a(i,j)=n;
    else if i==3 & j==1
        a(i,j)=n;
        else
            a(i,j)=0;
        end
    end    
end
end

disp(a)
