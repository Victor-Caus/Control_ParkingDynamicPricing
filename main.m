%% Projeto do controlador

clear
planta = obterPlanta();
requisitos = obterRequisitos();
controlador_analitico = projetarControladorAnalitico(requisitos, planta);
controlador = projetarControladorNelderMead(controlador_analitico);


%% Avaliar o controlodar de forma analítica (sistema aproximado)

% Essa avaliação é sobre o controlador otimizado, porém com planta sem 
% ruído e o zero-hold é aproximado por um atraso de T/2
planta = obterPlanta();
avaliarControladorAnalitico(controlador, planta);


%% Simulação
    
Tf = requisitos.T*90; % duração da simulação
planta = obterPlanta();
avaliarControladorSimulacao(controlador, planta, Tf);
