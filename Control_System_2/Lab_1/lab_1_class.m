A=[0 0 -4;1 0 -11;0 1 -6];
B=[5;1;2];
C=[0 0 1];
 D=[0];
x0=[0.01 0 0];
poles=eig(A);
%real part should be on left side===>stable system
p1=poles(1,1);
p2=poles(2);
p3=poles(3);
t=0:0.01:150;
u=zeros(size(t));
% sys=ss(A,B,C,D);
K=acker(A,B,[p1 p2 p3]);
sys_cl=ss(A-B*K,B,C,D);
[y,t,x]=lsim(sys_cl,u,t,x0);
plot(t,y)
cntrl=rank(ctrb(sys_cl));
fprintf("The rank of the controlled matrix is %d",cntrl)


