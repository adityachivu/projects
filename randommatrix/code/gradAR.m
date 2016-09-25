function dJ = gradAR(Theta, y, X)
%
%	Function to calculate the cost of
%	Weights for SLP in recognition.
%
Theta = reshape(Theta, 19800, 25);
dJ = zeros(size(Theta));

[m n] = size(X);

temp = y - (X * Theta);
dJ = temp' * X;

dJ = (-1/m) * dJ;
dJ = dJ(:);
end
