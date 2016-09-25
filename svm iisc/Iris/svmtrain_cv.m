function [model] = svmtrain_cv(Y, X)
%This program trains C-SVM for IRIS dataset using SVMs
%   and optimises relevant parameters for highest accuracy.
%
%


%   Useful constants.
m = size(X, 1);
n = size(X, 2);
k = range(Y) + 1;

%   Split data into train and test set.

numTrain = (2*m) / 3;
numTest = m - numTrain;
idx = randperm(m);

X_train = X(idx(1:numTrain)');      %   TRAIN
Y_train = Y(idx(1:numTrain)');      %

X_test = X(idx((numTrain+1):m)');   %   TEST
Y_test = Y(idx((numTrain+1):m)');   %


%   Meshgrid to generate square matrix with all combinations of C and gamma.
[C, gamm] = meshgrid(-5:15, -15:3);

%   Array for storing cross validation accuracies for multiple C and gamma.
crossvalid_acc = zeros(numel(C), 1);

%%%%%%X = zscore(X);

for i = 1:numel(C)

    crossvalid_acc(i) = svmtrain( Y, X, sprintf('-s 0 -t 2 -c %f -g %f -v 5 -q', 2^C(i), 2^gamm(i)));

end

%   Save the best value for C and gamma.
[~, id] = max(crossvalid_acc);
optimum_C = 2.^C(id);
optimum_gamma = 2.^gamm(id);
max_accuracy = crossvalid_acc(id);

%   Display results.
fprintf("\nBest C = %f\nBest gamma = %f\nBest Accuracy = %f\n", optimum_C, optimum_gamma, max_accuracy);

%   Now train with best values.
model = svmtrain(Y, X, sprintf('-s 0 -t 2 -c %f -g %f -b 1 -q', optimum_C, optimum_gamma));


end
