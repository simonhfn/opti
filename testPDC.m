% Cas tests pour le calcul du pas de cauchy
disp('######## Test du pas de cauchy#########')
delta=2;

%% cas 1
disp('########cas 1#######')
g_1=[0;0]
h_1=[7 0;0 2]
pasdecauchy(g_1,h_1,delta)

%% cas 2
disp('####### cas 2########')
g_2=[6;2]
h_2=[7 0;0 2]
pasdecauchy(g_2,h_2,delta)

%% cas 3
disp('######## cas 3 ########')
g_3=[-2;1]
h_3=[-2 0; 0 10]
pasdecauchy(g_3,h_3,delta)
