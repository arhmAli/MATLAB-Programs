% Arham Khan (15/09/22)
% Calculates the angular position, velocity, and acceleration of a simple
% pendulum as a function of time.  Also calculates the tension in the rod.
clear all; close all; clc;

% All units in the SI system
m=1; % pendulum bob mass in kg
l=2; % pendulum rod length in meter
g=9.81; % acceleration due to gravity
t=10; % simulation time
c=0.25; % damping coefficient
tStep=0.01; % simulation time step
iterations=t/tStep; % total number of iterations
t=0:iterations; % time vector (for plotting)
% pre-allocation of variables for speed
theta=zeros(iterations,1);
omega=zeros(iterations,1);
alpha=zeros(iterations,1);
T=zeros(iterations,1);
theta(1,:)=pi/2; % initial angular position
omega(1,:)=0; % initial angular velocity
alpha(1,:)=0; % initial angular acceleration

for n=1:iterations
    % Iteratively solve equations of motion using Euler's Method
    theta(n+1,:)=theta(n,:)+omega(n,:)*tStep; % new angular position
    omega(n+1,:)=omega(n,:)+alpha(n,:)*tStep; % new angular velocity
    alpha(n+1,:)=(-g*sin(theta(n+1,:)))/l-c*omega(n+1,:); % new angular acceleration
    
    T(n+1,:)=m*g*cos(theta(n+1,:))+m*l*(omega(n+1,:)).^2; % tension in cable
end

% Plot angular position, velocity, and acceleration
figure;
subplot(3,1,1);
plot(t,theta'.*(180/pi),'b.');
ylabel('Theta (°)');
title('Angular Quantities as a Function of Time');
subplot(3,1,2);
plot(t,omega','g.');
ylabel('Omega (rad/s)');
subplot(3,1,3);
plot(t,alpha','r.');
ylabel('Alpha (rad/s^2)');
xlabel('Iteration');

% Plot tension in rod
figure; hold on;
plot(t,T','c.');
plot(t,m*g,'k.');
xlabel('Iteration');
ylabel('Tension (N)');
title('Tension in Pendulum Rod as a Function of Time');

