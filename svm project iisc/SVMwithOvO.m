function [model] = SVMwithOvO(X, y)
%   multiclassSVM uses random 2-D data X to test and understand
%   libsvm train and predict function
%
%   X is Mx2 matrix. Y is matrix of labels
%

%   Load the data from data.mat
%load('data.mat');

%   Plot the Examples.
plotData(X, y);

%   Train using libsvm. -s for type of model. -t for type of kernel. Use README in libsvm folder for help.

model = svmtrain(y, X, '-s 0 -t 2 -b 1');

%   Program paused.
fprintf("\nPress Enter to continue.");
pause;

%   Visualize the boundary.
customVisualize(X, y, model);

end
