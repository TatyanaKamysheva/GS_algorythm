%calculate masses
function [M] = calcMass(fitness)
fit_max = max(fitness); 
fit_min = min(fitness);
m = (fitness - fit_min)./(fit_max -fit_min);
M = m./sum(m);
