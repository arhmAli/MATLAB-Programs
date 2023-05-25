% DC motor parameters
Jm = 1.3e-2; % kg*m^2
b = 0.01 - 0.03*Jm; % N*m*s/rad
Ra = 0.3 - 0.5; % ohms
kt = 0.068; % V*s/rad
ke = kt;
La = 0.1 - 0.01; % H

% Transfer function of the system
s = tf('s');
G = kt/(s*(Jm*s+b)*(La*s+Ra)+kt*ke);

% Design PID controller
Kp = 0.4; % Proportional gain
Ki = 40; % Integral gain
Kd = 0.01; % Derivative gain
C_pid = pid(Kp,Ki,Kd);

% PI controller
Kp = 0.2;
Ki = 40;
C_pi = pid(Kp,Ki);

% PD controller
Kp = 0.5;
Kd = 0.025;
C_pd = pid(Kp,[],Kd);

% Step response with reference input
figure;
subplot(2,2,1);
step(G*C_pid);
title('Step Response with PID Control');

subplot(2,2,2);
step(G*C_pi);
title('Step Response with PI Control');

subplot(2,2,3);
step(G*C_pd);
title('Step Response with PD Control');

% Step response with disturbance input
dist = tf([1],[1 10]);
sys_cl_pid = feedback(C_pid*G,dist);
sys_cl_pi = feedback(C_pi*G,dist);
sys_cl_pd = feedback(C_pd*G,dist);

subplot(2,2,4);
step(sys_cl_pid, sys_cl_pi, sys_cl_pd);
title('Step Response with Disturbance');
legend('PID', 'PI', 'PD');
