%% TS_LAB_8a

clear all; close all; clc;

kolor = ['r','g','b','k','m','c'];

%% I.2

% Dane
a = -2;
b = 2;
c = 1;

x = [-1:0.001:2];
y = a*x.^2 + b*x +c;

plot(x, y, 'm');
title('Charakterystyka obiektu nieliniowego', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('x', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('y', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

% I.3

% Dane
a = -2;
b = 2;
c = 1;
czas = 400;

A_u = 5;
f_u = 0.005; % czêstotliwoœæ w Hz
A_ud = 1.5;
f_ud = 100; % czêstotliwoœæ w Hz

k = 1;
T = 0.1;
n = 3;

% Filtr dolnoprzepustowy (obiek liniowy)
s = tf('s');
K = k / (1 + s*T);
Ko = K^n;
Licznik = Ko.num{1};
Mianownik = Ko.den{1};

% Symulacja
sim('model_TS_Lab_8a.mdl');

% Rysowanie wykresów
figure;
plot(u, dydu, 'Color', kolor(1), 'DisplayName', 'Funkcja analityczna');
hold on;
plot(u, v_sr, 'Color', kolor(3), 'DisplayName', ['A_u_d = ' num2str(A_ud) '; f_u_d = ' num2str(f_ud) '; k = ' num2str(k) '; T = ' num2str(T)]);

title('Porównanie ch-ki idealnej i wyniku symulacji', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('u', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('f(u), v_œ_r', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'NorthEast');
grid on;

% I.3a

%Dane
a = -2;
b = 2;
c = 1;
czas = 400;

A_u = 5;
f_u = 0.005; % czêstotliwoœæ w Hz
A_ud = 0;
A_ud_wek = [0.5 1.5 2 2.5];
f_ud = 100; % czêstotliwoœæ w Hz

k = 1;
T = 1;
n = 3;

%Filtr dolnoprzepustowy (obiek liniowy)
s = tf('s');
Ko = k/((1 + s*T)^n);
K = k / (1 + s*T);
Ko = K^n;
Licznik = Ko.num{1};
Mianownik = Ko.den{1};

%Symulacja
sim('model_TS_Lab_8a.mdl');

%Rysowanie wykresów
figure;
plot(u, dydu, 'Color', kolor(1), 'DisplayName', 'Funkcja analityczna');
figure;
hold on;
for i=1 : length(A_ud_wek)
    
    A_ud = A_ud_wek(i);
    %Symulacja
    sim('model_TS_Lab_8a.mdl');
    
  
    plot(u, v_sr, 'Color', kolor(i+1), 'DisplayName', ['A_u_d = ' num2str(A_ud)]);  
end
hold off;
title('Wp³yw amplitudy sygna³u moduluj¹cego A_u_d', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('u', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('f(u), v_œ_r', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'NorthEast');
grid on;

% I.3b

% Dane
a = -2;
b = 2;
c = 1;
czas = 400;

A_u = 5;
f_u = 0.005; % czêstotliwoœæ w Hz
A_ud = 1;
f_ud = 1; % czêstotliwoœæ w Hz
f_ud_wek = [1 30 50 100];

k = 1;
T = 1;
n = 3;

% Filtr dolnoprzepustowy (obiek liniowy)
s = tf('s');
K = k / (1 + s*T);
Ko = K^n;
Licznik = Ko.num{1};
Mianownik = Ko.den{1};

% Symulacja
sim('model_TS_Lab_8a.mdl');

% Rysowanie wykresów
figure;
plot(u, dydu, 'Color', kolor(1), 'DisplayName', 'Funkcja analityczna');
figure;
hold on;
for i=1 : length(f_ud_wek)

    f_ud = f_ud_wek(i);
    % Symulacja
    sim('model_TS_Lab_8a.mdl');

   
    plot(u, v_sr, 'Color', kolor(i+1), 'DisplayName', ['f_u_d = ' num2str(f_ud)]);  
end
hold off;
title('Wp³yw czêstotliwoœci sygna³u moduluj¹cego f_u_d', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('u', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('f(u), v_œ_r', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'NorthEast');
grid on;

% I.3c

% Dane
a = -2;
b = 2;
c = 1;
czas = 400;

A_u = 5;
f_u = 0.005; % czêstotliwoœæ w Hz
A_ud = 1;
f_ud = 100; % czêstotliwoœæ w Hz

k = 1;
k_wek = [0.2 0.5 1 2];
T = 1;
n = 3;

% Filtr dolnoprzepustowy (obiek liniowy)
s = tf('s');
K = k / (1 + s*T);
Ko = K^n;
Licznik = Ko.num{1};
Mianownik = Ko.den{1};

% Symulacja
sim('model_TS_Lab_8a.mdl');

% Rysowanie wykresów
figure;
plot(u, dydu, 'Color', kolor(1), 'DisplayName', 'Funkcja analityczna');
figure;
hold on;
for i=1 : length(k_wek)

    k = k_wek(i);

    K = k / (1 + s*T);
    Ko = K^n;
    Licznik = Ko.num{1};
    Mianownik = Ko.den{1};

    % Symulacja
    sim('model_TS_Lab_8a.mdl');

   
    plot(u, v_sr, 'Color', kolor(i+1), 'DisplayName', ['k = ' num2str(k)]); 
end
hold off;
title('Wp³yw wzmocnienia filtru k', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('u', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('f(u), v_œ_r', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'NorthEast');
grid on;

% I.3d

% Dane
a = -2;
b = 2;
c = 1;
czas = 400;

A_u = 5;
f_u = 0.005; % czêstotliwoœæ w Hz
A_ud = 1;
f_ud = 100; % czêstotliwoœæ w Hz

k = 1;
T = 1;
T_wek = [0.1 0.7 1 1.7];
n = 3;

% Filtr dolnoprzepustowy (obiek liniowy)
s = tf('s');
K = k / (1 + s*T);
Ko = K^n;
Licznik = Ko.num{1};
Mianownik = Ko.den{1};

% Symulacja
sim('model_TS_Lab_8a.mdl');

% Rysowanie wykresów
figure;
plot(u, dydu, 'Color', kolor(1), 'DisplayName', 'Funkcja analityczna');
figure;
hold on;
for i=1 : length(T_wek)

    T = T_wek(i);

    K = k / (1 + s*T);
    Ko = K^n;
    Licznik = Ko.num{1};
    Mianownik = Ko.den{1};

    % Symulacja
    sim('model_TS_Lab_8a.mdl');

    plot(u, v_sr, 'Color', kolor(i+1), 'DisplayName', ['T = ' num2str(T)]);
end
hold off;
title('Wp³yw sta³ej czasowej filtru T', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('u', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('f(u), v_œ_r', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'NorthEast');
grid on;

% I.4

% Dane
a = -2;
b = 2;
c = 1;
czas = 40;

A_u = 5;
f_u = 0.05; % czêstotliwoœæ w Hz
A_ud = 1.5;
f_ud = 100; % czêstotliwoœæ w Hz

k = 1;
T = 0.1;
n = 3;

% Filtr dolnoprzepustowy (obiek liniowy)
s = tf('s');
K = k / (1 + s*T);
Ko = K^n;
Licznik = Ko.num{1};
Mianownik = Ko.den{1};

% Symulacja
sim('model_TS_Lab_8a.mdl');

% Rysowanie wykresów
figure;
plot(tout, u);
z = axis;
axis([z(1) z(2) z(3)-1 z(4)+1]);
title('Przebieg czasowy u', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('t [s]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('u', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

figure;
plot(tout, ud);
title('Przebieg czasowy u_d', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('t [s]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('u_d', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

figure;
plot(tout, y);
title('Przebieg czasowy y', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('t [s]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('y', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

figure;
plot(tout, v);
title('Przebieg czasowy v', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('t [s]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('v', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

figure;
plot(tout, dydu, 'Color', kolor(1), 'DisplayName', 'Funkcja analityczna');
hold on;
plot(tout, v_sr, 'Color', kolor(3), 'DisplayName', ['A_u_d = ' num2str(A_ud) '; f_u_d = ' num2str(f_ud) '; k = ' num2str(k) '; T = ' num2str(T)]);
title('Porównanie ch-ki idealnej i wyniku symulacji', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('t [s]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('f(u), v_œ_r', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'NorthEast');
grid on;

% I.5a

% Dane
a = -2;
b = 2;
c = 1;
czas = 40;

A_u = 5;
f_u = 0.05; % czêstotliwoœæ w Hz
A_ud = 0;
A_ud_wek = [2.5 2 1.5 0.5];
f_ud = 100; % czêstotliwoœæ w Hz

k = 1;
T = 0.1;
n = 3;

% Filtr dolnoprzepustowy (obiek liniowy)
s = tf('s');
K = k / (1 + s*T);
Ko = K^n;
Licznik = Ko.num{1};
Mianownik = Ko.den{1};

% Symulacja
sim('model_TS_Lab_8a.mdl');

% Rysowanie wykresów
figure;
plot(tout, dydu, 'Color', kolor(1), 'DisplayName', 'Funkcja analityczna');
hold on;
figure;
hold on;
for i=1 : length(A_ud_wek)

    A_ud = A_ud_wek(i);
    % Symulacja
    sim('model_TS_Lab_8a.mdl');


    plot(tout, v_sr, 'Color', kolor(6-i), 'DisplayName', ['A_u_d = ' num2str(A_ud)]); 

end

% Rysowanie wykresów
hold off;
title('Wp³yw amplitudy sygna³u moduluj¹cego A_u_d', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('t [s]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('f(u), v_œ_r', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'NorthEast');
grid on;

% I.5b

% Dane
a = -2;
b = 2;
c = 1;
czas = 40;

A_u = 5;
f_u = 0.05; % czêstotliwoœæ w Hz
A_ud = 1.5;
f_ud = 1; % czêstotliwoœæ w Hz
f_ud_wek = [10 20 50 100];

k = 1;
T = 0.1;
n = 3;

% Filtr dolnoprzepustowy (obiek liniowy)
s = tf('s');
K = k / (1 + s*T);
Ko = K^n;
Licznik = Ko.num{1};
Mianownik = Ko.den{1};

% Symulacja
sim('model_TS_Lab_8a.mdl');

% Rysowanie wykresów
figure;
plot(tout, dydu, 'Color', kolor(1), 'DisplayName', 'Funkcja analityczna');
hold on;
figure;
hold on;
for i=1 : length(f_ud_wek)

    f_ud = f_ud_wek(i);
    % Symulacja
    sim('model_TS_Lab_8a.mdl');


    plot(tout, v_sr, 'Color', kolor(i+1), 'DisplayName', ['f_u_d = ' num2str(f_ud)]);  

end

% Rysowanie wykresów
hold off;
title('Wp³yw czêstotliwoœci sygna³u moduluj¹cego f_u_d', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('t [s]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('f(u), v_œ_r', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'NorthEast');
grid on;


% I.5c

% Dane
a = -2;
b = 2;
c = 1;
czas = 40;

A_u = 5;
f_u = 0.05; % czêstotliwoœæ w Hz
A_ud = 1.5;
f_ud = 100; % czêstotliwoœæ w Hz

k = 1;
k_wek = [0.5 1 1.5 2];
T = 0.1;
n = 3;

% Filtr dolnoprzepustowy (obiek liniowy)
s = tf('s');
K = k / (1 + s*T);
Ko = K^n;
Licznik = Ko.num{1};
Mianownik = Ko.den{1};

% Symulacja
sim('model_TS_Lab_8a.mdl');

% Rysowanie wykresów
figure;
plot(tout, dydu, 'Color', kolor(1), 'DisplayName', 'Funkcja analityczna');
figure;
hold on;
for i=1 : length(k_wek)

    k = k_wek(i);
    K = k / (1 + s*T);
    Ko = K^n;
    Licznik = Ko.num{1};
    Mianownik = Ko.den{1};
    % Symulacja
    sim('model_TS_Lab_8a.mdl');

    plot(tout, v_sr, 'Color', kolor(i+1), 'DisplayName', ['k = ' num2str(k)]); 

end

% Rysowanie wykresów
hold off;
title('Wp³yw wzmocnienia filtru k', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('t [s]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('f(u), v_œ_r', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'NorthEast');
grid on;

%% I.5d

% % Dane
a = -1;
b = 1;
c = 1;
czas = 40;

A_u = 5;
f_u = 0.05; % czêstotliwoœæ w Hz
A_ud = 1.5;
f_ud = 100; % czêstotliwoœæ w Hz

k = 1;
T = 1;
T_wek = [0.1 0.5 1 1.5];
n = 3;

% Filtr dolnoprzepustowy (obiek liniowy)
s = tf('s');
K = k / (1 + s*T);
Ko = K^n;
Licznik = Ko.num{1};
Mianownik = Ko.den{1};
% 
% % Symulacja
sim('model_TS_Lab_8a.mdl');

% Rysowanie wykresów
figure;
plot(tout, dydu, 'Color', kolor(1), 'DisplayName', 'Funkcja analityczna');
hold on;
figure;
hold on;
for i=1 : length(T_wek)

    T = T_wek(i);
    K = k / (1 + s*T);
    Ko = K^n;
    Licznik = Ko.num{1};
    Mianownik = Ko.den{1};
    % Symulacja
    sim('model_TS_Lab_8a.mdl');

    
   
    plot(tout, v_sr, 'Color', kolor(i+1), 'DisplayName', ['T = ' num2str(T)]); hold on;

end
% 
% % Rysowanie wykresów
hold off;
title('Wp³yw sta³ej czasowej filtru T', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('t [s]', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('f(u), v_œ_r', 'FontSize', 12, 'FontWeight', 'bold');
legend('Location', 'NorthEast');
grid on;