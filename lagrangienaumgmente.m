function [flag, x] = lagrangienaugmente( f, x0, lambda0, nu, alpha, beta, epsilon, tau )
% NEWTON Determine min f(x) pour x dans R^n
% [T, X] = NEWTON( F, X0 )
% PARAMETRES
%   f: fonction a minimiser
%   x0: point de depart de la minimisation
% SORTIE
%   t: nombre d'iterations
%   x: point solution

% t = ordre si solution trouvee et -1 si nbIterations atteints

t = -1;
% nb iterations apres lesqulles on s'arrete
nbIter = 1000;

x = x0;

var = sym('x', [length(x) 1]);

grad = gradient(f, var);
g = eval(subs(grad, var, x));
hess = hessian(f, var);
H = eval(subs(hess, var, x));

k = 0;

epsilon = 1/10^6;

continuer = true;
while continuer




end
end
