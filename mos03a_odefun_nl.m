function [ dx ] = mos03_odefun_l( t, x, param )
%mos03_odefun Oblicza pochodne dla zadania mos03
%   Dla ukladu nieliniowego

%% Pobierz wartosci parametrow
m1 = param(1);
m2 = param(2);
l = param(3);
g = param(4);

%% Wyznacz wymuszenie
u = 0 * (t < 0.01);

%% Oblicz pochodne
dx(1, 1) = x(2);
dx(2, 1) = (m2*sin(x(3))*(g*cos(x(3))+l*x(4)^2)+u) / (-m2*cos(x(3))^2+m1+m2);
dx(3, 1) = x(4);
dx(4, 1) = -(g*sin(x(3))*(m1+m2)+cos(x(3))*(l*m2*x(4)^2*sin(x(3))+u)) / (l*(-m2*cos(x(3))^2+m1+m2));

end

