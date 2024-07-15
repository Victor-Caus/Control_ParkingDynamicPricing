function controlador = projetarControladorNelderMead(controlador)
% Projeta um controlador a partir da otimização Nelder Mead, a partir de um
% chute inicial (recomenda-se que usar o controlador analítico como tal
% chute)
% controlador.Kp: constante proporcional
% controlador.Ki: constante da integral.

J = @(x) calcularCusto(x);

x0 = [controlador.Kp, controlador.Ki];

xOtimo = fminsearch(J, x0);

controlador.Kp = xOtimo(1);
controlador.Ki = xOtimo(2);
%controlador.T = controlador.T;

end