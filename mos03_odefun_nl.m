function [ dx ] = mos03_odefun_nl( t, x, param )
%mos03_odefun Oblicza pochodne dla zadania mos03
%   Dla ukladu nieliniowego

%% Pobierz wartosci parametrow
m1 = param(1);
m2 = param(2);
l1 = param(3);
g = param(4);

%% Wyznacz wymuszenie
u = 0;

%% Wyznacz wartosci wspolczynnikow
A23 = m2*g/m1;
B21 = 1/m1;
A43 = -((m1+m2)*m2*g)/(m1*m2*l1);
B41 = (1-(m1+m2)/m1)/(m2*l1);

%% Oblicz pochodne
dx(1, 1) = x(2);
dx(2, 1) = A23*sin(x(3)) + B21*u;
dx(3, 1) = x(4);
dx(4, 1) = A43*sin(x(3)) + B41*u;

end

