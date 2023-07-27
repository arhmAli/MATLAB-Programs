% Commonly a car cooling system are controlled by electrically fan.
% Assuming that life time "T"(in hours) of a fan manufactured by a company 
% A,B,C can be modeled an expoenential distribution lambda=0.0003. Find the 
% probability of fan which will give at least 10,000 hours service.

% Define the lambda value
lambda = 0.0003;

hours = 10000;

% Calculate the probability of fan which will give at least min_service_hours
prob = exp(-lambda*hours);

fprintf('The probability of a fan giving at least %d hours of service is: %.4f\n', hours, prob);

% Array of lambda 
lambda_array = [0.0001, 0.0002, 0.0003, 0.0004, 0.0005];

% Define an array of service hour values
service_hours = 0:1:10000;
% Plot the probability of service hours for different values of lambda
figure;
hold on;
for i = 1:length(lambda_array)
    lambda_i = lambda_array(i);
    prob_i = exp(-lambda_i*service_hours);
    plot(service_hours, prob_i, 'DisplayName', sprintf('\\lambda = %.4f', lambda_i));
end
xlabel('Service Hours');
ylabel('Probability');
title('Probability of Fan Service Hours for Different \\lambda Values');
legend('show');
hold off;

% Calculate and display the variance of the exponential distribution
variance = 1/lambda^2;
fprintf('The variance of the exponential distribution with \\lambda = %.4f is: %.4f\n', lambda, variance);
%PDF
pdf = lambda*exp(-lambda*hours);
fprintf('The PDF of the exponential distribution with \\lambda = %.4f is: %.4f\n', lambda, pdf);

%CDF
cdf = 1 - exp(-lambda*hours);
fprintf('The CDF of the exponential distribution with \\lambda = %.4f is: %.4f\n', lambda, cdf);

























