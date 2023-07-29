% Generate a random dataset
data = randn(100,1);

% Calculate the variance
v = var(data);

% Plot a histogram of the data
histogram(data, 'Normalization', 'probability')
title(['Variance = ' num2str(v)])
