function [P,k] = binomial_dist(n, p)
% BINOMIAL_DIST calculates the probability mass function for a binomial distribution
% with parameters n and p.
% Inputs:
%   - n: the number of trials
%   - p: the probability of success in each trial
%
% Outputs:
%   - P: the probability mass function for the binomial distribution
%   - k: the number of successes (0 to n) in each trial

k = 0:n; % possible number of successes
P = zeros(1, n+1); % initialize probability mass function

for i = 0:n
   P(i+1) = prod(1:i)/prod(1:(n-i)) * p^i * (1-p)^(n-i);
    % P(i+1) = nchoosek(n,i) * p^i * (1-p)^(n-i); % calculate probability mass function
end

end
