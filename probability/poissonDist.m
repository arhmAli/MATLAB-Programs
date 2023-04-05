function poisson= poissonDist(lambda, n)
   k = 0:n-1;

  
% Calculate the Poisson distribution using the formula
poisson = (lambda.^k .* exp(-lambda)) ./ factorial(k);

% Plot the results
bar(k, poisson);
xlabel('Number of Events');
ylabel('Probability');
title('Poisson Distribution');
    end

