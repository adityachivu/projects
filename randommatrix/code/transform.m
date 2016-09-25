function [X_new] = transform(X)

for i = 1:5000
    T = reshape(X(i,:), 20, 20);
    for j = 1:19
        for k = 1:19
            Q(j,k) = T(j,k)*T(j,k+1)*T(j+1,k)*T(j+1,k+1);
        end
    end
    X_new(i,:) = Q(:);
end