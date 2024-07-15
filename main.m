%% Projeto do controlador

clear
planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControladorAnalitico(requisitos, planta);
controlador = projetarControladorNelderMead(controlador);


%% Avaliar o controlodar de forma analítica (planta aproximada)

avaliarControladorAnalitico(controlador, planta);


%% Simulação

Tf = requisitos.T*120; % duração da simulação
avaliarControladorSimulacao(controlador, planta, Tf);
