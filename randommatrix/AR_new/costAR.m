function [J dJ] = costAR(Theta, y, X)
%
%	Function to calculate the cost of
%	Weights for SLP in recognition.
%
%Theta = reshape(Theta, 19800, 25);
J = 0;

[m n] = size(X);

D = y' - (X * Theta);
J = (0.5/m) * sum(sum(D .* D));

%dJ = gradAR(Theta, y, X);
%for i = 1: size(Theta)   
    %dJ(i) = (1/m) * (D(:,i)'* X(:,i));
     %dJ = (1/m) * (X' * D);     
%     dJ(i,1) = (-1 * sum(D.*X(:,i)))/m;
% end;
 
dJ = (-1/m) * (X' * D);
dJ = dJ(:);
end
