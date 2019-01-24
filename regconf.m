%% ####algo region de confiance####
%
% function regconf(f,gradf,hessf,gamma1,gamma2,eta1,eta2) -> sol
%
%---En entrée---
% f : la fonctionnelle
% gradf : gradient de f
% hessf : hessienne de f
% gamma1 :
% gamma2 :
% ea1 :
% eta2 :
% delta0 :
% deltamax :
% tol1 : tolerance pour stagnation du pas seulement dans le cas ou il est
% change
%
%---En sortie---
% sol : approximation de la solution min f((x) x appartenant a Rn


function [flag,sol]=regconf(f, x0, delta0, gamma1, gamma2, eta1, eta2)
	flag=0;
	x=x0;
	delta_max= 10*norm(x0,1);
	delta = delta0;
	k=0;
	nbIter=10000;
	epsilon=0.001;

	var = sym('x', [length(x) 1]);

	%calcul du gradient et de la hessienne
	g = gradient(f, var);
	h = hessian(f,var);
	G = eval(subs(g, var, x));
	H = eval(subs(h,var, x));
	s = pasdecauchy(G,H,delta);
	g0 = eval(subs(G,var,x0));
	c = num2cell(x);

  continuer = true;

  while continuer
		old =x;
		f_x=f(c{:});
		c = num2cell(x+s);
		f_xs=f(c{:});
		m_x=f_x;
		m_xs=f_x+G'*s+1/2*s'*H*s;
		rhok=(f_x - f_xs)/(m_x - m_xs);

		%maj de litere
		if (rhok >=eta1)
			x = x+s;
		end

		%maj region de conf
		if rhok>=eta2
			delta=min(gamma2*delta,delta_max);
		else if rohk<eta1
			delta=gamma1*delta;
		     end
    end

	%actualisation des fonctions
	k=k+1;
	c=num2cell(x);
	G = eval(subs(g,var,x));
	H=eval (subs(h,var,x));
	s=pasdecauchy(G,H,delta);
	sol=x;

	%condition d'arret 1
%	if norm(G) > epsilon*(g0 + epsilon)
%		flag =1;
%		continuer = false;
%	end
	%condition d'arret 2
%	if norm(x-old) > epsilon*(norm(old) + epsilon);
%		flag =2;
%		continuer = false;
%	end
	%condition d'arret 3
	if norm(f(c{:})-f_x) <= epsilon*(abs(f_x + epsilon));
		flag =3;
		continuer = false;
	end
	%condition d'arret 4
	if k >= nbIter
		flag =4;
		continuer = false;
	end
	end
	disp ('nombre de iterations : ');
	k
end
