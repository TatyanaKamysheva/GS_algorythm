% Calculating agent acceleration
% X-positions of agents on the i step
% M-mass of agents at the i step
% G is the gravitational constant of the i step
function A = calcAcceleration(X, M, G)
[N, dim] = size(X);
A = zeros(N,dim);
for i = 1:N
    for j = 1:N
        if i ~= j
            R = norm(X(i,:)-X(j,:)); %Euclidian distanse.
            for k = 1:dim
                A(i, k) = A(i, k) + rand*G*M(j)/(R + eps)*(X(j,k)-X(i,k));
            end
        end
    end
end
end