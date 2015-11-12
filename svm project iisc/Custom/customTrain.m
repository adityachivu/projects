function [label] = customTrain(Y, X)
%   Use binary svmTrain for training
%   multi-class SVM. Create an array
%   models for each classifier.
%
%

%   Useful constants.
k = numel(unique(Y));
classifiers = (k * (k-1)) / 2;

for i = 1:labels

    for j = (i+1):labels

    
