function controlador = projetarControladorCMAES(controlador)
% Projeta um controlador a partir da otimização CMAES, a partir de um chute
% inicial (recomenda-se que usar o controlador analítico como chute
% inicial.
% controlador.Kp: constante proporcional
% controlador.Ki: constante da integral.

OPTS = cmaes;
OPTS.LogPlot = 'on';
xstart(1) = controlador.Kp;
xstart(2) = controlador.Ki;
[xmin, fmin, counteval, stopflag, out, bestever] = cmaes('calcularCusto',xstart,0.01,OPTS);
controlador.Kp = xmin(1);
controlador.Ki = xmin(2);
end