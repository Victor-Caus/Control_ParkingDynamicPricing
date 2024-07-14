J = @(x) calcularCusto(x);

Kp = 2.60777;
Ki = 1.33561e-5;
x0 = [Kp Ki];
xOtimo = fminsearch(J, x0);