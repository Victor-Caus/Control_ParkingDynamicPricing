function custo = calcularCusto(x)
s = tf('s');

planta = obterPlanta();
requisitos = obterRequisitos();

% PI
Kp = x(1);
Ki = x(2);
tau = requisitos.T./2;
C = Ki/s + Kp;

delay = exp(-tau*s);

Ga = C * delay * (-planta.a);
Gf = minreal(feedback(Ga,1));
[Gm, Pm, Wcg, Wcp] = margin(Ga);
wb = bandwidth(Gf);
custoPm = min((Pm-requisitos.PM)/requisitos.PM, 0)^2;
custoGm = min((Gm-requisitos.GM)/requisitos.GM, 0)^2;
custowb = ((wb-requisitos.wb)/requisitos.wb)^2;
custo = custoPm + custowb + custoGm;
