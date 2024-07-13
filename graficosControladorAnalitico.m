clear
figure

PM = 120;
a = 0.2320;
Tb = 86400*30;
wb = 2*pi./Tb;

Kp = 0:1e-4:1e1;
Ki1 = (pi/180).*(90 - PM + atand(Kp.^2)).*(sqrt((1-a.^2.*Kp.^2)/a.^2));
Ki2 = sqrt(2.*wb.^2/a.^2 - (Kp.*wb).^2);

plot(Kp, [Ki1; Ki2], 'LineWidth', 2);
xlabel('Kp', 'FontSize', 14);
ylabel('Ki', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -dpng -r400 degrau_thetal.png % para usuarios de Word
% print -depsc2 degrau_thetal.eps % para usuarios de LaTeX

Kp = 0.7598;
Ki = 1.46613e-5;