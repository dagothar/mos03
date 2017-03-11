clc; clear all; close all;

%% Dane
m1 = 1;
m2 = 1;
l1 = 1;
g = 9.81;

%% Czas symulacji
t_start = 0;
t_koniec = 10;
dt = 0.01;

t = [t_start : dt : t_koniec ];

%% Warunki poczatkowe
x0 = [0 0 1 0]';

%% Rozwiazanie dla systemu nieliniowego
options = odeset('RelTol', 1e-3, 'AbsTol', 1e-3);
[t, x] = ode45(@mos03_odefun_nl, t, x0, options, [m1 m2 l1 g]);

figure;
subplot(1, 2, 1);
plot(t, x(:, :));
legend('x1', 'x2', 'x3', 'x4');
title('Odpowiedz ukladu nieliniowego')

%% Rozwiazanie dla systemu liniowego
options = odeset('RelTol', 1e-3, 'AbsTol', 1e-3);
[t, x] = ode45(@mos03_odefun_l, t, x0, options, [m1 m2 l1 g]);

subplot(1, 2, 2);
plot(t, x(:, :));
legend('x1', 'x2', 'x3', 'x4');
title('Odpowiedz ukladu liniowego')
