clear
planta = obterPlanta();
requisitos = obterRequisitos();
controlador = projetarControladorAnalitico(requisitos, planta);
controlador = projetarControladorNelderMead(controlador);

avaliarControladorAnalDiscretizado(controlador, planta);
