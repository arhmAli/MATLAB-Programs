%representation of state space  
%magnetically suspended ball
m=0.05;
k=0.0001;
L=0.001;
r=1;
g=9.81;
h=0.01;
A=[0 1 0;980 0 -2.8;0 0 -100];
B=[0;0;100];
C=[1 0 0];
 D=[0];
poles=eig(A)
% if one of the poles has real part then it is open loop sys
t=0:0.01:2;

%this u is for step input
u=0.001*ones(size(t));
%this u is for no input
% u=zeros(size(t));
x0=[0.01 0 0];
sys=ss(A,B,C,D);
 % [y,t,x]=lsim(sys,u,t,x0);
% lsim is used to get response 
 % plot(t,y)
 % title("Open Loop response to non zero initial conditions")
%the plot shows system is unstable
% far from equilibrium point
cntrl=rank(ctrb(sys));
fprintf("The rank of the controlled matrix is %d",cntrl)

%The system is controlled if rank=order
% p1_prev=10+10i;
% p2_prev=10-10i;
% shift the pole 10x to the left so that system can be controlled or stable
% p3_prev=-50;

p1=-20+20i;
p2=-20-20i;
p3=-100;

%change the locations of the poles to make the system stable i.e
%this will make the response fast and there will be no time to go 
%that much height for the overshoot

% K=place(A,B,[p1 p2 p3]);
K=acker(A,B,[p1 p2 p3]);
sys_cl=ss(A-B*K,B,C,D);
% lsim(sys_cl,u,t);
%  title("Closed Loop response to some step input u(t)")
%  xlabel("time")
%  ylabel("ball position")
%  axis([0 2 -4E-6 0])
 % title("Closed Loop response to non zero initial conditions")

 %If i want two or point at same pos place will not work "acker" will be
 %used
 % Now we have to scale the input
 % Nbar=rescale(sys,K)
 Nbar=-285.7143;
 lsim(sys_cl,Nbar*u,t);
 title("linear simulation result for Nbar")
 xlabel("time")
 ylabel("ball position")
 axis([0 2 0 1.2*10^-3 ])

 