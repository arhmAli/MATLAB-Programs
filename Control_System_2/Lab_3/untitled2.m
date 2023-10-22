clc;
close all;
clear all;
clearvars;
%% parameter values
% m=0.05;
% k=0.0001;
% L=0.01;
% R=1;
% g=9.8;
% h=0.01;
% I=7;
%% solution
A=[0 1 0;980 0 -2.8;0 0 -100];
B=[0;0;100];
C=[1 0 0];
%% Analyze the stability of system response
poles=eig(A)
t=0:0.01:2;
u=zeros(size(t));
x0=[0.01 0 0];
sys=ss(A,B,C,0);
[y,t,x0]=lsim(sys,u,t,x0);
plot(t,y)%unstable system
%% To analyze the controllabilty and observability
pc=ctrb(A,B)%to check the controllability
po=obsv(A,C)%to check the observability
rank_pc=det(pc)
rank_po=det(po)
%% To design observer
%observer poles
op1=-100;
op2=-10;
op3=-102;
L=place(A',C',[op1 op2 op3])'
p1=-20 + 20i;
p2=-20 - 20i;
p3=-100;
% sys_cl=ss(A-B*k,B,C,0);
K=place(A,B,[p1 p2 p3])
Nbar=rscale(sys,K)
%Observability matrix
At=[(A-B*K) (B*K);zeros(size(A)) (A-L*C)];
Bt=[B*Nbar; zeors(size(B))];
Ct=[C zeros(size(C))]; 
sys=ss(At,Bt,Ct,0);
lsim(sys,zeros(size(t)),t,[x0 x0])
t=0:1E-6:0.1;
x0=[0.01 0.5 -5];
[y,t,x]=lsim(sys,zeros(size(t)),t,[x0 x0]);
n=3;
e=x(:,n+1:end)
x=x(:,1:n);
x_est=x-e;
h=x(:,1);h_dot=x(:,2);i=x(:,3);
h_est=x_est(:,1);h_dot_est=x_est(:,2);i_est=x_est(:,3);
plot(t,h,'-r',t,h_est,':r',t,h_dot,'-b',t,h_dot_est,':b',t,i,'-g',t,i_est,':g')
legend('h','h_est','h_dot','h_dot_est','i','i_est')
%% response with and without feedback and observer 
figure
[b,a]=ss2tf(A,B,C,0);
G=tf(b,a);
step(G);
figure
[b,a]=ss2tf(At,Bt,Ct,0);
G1=tf(b,a);
stepinfo(G1)
step(G1)