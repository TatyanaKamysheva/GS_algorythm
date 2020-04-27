% Agent rating
% X-positions of agents on the i-th step
% func - the objective function
function fitness = fitness(X, func)
N =size(X,1);
fitness = zeros(N, 1);
for i=1:N
    fitness(i)= func(X(i,:));
end
end