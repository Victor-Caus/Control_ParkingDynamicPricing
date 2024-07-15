function controlador = projetarControladorNelderMead(controlador)
J = @(x) calcularCusto(x);

x0 = [controlador.Kp, controlador.Ki];

xOtimo = fminsearch(J, x0);

controlador.Kp = xOtimo(1);
controlador.Ki = xOtimo(2);
controlador.T = 86400;

end