clear all
set(groot, 'defaultFigureColor', 'w');
set(groot, 'defaultAxesColor', 'w');


time = 40;

A = 1.5;
f = 100;

Au  = 5;
fu = 0.05;

const = 3;

a = -2;
b = 2;
c = 1;

k = 1;
T = 0.1;
n = 3;

s = tf('s');
K = k / (1 + s*T);
Ko = K^n;
licznik = Ko.num{1};
mianownik = Ko.den{1};

out = sim("lab8symu.slx");
y = out.y.Data;
t = out.tout;
v = out.v.Data;
vsred = out.vsred.Data;
uDelta = out.uDelta.Data;

% figure
% plot(t,uDelta)

figure
plot(t,y);
xlabel('czas, s')
ylabel('y(t)')

figure
plot(t,v);
xlabel('czas, s')
ylabel('v(t)')

figure
plot(t,vsred);
xlabel('czas, s')
ylabel('v̄')
