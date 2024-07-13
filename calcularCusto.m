function custo = calcularCusto(x)
s = tf('s');

planta = obterPlantaProjeto();
controlador = projetarControladorAnalitico();
requisitos = obterRequisitos();

% PI
Kp = x(1);
Ki = x(2);
tau = controlador.T./2;
C = Ki/s + Kp;

delay = exp(-tau*s);

Ga = C * delay * (-planta.a);
Gf = minreal(feedback(Ga,1));
[Gm, Pm, Wcg, Wcp] = margin(Ga);
wb = bandwidth(Gf);
custo = (requisitos.PM-Pm)^2 + (requisitos.wb - wb)^2;
