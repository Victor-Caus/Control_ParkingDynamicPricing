clear
planta = obterPlanta();
controlador = projetarControladorAnalitico();

xstart(1) = controlador.Kp;
xstart(2) = controlador.Ki;
[xmin, fmin, counteval, stopflag, out, bestever] = cmaes('calcularCusto',xstart,0.01);
controlador.Kp = xmin(1);
controlador.Ki = xmin(2);