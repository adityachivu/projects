function dJ = gradAR(Theta, y, X)
%
%	Function to calculate the cost of
%	Weights for SLP in recognition.
%
Theta = reshape(Theta, 19800, 25);
dJ = 0;

[m n] = size(X);

D = y - (X * Theta);

for k = 1: size(Theta,1)  % For each output
    
 for i = 1: size(Theta,2)   
    dJ(i) = (1/m) * (D(:,i)'* X(:,i));
     %dJ = (1/m) * (X' * D);
     
     grad(i) = sum(D.*X(:,i))/m;
 end;
end;
%dJ = (1/m) * (X' * D);
dJ = dJ(:);
end
