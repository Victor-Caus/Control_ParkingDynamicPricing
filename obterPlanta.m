function planta = obterPlanta()
% planta = obterPlanta()
% Obtem os parametros da planta da reta que modela a ocupação em função do
% preço (ax + b)

% Dados conhecidos (Com dados de um determinado lugar)
% Dados de 600 block of Beach Street, Fisherman's Wharf:
x = [3, 1.75];
y = [0.27 0.56];
% Dados de 200 block of Drumm Street, downtown
% x = [3.50, 4.50];
% y = [0.98, 0.86];

% Encontrar os coeficientes a e b da reta ax + b
p = polyfit(x, y, 1);

% Coeficientes
planta.a = p(1);
planta.b = p(2);
planta.variancia = 0.0025;

end