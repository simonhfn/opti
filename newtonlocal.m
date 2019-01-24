%% Algorithme de Newton Local
% en entree la fonction f et le point de depart x0
% en sortie :
% le flag pour connaitre la raison de l'arret de l'algorithme vaut -1 si
% probleme
% la solution x
% et l'algorithme affiche egalement le nombre diteration de lalgorithme

function [flag, x] = newtonlocal( f, x0 )
flag=-1;
nbIterations = 50;

x = x0;

var = sym('x', [length(x) 1]);

grad = gradient(f, var);
g = eval(subs(grad, var, x));
hess = hessian(f, var);
H = eval(subs(hess, var, x));

k = 0;

epsilon = 1/10^6;

testArret1 = false;
testArret2 = false;
testArret3 = false;
testArret4 = false;
continuer = true;

while continuer
    % Calcul de d
    d = - H \ g;
    % Mise a jour des variables
    x_ancien = x;
    x = x+d;
    g = eval(subs(grad, var, x));
    H = eval(subs(hess, var, x));
    k = k+1;
    tol=0.0001;
    
    c = num2cell(x);
    c_ancien = num2cell(x_ancien);
    
    testArret1 = norm(g) <= tol*(g + sqrt(epsilon));
    testArret2 = norm(x-x_ancien) <= tol*(norm(x_ancien) + sqrt(epsilon));
    testArret3 = norm(f(c{:})-f(c_ancien{:})) <= tol*(abs(f(c_ancien{:})) + sqrt(epsilon));
    testArret4 = k >= nbIterations;
    
    if testArret1 == true
        continuer = false;
        flag = 0;
    end
     if testArret2 == true
        continuer = false;
        flag = 1;
     end
       if testArret3 == true
        continuer = false;
        flag = 2;
       end
        if testArret4 == true
        continuer = false;
        flag = 3;
     end
end;
disp('nombre diter')
k
disp('raison de larret')
flag
end
