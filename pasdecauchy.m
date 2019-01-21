%% ####pas de cauchy####
%
% pasdecauchy(gradient, hessienne, delta) -> sol
%
%---En entrée---
% delta : region de confiance
% gradf : gradient de f
% hessf : hessienne de f
%
%---En sortie---
% pas : pas optimal a l'interieur de la region de confiance

function [pas] = pasdecauchy(g, h , delta)
		a = g' * h * g; %a de ax2 + bx + c
		normeg = norm(g);

    if(a>0) %alors pb convexe
			t = min(normeg^2/a,delta/normeg); % on choisit le bord si normeg^2/a deborde
    else % pb concave
			t = delta / normeg; %si droite descendante ou polynome concave, decroissante sur ]0,pas] donc on retourne le bord=rrconf
    end
	pas = -t*g;
end
