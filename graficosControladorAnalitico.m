clear
figure

PM = 120;
a = 0.2320;
Tb = 86400*30;
wb = 2*pi./Tb;

Kp = 0:1e-5:1e1;

% relação Ki x Kp para PM fixo
Ki1 = (pi/180).*(90 - PM + atand(a^2*Kp.^2./(1 - a.^2*Kp.^2))).*(sqrt((1-a.^2.*Kp.^2)/a.^2));

% relação Ki x Kp para wb fixo
Ki2 = sqrt(2.*wb.^2/a.^2 - (Kp.*wb).^2);

plot(Kp, [Ki1; Ki2], 'LineWidth', 2);
xlabel('Kp', 'FontSize', 14);
ylabel('Ki', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -depsc2 metodoGrafico.eps

Kp = 2.60777;
Ki = 1.33561e-5;