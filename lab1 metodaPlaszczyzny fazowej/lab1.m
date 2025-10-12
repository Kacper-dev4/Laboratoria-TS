clear all
clc

a = 1;
b = 2;
c = 3;

x0 = 1;
xprim0 = 1;

out = sim('lab1sim.slx');

x = out.x.Data;
xprim = out.xprim.Data;
t = out.tout;

figure
plot(t,x)
title('Wykres zmiany x w czasie')
xlabel('Czas')
ylabel('x')


figure
plot(t,xprim)
title('Wykres zmiany pochodnej x w czasie')
xlabel('Czas')
ylabel('xprim')


figure
plot(x,xprim)
title('Portret fazowy')
xlabel('x')
ylabel('xprim')