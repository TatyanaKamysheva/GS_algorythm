% Calculating agent acceleration
% X-positions of agents on the i step
% M-mass of agents at the i step
% G is the gravitational constant of the i step
function A = calcAcceleration(X, M, G, max_it, iteration)
[N, dim] = size(X);
final_per = 2; %In the last iteration, only 2 percent of agents apply force to the others.

kbest = final_per + (1-iteration/max_it)*(100-final_per); 
kbest = round(N *kbest/100);
fprintf( 'Iteration: %d; K_best: %d\r\n', iteration,kbest);
[Ms ds]=sort(M,'descend');
    
for i = 1:N
    A(i,:) = zeros(1,dim);
    for ii = 1:kbest
        j = ds(ii);
        if j ~= i
            R = norm(X(i,:)-X(j,:)); %Euclidian distanse.
            for k = 1:dim
                A(i, k) = A(i, k) + rand*G*M(j)/(R + eps)*(X(j,k)-X(i,k));
            end
        end
    end
end
end