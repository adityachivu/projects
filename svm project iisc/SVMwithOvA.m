function [model] = SVMwithOvA(X, y)
%   multiclassSVM uses random 2-D data X to test and understand
%   libsvm train and predict function
%
%   X is Mx2 matrix. Y is matrix of labels
%

%   Load the data from data.mat
%load('data.mat');

%   Useful constants
m = size(X,1);
k = range(y) + 1;

%   Plot the Examples.
plotData(X, y);

%   Train using libsvm. -s for type of model. -t for type of kernel.
%   Use README in libsvm folder for help.
%   Here, One vs All classifier trained for each label present.

for i = 1:k

    binary_label = (y == i);
    binary_label = binary_label .* ones(size(binary_label));
    model = svmtrain(binary_label, X, '-s 0 -t 2 -b 1');
    
    %   Save in array of models.
    model(i) = temp_model;
    %   Plot the boundary between class(i) and remaining examples.
    
    customVisualize(X, binary_label, model(i));
    
    %   Program paused.
    fprintf("\nPress Enter to continue.\n");
    pause;
    
end

%   Program paused.
fprintf("\nPress Enter to continue.\n");
pause;


end
