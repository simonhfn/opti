%test des regions de confiance sur les fonctions de l'annexe A, en utilisant le pas 
%de Cauchy

clear all;
close all;

%% Tests de Reg de confiance avec pas de cauchy
disp('###################################################');
disp('## Tests Region de confiance avec pas de Cauchy  ##');
disp('###################################################');

% Sur la fonction f1
disp('###################################################');
disp('################### Test sur f1 ###################');
disp('###################################################');
x011 = [1; 0; 0];
x012 = [10; 3; -2.2];
delta0=2;
gamma1=0.5;
gamma2=2;
eta1=0.25;
eta2=0.75;


[flag, resultat_f1] = regconf(@(x1, x2, x3) f1(x1, x2, x3), x011, delta0, gamma1, gamma2, eta1, eta2)
f1(resultat_f1(1), resultat_f1(2), resultat_f1(3))

% Sur la fonction f2
disp('###################################################');
disp('################### Test sur f2 ###################');
disp('###################################################');
x021 = [1.2; 1];
x022 = [10; 0];
x023 = [0; 1/200 + 1e-12];

[flag, resultat_f2] = regconf(@(x1, x2) f2(x1, x2), x021, delta0, gamma1, gamma2, eta1, eta2)
f2(resultat_f2(1), resultat_f2(2))
