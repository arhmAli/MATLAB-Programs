function p = exponentialProb(lambda, x)
% This function calculates the probability that an event occurs in an
% interval of time x, given a rate parameter lambda for the exponential
% distribution.

%Atleast case
p = exp(-lambda * x);

end
