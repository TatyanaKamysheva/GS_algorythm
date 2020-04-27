% Control of agent positions within the search space boundaries
% X - position of the agents
% borders - the borders of the search space
function X = spaceBound(X, borders)
up = borders(:, 1)';
low = borders(:, 2)';
[N,dim]=size(X);
for i=1:N 
     %Agents that go out of the search space, are reinitialized randomly.
    Tp=X(i,:)>up; Tm=X(i,:)<low;
    X(i,:)=X(i,:).*(Tp&Tm)+(rand(1,dim).*(up-low)+low).*(~(Tp&Tm));
end
end