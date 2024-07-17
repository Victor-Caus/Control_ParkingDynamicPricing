clear
figure

PM = 120;
a = 0.2320;
Tb = 86400*30;
wb = 2*pi./Tb;

Kp = 0:1e-5:1e1;

% Relação Ki x Kp para PM fixo
Ki1 = (pi/180).*(90 - PM + atand(a^2*Kp.^2./(1 - a.^2*Kp.^2))).*(sqrt((1-a.^2.*Kp.^2)/a.^2));

% Relação Ki x Kp para wb fixo
Ki2 = sqrt(2.*wb.^2/a.^2 - (Kp.*wb).^2);

% Função para encontrar a interseção
fun = @(Kp) (pi/180)*(90 - PM + atand(a^2*Kp.^2./(1 - a.^2*Kp.^2))).*(sqrt((1-a.^2.*Kp.^2)/a.^2)) - sqrt(2*wb.^2/a.^2 - (Kp*wb).^2);

% Encontrar a interseção ( poderia ser visualmente no grafico)
Kp_initial_guess = 1;
Kp_intersect = fzero(fun, Kp_initial_guess);
Ki_intersect = (pi/180)*(90 - PM + atand(a^2*Kp_intersect.^2./(1 - a.^2*Kp_intersect.^2))).*(sqrt((1-a.^2.*Kp_intersect.^2)/a.^2));

% Plotar as curvas e a interseção
plot(Kp, Ki1, 'LineWidth', 2, 'DisplayName', 'PM fixo');
hold on;
plot(Kp, Ki2, 'LineWidth', 2, 'DisplayName', 'wb fixo');
plot(Kp_intersect, Ki_intersect, 'ro', 'MarkerSize', 8, 'DisplayName', 'Interseção');
xlabel('Kp', 'FontSize', 14);
ylabel('Ki', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
legend('show', 'Location', 'best');
print -depsc2 metodoGrafico.eps

% Interseção encontrada
Kp_intersect;
Ki_intersect;
