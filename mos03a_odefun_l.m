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
dx(2, 1) = m2*g*x(3) + 1/m1*u;
dx(3, 1) = x(4);
dx(4, 1) = -g*(m1+m2)/(m1*l)*x(3) - 1/(m1*l)*u;

end

