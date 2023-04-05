% Suppose that the average number of cars that pass through a busy intersection during a 1-minute interval is known to be 15. 
% We can use the Poisson distribution to model the number of cars that will pass through the intersection in a given minute.

lambda = 15;          % Poisson distribution parameter
k = 60;   % Number of samples to generate
%max_count = 30;       % Maximum count value for the histogram bins

poissonDist(lambda, k);


