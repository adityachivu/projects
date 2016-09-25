


 load('dataAR.mat')
no_of_classes = 25;
index_mat = [1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2];


index_mat_new = repmat(index_mat,1,no_of_classes);

 
Train_ind = find(index_mat_new==1);
Test_ind = find(index_mat_new ==2);

train_samp_per_class = sum(index_mat==1);%size(index_mat,2)/2;



train_samp = modreg_img_cls(:,Train_ind);
test_samp = modreg_img_cls(:,Train_ind);

train_y = y(1,Train_ind);
test_y = y(1,Train_ind);

%printf('read database');
X = train_samp';
y = train_y;
% test_samp1 = test_samp;
% test_y1 = test_y;

No_of_training_images = size(train_samp,2);
No_of_test_images = size(test_samp,2);


% load('dataAR.mat');
% X = modreg_img_cls(:,1:650)';

load('AR_database_weights_25classes_mu_point0001.mat');
Theta = weight_mat;

%Theta = rand(19800,25);

fprintf('\nsize of Input Matrix:\n');
[m n] = size(X);

Y = zeros(m, no_of_classes);

for i = 1:m
	Y(i, y(i)) = 1;
end

%%%	Pre-calculated weights
%J = costAR(Theta(:), Y, X);
%costFunction = @(p) costAR(p, Y, X);
%options = optimset('MaxIter', 50);
options = optimset('GradObj', 'on', 'MaxIter', iter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Try
 for i = 1: no_of_classes
     theta = Theta(:,i);
    %all_theta(i,:) = fmincg(@(t)(lrCostFunction(t, X, (y == i), lambda)), theta, options);
    cost_custom_before = costAR(theta, (y == i), X)
    [Final_theta(i,:), costiter] = gradientDescent(X, (y == i), theta, 0.00000001, 100);
    plot(1:1000, costiter);
    hold on;
    cost_custom_after = costAR(Final_theta(i,:)', (y == i), X)
 end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%Testing

output_custom_test = Final_theta*test_samp;



pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Theta = rand(19800, 25);
options = optimset('GradObj', 'on', 'MaxIter', iter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Try
 for i = 1: no_of_classes
     theta = Theta(:,i);
    %all_theta(i,:) = fmincg(@(t)(lrCostFunction(t, X, (y == i), lambda)), theta, options);
    cost_rand_before(iter/10) = costAR(theta, (y == i), X)
    Final_theta(i,:) = gradientDescent(X, (y == i), theta, 0.00000001, 100);
    cost_rand_after(iter/10) = costAR(Final_theta(i,:)', (y == i), X)
 end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%Testing

output_rand_test = Final_theta*test_samp;