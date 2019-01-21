function [flag, x] = newton( f, x0 )
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
    % Calcul de d
    d = - H \ g;
    % Mise a jour des variables
    old_x = x;
    x = x+d;
    g = eval(subs(grad, var, x));
    H = eval(subs(hess, var, x));
    k = k+1;
    t = k;

    c = num2cell(x);
    old_c = num2cell(old_x);

    %condition d'arret 1
  	if norm(g) > eps(g + epsilon)
  		flag =1;
  		continuer = false;
  	end
  	%condition d'arret 2
  	if norm(x-old_x) > eps(norm(old_x) + epsilon);
  		flag =2;
  		continuer = false;
  	end
  	%condition d'arret 3
  	if norm(f(c{:})-f(old_c{:})) > eps(abs(f(old_c{:}) + epsilon));
  		flag =3;
  		continuer = false;
  	end
  	%condition d'arret 4
  	if k >= nbIter
  		flag =4;
  		continuer = false;
  	end
end

end
