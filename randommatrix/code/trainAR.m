%
%
%
%
%

load('dataAR.mat');
X = modreg_img_cls(:,1:650)';

load('weightsAR25.mat');
Theta = weight_mat;
[m n] = size(X);


Y = zeros(m, 25);
for i = 1:m
	Y(i, y(i)) = 1;
end

%
%
%	PRE-CALCULATED WEIGHTS.
%
%

%	Weight matrix should be made linear for being used in fmincg optmisation.
Weight = Theta(:);

%	costFunction and parameters for fmincg must are set.
costFunction = @(p) costAR(p, Y, X);
options = optimset('MaxIter', 100);

[J dJ] = costAR(Weight, Y, X);
num_dJ = checkgradAR(Weight, costFunction);
dif = dJ - num_dJ
%	fmincg is used to generate final Weight matrix after SGD. 
%	manual for fmincg can be accessed with help command
[Weight, cost] = fmincg(costFunction, Theta(:), options);

%	Weight matrix must be reshaped after as output of fmincg is a vector.
printf('\n\nCost after using pre-calculated weights:\n');
[J dJ] = costAR(Theta(:), Y, X);
printf(J);

%
%
%	RANDOMLY INITIALIZED WEIGHTS.
%
%

%	Randomly generate weight matrix for the network.
Theta = rand(19800, 25);
Weight = Theta(:);
%	Remainder procedure is exactly the same as above.

[J dJ] = costAR(Weight, Y, X);
num_dJ = checkgradAR(Weight, costFunction);
dif = dJ - num_dJ

[Weight, cost] = fmincg(costFunction, Weight, options);


printf('\n\nCost after using random weights:\n');
[J dJ] = costAR(Weight, Y, X);
num_dJ = checkgradAR(Weight, costFunction);
dif = dJ - num_dJ
printf(J);