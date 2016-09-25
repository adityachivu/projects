clear;
clc

iter = 10;

for i = 1:10
	trainAR;
	iter += 10;
end

plot(1:100:10, cost_rand_after, cost_custom_after );