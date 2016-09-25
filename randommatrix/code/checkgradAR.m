function dif = checkgradAR(Theta, J)
%
%	Function to calculate the cost of
%	Weights for SLP in recognition.
%
e = 1.0e-4;
dif = zeros(size(Theta));
perturb = zeros(size(Theta));


for i = 1:numel(Theta)
	perturb(i) = e;
	L1 = J(Theta + perturb);
	L2 = J(Theta - perturb);
	dif(i) = (L1 - L2)/(2*e);
	perturb(i) = 0;
end


end
