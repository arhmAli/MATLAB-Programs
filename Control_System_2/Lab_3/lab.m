% SS system transformation Observabikity ananlysis full state feedback and observer design , MATLAB commands
% Magnetically suspended ball
% m=0.05
% k=0.0001
% L=0.01
% R=1
% g=9.8
% h=0.01
% I=7

A=[0 1 0;980 0 -2.8;0 0 -100];

B=[0;0;100];

C=[1 0 0];

D=0;

poles=eig(A)

fprintf("the value of poles is %d",poles)

% if one of the poles has real part then it is open loop sys
t=0:0.01:2;

%this u is for step input
% u=0.001*ones(size(t));
%this u is for no input
u=zeros(size(t));
x0=[0.01 0 0];
sys=ss(A,B,C,D);
 [y,t,x]=lsim(sys,u,t,x0);
% lsim is used to get response 
plot(t,y)
% controllabity and observability
Pc=ctrb(A,B);
Po=obsv(A,C);
rankpc=det(Pc);
rankpo=det(Po);

% L=>observer gain
% K=>controller gain

op1=-100;
op2=-10i;
op3=-102;
% sys=ss(A,B,C,D);
L=place(A',C',[op1 op2 op3])';
p1=-20+20i;
p2=-20-20i;
p3=-100;
K=place(A,B,[p1 p2 p3]);
Nbar=rscale(sys,K)
t=0:0.001:2
x0=[1; 0; 2.5]
At= [(A-B*K)        (B*K)
    zeros(size(A))   A-L*C]

Bt=[B*Nbar
    zeros(size(B))]
Ct=[C  zeros(size(C))]
sys=ss(At,Bt,Ct,0)
% [y,t,x0]=lsim(sys,zeros(size(t)),t,[x0 x0]);
% 
%  title("Linear simulation results with observer")
%  xlabel("time")
%  ylabel("ball position")
%  axis([0 2 -4E-6 0])

 t=0:1E-6:0.1;
x0=[0.01 0.5 -5];
[y,t,x]=lsim(sys,zeros(size(t)),t,[x0 x0])
n=3;
e=x(:,n+1:end);
x=x(:,1:n);
x_est=x-e

h=x(:,1); h_dot=x(:,2);i=x(:,3);
h_est=x_est(:,1); h_dot_est=x_est(:,2);i_est=x_est(:,3);
plot(t,h,'-r',t,h_est,':r',t,h_dot,'-b',t,h_dot_est,':b',t,i,'-g',t,i_est,':g')
legend('h','h_[est]','hdot','hdot_[est]','i','i_[est]')
xlabel=("time (sec")
% Given system matrices
A = [0 1 0; 980 0 -2.8; 0 0 -100];
B = [0; 0; 100];
C = [1 0 0];
D = 0;

% Convert to transfer function (TF) form
[numerator, denominator] = ss2tf(A, B, C, D);

% Display the numerator and denominator of the TF
fprintf('Numerator Coefficients (B): ');
disp(numerator);
fprintf('Denominator Coefficients (A): ');
disp(denominator);

% Observer Canonical Form Transformation
syms s;  % Define the Laplace variable s
[A_obs, B_obs, C_obs, D_obs] = tf2ss(numerator, denominator);

% Display the transformed matrices for observer canonical form
fprintf('Observer Canonical Form Matrices:\n');
fprintf('A_obs:\n');
disp(A_obs);
fprintf('B_obs:\n');
disp(C_obs);
fprintf('C_obs:\n');
disp(B_obs);
fprintf('D_obs:\n');
disp(D_obs);

% A_obs = [0 1 0; 0 0 1; -102 -10 -100];
% B_obs = [0; 0; 1];
% C_obs = [1 0 0];
% D_obs = 0;


% Observer Canonical Form Transformation
observer_poles = [-100, -10i, -60];
B_obs=C'
C_obs=B'
L_obs = place(A_obs', B_obs,C_obs)';
control_poles = [-100;31.3;-31.3];
K = place(A_obs, B_obs, [control_poles(1),control_poles(2),control_poles(3)]);
Nbar = -285;

D_cl = 0;

A_cl = [(A_obs - B_obs* K), (B_obs * K);
        zeros(size(A_obs)), (A_obs - L_obs * C_obs)];

B_cl = [B_obs * Nbar;
        zeros(size(B_obs))];

C_cl = [C_obs, zeros(size(C_obs))];

sys_cl = ss(A_cl, B_cl, C_cl, D_cl);

t = 0:0.01:5; 
x0 = [0.01; 0; 0]; % Initial state vector

[y, t, x] = lsim(sys_cl, u, t, x0);

% Plot the response
subplot(3, 1, 1);
plot(t, y(:, 1));
title('Output h');
xlabel('Time (sec)');
ylabel('h');

subplot(3, 1, 2);
plot(t, y(:, 2));
title('Output h_dot');
xlabel('Time (sec)');
ylabel('h_dot');

subplot(3, 1, 3);
plot(t, y(:, 3));
title('Output i');
xlabel('Time (sec)');
ylabel('i');
