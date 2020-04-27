% Space initialization
% N - the number of agents
% borders - an array of the bounds of space: borders(i) - I-dimension
% X-initial population of agents
function [X]=initSpace(N, borders)
up = borders(:, 1); down = borders(:, 2);
dim = size(up, 1);
X = zeros(N, dim);
for i=1:dim
    high=up(i); low=down(i);
    X(:,i) = rand(N,1).*(high-low)+low;
end
end