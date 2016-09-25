function [freq] = hist(X)

%
%

[m, n] = size(X);


freq = zeros(m,252);
for i = 1:m
	for j = 1:n
		freq(i, X(i,j)+1)++;
	end
end

end
