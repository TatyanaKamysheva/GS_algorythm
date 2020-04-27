%calculate Gravitation constant
%d - a free parameter of the algorithm, we define it as 0.5
function G = calcG(G0, iter)
d = 0.5; G = G0*(1/iter)^d;
end