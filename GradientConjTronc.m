%% ####GradientConjTronc####
%
% GradientConjTronc(gradient, hessienne, delta) -> sol
%
%---En entrée---
% delta : region de confiance
% gradf : gradient de f
% hessf : hessienne de f
%
%---En sortie---
% pas : pas optimal a l'interieur de la region de confiance

function [pas] = GradientConjTronc (g, h , delta)
          s=0;
          g=g;
          p=-g;
          
end
