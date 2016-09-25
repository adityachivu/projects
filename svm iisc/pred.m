function [label] = pred(X, model)

distance = ones(model.totalSV, 1);
pre_summation = ones(size(model.sv_coef));
for i = 1:model.totalSV

    distance(i) = gaussianKernel(model.SVs(i, :)', X', model.Parameters(4));
    
end

for i = 1:model.totalSV

    pre_summation(i, :) = model.sv_coef(i, :) .* distance(i);
    
end

distance
pre_summation



end
