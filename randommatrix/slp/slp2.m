%	Script to Train and predict MNIST dataset.
%
%
%
%

load('data.mat');

%	Learn weights for SLP network.
W = slptrain(X, y, 40);

