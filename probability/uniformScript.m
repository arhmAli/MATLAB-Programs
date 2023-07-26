% Generate a uniform distribution with range [0, 10] and 1000 samples
data = uniform_distribution(0, 10, 1000);

% Plot the distribution
histogram(data, 'Normalization', 'pdf');
xlabel('Value');
ylabel('Probability Density');
title('Uniform Distribution');
