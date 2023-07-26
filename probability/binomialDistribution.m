%Real World Problem.!!
% A company has 100 employees, and 30% of them smoke. 
% What is the probability that at least 40 employees smoke?

n = 100; % number of trials

p = 0.3; % probability of success

%k=40;       %Minimum number of employees that smoke!

[P,k] = binomial_dist(n, p); % calculate the probability mass function

k_min = 40; % minimum number of employees smoking

P_min = sum(P(k_min:end)); % probability of at least k_min employees smoking


h=bar(k_min, P_min); % plot the results
set(h, 'FaceColor', [0.212, 0, 0.255]);


xlabel('Number of Successes');
ylabel('Probability');
title(sprintf('Binomial Distribution (n=%d, p=%.2f)', n, p));
fprintf('The probability that at least %d employees smoke is %.4f\n', k_min, P_min);
