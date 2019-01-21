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

function [flag,pas] = GradientConjTronc (g, h , delta)
          s=0;
          g=g;
          p=-g;
          k=0;
          nbIter =1000;
          epsilon = 1e-6;
          continuer = true;
          while continuer
            %etape a
            k = p'*h*p;

            %etape b
            if k<=0
              %??????
              s=s+sigma*p;
            end

            %etape c
            alpha = g'*g/k;

            %etape d
            if norm(s+alpha*p)>delta
              %??????
              s=s+*sigma*p;
            end

            %etape e
            old_s = s;
            s=s+alpha*p;

            %etape f
            old_g=g;
            g=g+alpha*h;

            %etape g
            beta = g'*g/(old_g'*old_g);

            %etape h
            p=g+beta*p

            %condition d'arret 1
            if norm(g) > eps(g + epsilon)
              flag =1;
              continuer = false;
            end
            %condition d'arret 2
            if norm(s-old_s) > eps(norm(old_s) + epsilon);
              flag =2;
              continuer = false;
            end
            %condition d'arret 4
            if k >= nbIter
              flag =4;
              continuer = false;
            end
          end
          pas = s;
end
