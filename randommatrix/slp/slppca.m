function W = slptrain(X, y, K)

%
%
%	Perfrom PCA on MNIST dataset and train using Single Layer Perceptron.
%


%	Useful variables.
[m, n] = size(X);

%	Identify Principal Components using SVD
Sigma = (1/m) * X' * X;
[U, S, V] = svd(Sigma);

%	Retain top K components
U_reduce = U(:, 1:K);
Z = X * U_reduce;

%	Use pseudo-inverse to learn weights of SLP network.
W = y * pinv(Z);

%	END
