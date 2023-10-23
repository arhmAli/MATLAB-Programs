% Define the values of n
n = -5:5;

% Initialize the unit step function
u_n = zeros(size(n));

% Set u[n] to 1 for n >= 0
u_n(n >= 0) = 1;

% Calculate the even and odd parts
even_n = 0.5 * (u_n + flip(u_n)); % Even part
odd_n = 0.5 * (u_n - flip(u_n));  % Odd part

% Plot the original unit step function
subplot(3,1,1)
stem(n, u_n, 'filled')
grid on
title('Unit Step Function u[n]')
xlabel('n')
ylabel('u[n]')

% Plot the even part
subplot(3,1,2)
stem(n, even_n, 'filled', 'r')
grid on
title('Even Part of u[n]')
xlabel('n')
ylabel('Even[u[n]]')

% Plot the odd part
subplot(3,1,3)
stem(n, odd_n, 'filled', 'b')
grid on
title('Odd Part of u[n]')
xlabel('n')
ylabel('Odd[u[n]]')
