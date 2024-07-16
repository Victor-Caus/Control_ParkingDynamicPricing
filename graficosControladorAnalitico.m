clear
figure

PM = 120;
a = 0.2320;
Tb = 86400*30;
wb = 2*pi./Tb;

Kp = 0:1e-5:1e1;

% Relation Ki x Kp for fixed PM
Ki1 = (pi/180).*(90 - PM + atand(a^2*Kp.^2./(1 - a.^2*Kp.^2))).*(sqrt((1-a.^2.*Kp.^2)/a.^2));

% Relation Ki x Kp for fixed wb
Ki2 = sqrt(2.*wb.^2/a.^2 - (Kp.*wb).^2);

% Function to find the intersection
fun = @(Kp) (pi/180)*(90 - PM + atand(a^2*Kp.^2./(1 - a.^2*Kp.^2))).*(sqrt((1-a.^2.*Kp.^2)/a.^2)) - sqrt(2*wb.^2/a.^2 - (Kp*wb).^2);

% Initial guess for fzero
Kp_initial_guess = 1;

% Find the intersection
Kp_intersect = fzero(fun, Kp_initial_guess);
Ki_intersect = (pi/180)*(90 - PM + atand(a^2*Kp_intersect.^2./(1 - a.^2*Kp_intersect.^2))).*(sqrt((1-a.^2.*Kp_intersect.^2)/a.^2));

% Plot the curves and the intersection
plot(Kp, Ki1, 'LineWidth', 2, 'DisplayName', 'Fixed PM');
hold on;
plot(Kp, Ki2, 'LineWidth', 2, 'DisplayName', 'Fixed wb');
plot(Kp_intersect, Ki_intersect, 'ro', 'MarkerSize', 8, 'DisplayName', 'Intersection');
xlabel('Kp', 'FontSize', 14);
ylabel('Ki', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
legend('show', 'Location', 'best');
print -depsc2 metodoGrafico.eps

% Intersection found
Kp_intersect;
Ki_intersect;
