function [data] = uniform_distribution(a, b, n)
% Generates a uniform distribution with the specified range [a, b]
% and number of samples n.

data = a + (b - a) * rand(n, 1);

end
