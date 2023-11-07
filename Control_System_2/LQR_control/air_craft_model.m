clc;
close all;
clear all;
clearvars;

% Aircraft model
A = [-0.313 56.7 0;
    -0.0139 -0.426 0;
    0 56.7 0];
B = [0.232; 0.0203; 0];
C = [0 0 1];
D=1;

% LQR Control Design
sys_ss = ss(A, B, C, D);
Q = C' * C;
Q(3,3) = 450;  % Increased weight on the output for better performance
R = 1;

K = lqr(A, B, Q, R);  % Calculate the LQR gain matrix

% Closed-loop system matrices
Ac = A - B * K;
Bc = B;
Cc = C;
Dc = 0;

% Simulation
sys_cl = ss(Ac, Bc, Cc, Dc);  % Closed-loop system

t = 0:0.01:5;  % Time span for simulation
r = 0.2 * ones(size(t));  % Step reference
Nbar=rscale(sys_ss,K);
sys_cl = ss(Ac, Bc*Nbar, Cc, Dc)
[y, t, x] = lsim(sys_cl, r, t);  % Simulate the response

% Plotting the results
figure;
plot(t, y, 'b', 'LineWidth', 2);
hold on;
plot(t, r, 'r--', 'LineWidth', 2);
title('LQR Control Response');
xlabel('Time (seconds)');
ylabel('Output and Input');
legend('Output', 'Input');