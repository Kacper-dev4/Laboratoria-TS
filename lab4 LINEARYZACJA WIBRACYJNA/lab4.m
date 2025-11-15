clear all 
clc
close all


%% Zad1
stop_time = 100;
kr = 1;
w = 1;
T = 1/5;
A = 1;
Ax=10;
Tfd = 0.3;
 M{1} = [ Tfd 1 ];
 M{2} = [ Tfd^2  2*Tfd  1 ];
 M{3} = [ Tfd^3  3*Tfd^2  3*Tfd  1 ];
 M{4} = [ Tfd^4  4*Tfd^3  6*Tfd^2  4*Tfd  1 ];
 M{5} = [ Tfd^5  5*Tfd^4  10*Tfd^3  10*Tfd^2  5*Tfd  1 ];
mianownik = M{1};
B = 2;
out = sim('lab444.slx');
y = out.y.Data;
x = out.x.Data;
u = out.u.Data;

figure(1)
plot(x,y)
xlabel('x')
ylabel('y')

%% Zad2

stop_time = 100;
M{1} = [ Tfd 1 ];
 M{2} = [ Tfd^2  2*Tfd  1 ];
 M{3} = [ Tfd^3  3*Tfd^2  3*Tfd  1 ];
 M{4} = [ Tfd^4  4*Tfd^3  6*Tfd^2  4*Tfd  1 ];
 M{5} = [ Tfd^5  5*Tfd^4  10*Tfd^3  10*Tfd^2  5*Tfd  1 ];
for i=1:5
A = 1;
Ax=10;
Tfd = 0.3;
mianownik = M{i};
B = 2;
out = sim('lab444.slx');
y = out.y.Data;
x = out.x.Data;
u = out.u.Data;

figure(2)
hold on 
plot(x,y)
xlabel('x')
ylabel('y')
legend('n=1','n=2','n=3','n=4','n=5')
end

%% Zad3 
T =1/5;
stop_time = 100;
M{1} = [ Tfd 1 ];
 M{2} = [ Tfd^2  2*Tfd  1 ];
 M{3} = [ Tfd^3  3*Tfd^2  3*Tfd  1 ];
 M{4} = [ Tfd^4  4*Tfd^3  6*Tfd^2  4*Tfd  1 ];
 M{5} = [ Tfd^5  5*Tfd^4  10*Tfd^3  10*Tfd^2  5*Tfd  1 ];
for i=1:5

% a)    
A = 1;
Ax=10;
Tfd = 0.3;
mianownik = M{5};
B = i;
out = sim('lab444.slx');
y = out.y.Data;
x = out.x.Data;
u = out.u.Data;

figure(3)
hold on 
plot(x,y)
xlabel('x')
ylabel('y')
legend('B=1','B=2','B=3','B=4','B=5')

% b)

T=1/5;
A = i^2;
Ax=10;
Tfd = 0.3;
mianownik = M{5};
B = 2;
out = sim('lab444.slx');
y = out.y.Data;
x = out.x.Data;
u = out.u.Data;

figure(4)
hold on 
plot(x,y)
xlabel('x')
ylabel('y')
legend('A=1','A=4','A=9','A=16','A=25')


% c)
T = i;
A = 1;
Ax=10;
Tfd = 0.3;
mianownik = M{5};
B = 2;
out = sim('lab444.slx');
y = out.y.Data;
x = out.x.Data;
u = out.u.Data;

figure(5)
hold on 
plot(x,y)
xlabel('x')
ylabel('y')
legend('T=1','T=2','T=3','T=4','T=5')


end



%% Zad4
stop_time = 100;
% a)
% w = 1;
% kr = 2.3;
% T = 1/5;
% A = 1;
% Ax=10;
% Tfd = 0.3;
%  M{1} = [ Tfd 1 ];
%  M{2} = [ Tfd^2  2*Tfd  1 ];
%  M{3} = [ Tfd^3  3*Tfd^2  3*Tfd  1 ];
%  M{4} = [ Tfd^4  4*Tfd^3  6*Tfd^2  4*Tfd  1 ];
%  M{5} = [ Tfd^5  5*Tfd^4  10*Tfd^3  10*Tfd^2  5*Tfd  1 ];
% mianownik = M{3};
% out = sim("lab444.slx");
% t = out.tout;
% y1 = out.y4a1.Data;
% figure(6)
% plot(t,y1);
% xlabel('czas, s')
% ylabel('y(t)')
% 
% G1 = tf(kr,mianownik);
% G1z = feedback(G1,1);
% figure(7)
% bodemag(G1z)

% w = 1;
% kr = 1.3;
% mianownik = M{2};
% out = sim("lab444.slx");
% t = out.tout;
% y2 = out.y4a2.Data;
% figure(8)
% plot(t,y2);
% xlabel('czas, s')
% ylabel('y(t)')
% 
% G2 = tf(kr,[Tfd^2  2*Tfd  1, 0]);
% G2z = feedback(G2,1);
% figure(9)
% bodemag(G2z)


% b)

T =1/100;
A = 60;
Ax=10;
Tfd = 0.3;
mianownik = M{3};
B = 3;
out = sim('lab444.slx');

x = out.x.Data;
y = out.y.Data;


[~, idxMin] = min(x);
[~, idxMax] = max(x);
x1 = x(idxMin);
y1 = y(idxMin);
x2 = x(idxMax);
y2 = y(idxMax);

k = (y2 - y1) / (x2 - x1);
x_fit = linspace(x1, x2, 200);
y_fit = y1 + k * (x_fit - x1);

figure(10); clf;
hold on;
plot(x, y, 'b', 'LineWidth', 1.5);
plot(x_fit, y_fit, '--r', 'LineWidth', 1.5);
xlabel('x');
ylabel('y');
title('Krzywa i prosta między min(x) i max(x)');
text(0.05, 0.95, sprintf('Nachylenie = %.3f', k), ...
     'Units', 'normalized', 'FontSize', 12, 'Color', 'r');

hold off;



% c)