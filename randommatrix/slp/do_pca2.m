function [mean_image,proj_matrix,feature_vecs] = do_pca2(input_vectors,No_of_PC)
% input_vectors is (MN X P) matrix, where each column corresponds to an
% image of dimension (MXN) and P is number of images.
X = input_vectors;
mean_image = mean(X,2);
sz = size(X);

for i = 1: size(X,2)
    X(:,i) = X(:,i)-mean_image;
end;
Covar = 1/(sz(1)*sz(2))* X'*X;
%Covar =  X'*X;

[Evec,Eval] =  eig(Covar);

Eval = diag(Eval);

[Eval,ind] = sort(Eval,'descend'); 
Evec = Evec(:,ind);

Eval = Eval(1:No_of_PC,1);
Evec = Evec(:,1:No_of_PC);

Temp1 = X * Evec;

Eigen_space = zeros(size(Temp1));

for i = 1: No_of_PC    
    Eigen_space(:,i) = Temp1(:,i)/sqrt(sum(Temp1(:,i).*Temp1(:,i)));    
end;

feature_vecs = X'*Eigen_space;
feature_vecs = feature_vecs';
proj_matrix  = Eigen_space;
