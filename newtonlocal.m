%% ####Newton Local####
%
% Résolution d'un problème d'optimisation sans contraintes en utilisant l'algorithme de Newton Local
%
% newtonlocal(f,x0,epsilon) -> sol
%
%---En entrée---
% f : fonction a minimiser
% gradientf : gradient de f
% hessienf : hessienne de f
% x0 : approximation de la solution (i.e. point de départ)
% tol1 : précision souhaitée sur la solution (CN1)
% tol2 : précision souhaitée entre 2 pas (stagnation du pas)
% tol3 : précision souhaitée entre 2 iterations de la valeur de f
% (stagnation de f)
% niteration : nombre d'itération max
%
%---En sortie---
%sol : solution approche à epsilon près
%
%f1 est quadraituqe --> resultat en 1 iteration, devellopement de taylor a
%l'ordre 2 = elle meme

function [sol,flag] = newtonlocal(f,gradf,hesf,x0,tol1,tol2,tol3,niteration)

%% variables internes
n=size(x0,2);
k = 0; % nombre d'itérations
x = x0; %point de départ
xprecedent=x0;
dk =zeros(1,n);
flag=0;
sigma=0.1;
grad0=gradf*transpose(x0);
%% algo
while (flag==0)
    %calcul dk
    dk=-transpose(gradf.*x)\hesf.*x;
    %calcul xk+1
    xprecedent=x;
    x=x+dk;
    sol=x;
    %conditions d'arret
    if k>niteration
        flag=1;
    elseif norm(gradf.*transpose(x))<=tol1*(norm(grad0)+sigma)
        flag=2;
    elseif norm(x-xprecedent)<=tol2*(norm(xprecedent)+sigma)
        flag=3;
     elseif norm(f.*transpose(x)-f.*transpose(xprecedent)) <=tol3*(norm(f.*transpose(xprecedent))+sigma)
         flag=4;
    end
    k=k+1;
end

disp("il y a eu " + k + " itération(s)");
if (flag==1)
    disp("la solution est " + x + " et l'arret est du à : nombre d'iteration dépassé; \n");
elseif (flag==2)
    disp("la solution est " + x + " et l'arret est du à : CN1 validée, gradient de la solution nul à " + tol1 + " pres;" );
elseif(flag==3)
    disp("la solution est " + x + " et l'arret est du à : Stagnation du pas, différence x+1 et xk < tolerance; \n ");
elseif(flag==4)
    disp("la solution est " + x + " et l'arret est du à : Stagnation de f, difference f(xk+1) et f(xk) < tolerance");
end
