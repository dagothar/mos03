function [ dx ] = mos03_odefun_nl( t, x, param )
%mos03_odefun Oblicza pochodne dla zadania mos03
%   Dla ukladu nieliniowego

%% Pobierz wartosci parametrow
m1 = param(1);
m2 = param(2);
l = param(3);
g = param(4);

%% Wyznacz wymuszenie
u = 0;

%% Oblicz pochodne
dx(1, 1) = x(2);
dx(2, 1) = (m2*l*sin(x(3))*(g*cos(x(3))+x(4)^2)+u) / ((m1+m2)-m2*l*cos(x(3))^2);
dx(3, 1) = x(4);
dx(4, 1) = ((m1+m2)*g*sin(x(3))+(m2*l*x(4)^2*sin(x(3))+u)*cos(x(3))) / (m2*l*cos(x(3))^2-(m1+m2));

end

