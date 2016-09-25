function [J dJ] = costAR(Theta, y, X)
%
%	Function to calculate the cost of
%	Weights for SLP in recognition.
%
Theta = reshape(Theta, 19800, 25);
J = 0;
dJ = zeros(size(Theta));


[m n] = size(X);

D = y - (X * Theta);

J = 0.5 * sum(sum(D .* D));
J = J/m;

dJ = -1 * D' * X;
dJ = dJ/m;

dJ = dJ(:);

end
