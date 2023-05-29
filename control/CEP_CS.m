s = tf('s');
Jm = 0.017;
b = 0.002;
Ra = 0.3;
Kt = 0.068;
G = 1 / (Jm*s^2 + b*s + Kt*Ra);
% Define transfer function
Jm = 1.7e-2;    % moment of inertia
b = 0.02;       % viscous damping coefficient
Ra = 0.3;       % armature resistance
kt = 0.068;     % torque constant
ke = 0.068;     % voltage constant
La = 0.05;      % armature inductance

s = tf('s');
P = kt/(Ra*La*s^2 + (Ra*b + La*ke)*s + (Ra*kt + La*ke*b));

% Calculate range of controller gains
OS = 20;        % maximum percent overshoot
Ts = 1;         % maximum settling time (2% criterion)

zeta = 0.7;     % choose suitable value of zeta for underdamped system

% Calculate required damping ratio and natural frequency
wn = 4/(zeta*Ts);
sigma = zeta*wn;
Kv = kt/(Ra*b + La*ke);

% Calculate range of proportional and derivative gains
Kp_min = (sigma^2*Jm)/(kt*zeta);
Kp_max = (Kp_min*OS)/(100 - OS);
Kd_min = (2*zeta*wn*Jm - b)/(kt);
Kd_max = (2*zeta*Ts*wn*Jm - b)/(kt);
Kp = (Kp_min + Kp_max)/2; % choose Kp near middle of range
Kd = (Kd_min + Kd_max)/2; % choose Kd near middle of range
Ki_min = (1/Kv)*Kp/10;
Ki_max = (1/Kv)*Kp/5;
% Display the range of gains
disp(['Kp range: ', num2str(Kp_min), ' to ', num2str(Kp_max)]);
disp(['Kd range: ', num2str(Kd_min), ' to ', num2str(Kd_max)]);
% Define the transfer function
Jm = 1.7e-2;
b = 0.02;
Ra = 0.3;
kt = 0.068;
ke = 0.068;
La = 0.05;
s = tf('s');
P_motor = kt / (Ra*Jm*s^2 + (b*Jm + Ra*ke)*s + (kt*ke));

% Define the PID controller
kp = 3.5;
ki = 0.4;
kd = 1.5;
C = pid(kp, ki, kd);

% Combine the transfer function and the controller
T = feedback(C*P_motor,1);

% Plot the step response
step(T);

