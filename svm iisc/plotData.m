function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.
%
% Note: This was slightly modified such that it expects y = 1 or y = 0

% Find Indices of Positive and Negative Examples
type1 = find(y == 1);
type2 = find(y == 2);
type3 = find(y == 3);
type4 = find(y == 4);

% Plot Examples
plot(X(type1, 1), X(type1, 2), 'k+','LineWidth', 1, 'MarkerSize', 7)
hold on;
plot(X(type2, 1), X(type2, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
plot(X(type3, 1), X(type3, 2), 'ks', 'MarkerFaceColor', 'r', 'MarkerSize', 7)
plot(X(type4, 1), X(type4, 2), 'kd', 'MarkerFaceColor', 'b', 'MarkerSize', 7)
hold off;

end
