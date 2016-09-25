

load('data.mat');

train_samp = X(1:2:5000,:)';
test_samp = X(2:2:5000,:)';

train_y = y(1:2:5000,1);
test_y = y(2:2:5000,1);

printf('read database\n');
train_samp1 = train_samp;
train_y1 = train_y;
test_samp1 = test_samp;
test_y1 = test_y;

No_of_training_images = size(train_samp,2);
No_of_test_images = size(test_samp,2);
no_of_classes = 10;

No_of_PC = 32;

%%%%%%%%%%%%%%%%%%%%% PCA

dim_red_samp = do_pca2(train_samp1, No_of_PC);
[M,P,X1] = do_pca2(train_samp1,No_of_PC);


%%%%%%%%%%%%%%%%%%%%%%%  Training
X1 = X1';

X = [ones(No_of_training_images, 1) X1]';

T = zeros(no_of_classes, No_of_training_images);       
for i=1:No_of_training_images
   T(train_y1(i),i) = 1; 
  end;

Ps_inv = pinv(X);

%Ps_inv = inv(X*X')*X;

WeightMat = (Ps_inv' * T' )';


%%%%%%%%%%%%%%%%%%%%%%%%% Testing

pro_test = zeros(No_of_PC,No_of_training_images);

    Average_Matrix = (ones(No_of_test_images,1)*M')';   
    t1 = double(test_samp)-Average_Matrix;
    Pro_test=P'*double(t1); 

t2 = WeightMat(:, 2:end) * Pro_test;
t3 = (ones(No_of_test_images,1)*WeightMat(:,1)')';
Cl_output =  t2 + t3;



for i = 1 : No_of_test_images
	temp = find(Cl_output(:,i)==max(Cl_output(:,i)));
	Out_Class(i,1) = temp;
end;

Rec_rate =  sum(Out_Class(:,1)== test_y1)*100/No_of_test_images;




