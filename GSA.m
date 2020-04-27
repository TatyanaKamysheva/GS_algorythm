%Gravitation search algorythm
%
%Input values:
%S - number of agents
%MAX_ITER - maximum number of iterations
%G0 - initial value of the gravitational constant
%func - objective function
%BOUND - table of search space restrictions
%
%Output values:
%BEST_FIT - the heaviest agent
%BEST_POSITION - coordinates of the heaviest agent
%
function [BEST_POSITION, BEST_FIT, I] = GSA(S, MAX_ITER, G0, func, BOUND)
G = G0;
BEST_FIT = NaN;
dim = size(BOUND, 2);   %dimension of space
BEST_POSITION(1, 1:dim) = NaN;
V = zeros(S, dim); %velocity
figure(1);
I=NaN;
X = initSpace(S, BOUND);    %Step 1: init positions of agents

for i=1:MAX_ITER
    disp(i);
    disp("X");
    disp(X);
    FIT = fitness(X, func);    % Step 2: calculate fitness
    disp("Fit");
    disp(FIT);
  
     [best, best_i] = max(FIT); % best fit on step i
    [BEST_FIT] = max(best, BEST_FIT);  % best fit in i steps
    if (BEST_FIT == best) 
        BEST_POSITION = X(best_i, :); % save best position
        I=i;
    end
   disp("Current best fit");
    disp(BEST_FIT);
     disp("Current best position");
    disp(BEST_POSITION);
    
    G = calcG(G, i);   %Step 3
    disp(G);
    MASS = calcMass(FIT); %Step 4
    disp(MASS);
    A = calcAcceleration(X, MASS, G); %Step 5
    disp(A);
    V = calcVelocity(A, V);
    disp(V);
    scatter(X(:,1), X(:,2), MASS*1000+10, FIT,'filled');
        colorbar     
        title(i);
        pause(5);
        
    X = position(X, V);   %Step 6
    X = spaceBound(X,BOUND);  
    disp(X);
 
end
end