%=======================================================%
clear all;clc;
train_set=importdata('train.m');
test_set=importdata('test.m');
train_set = train_set/max(max(train_set));
test_set = test_set/max(max(test_set));
train_class=importdata('train_class.m');
test_class=importdata('test_class.m');
%name model: WW,    CS,    LLW,   MSVM2:default
% -k 2 is type of model
%-p is standard deviation
% -c is constant and always 10
%-cv is folding for cross validation
model=trainmsvm(train_set,train_class, '-m CS -k 2 -p 1 -c 10 ');
[train_labels,train_outputs]=predmsvm(model,train_set,train_class);
[test_labels,test_outputs]=predmsvm(model,test_set,test_class);

train_errorRate = mean(train_labels ~= train_class);
test_errorRate = mean(test_labels ~= test_class);
count1=0;count2=0;
for i=1:size(train_class,1)
   if train_labels(i)== train_class(i)
       count1=count1+1;
   end
end
classify_per=(count1*100)/size(train_set,1);
fprintf('correctly classified patterns: %d out of %d\terror rate =%d\t Classification percentage=%.2f percent\n',count1, size(train_set,1),train_errorRate,classify_per);

for i=1:size(test_class,1)
   if test_labels(i)== test_class(i)
       count2=count2+1;
   end
end
rec_per=(count2*100)/size(test_set,1);
fprintf('correctly recognized patterns: %d out of %d\terror rate =%d\t Recognition Percentage=%.2f percent\n', count2, size(test_set,1),test_errorRate,rec_per);
save('test_given_input.txt','test_set','-ascii');
save('test_given_output.txt','test_class','-ascii');

