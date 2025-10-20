clear all;
clc;

%% Zad1


for i=1:3
e0w = [1,3,4];
eprim0w = [1,2,4];

e0 = e0w(i);
eprim0 = eprim0w(i);

k = 3;
B = 3;
a = 0;
w = 0;
out = sim('lab2sim.slx');

e = out.e.Data;
eprim = out.eprim.Data;

figure(1)
hold on
plot(e,eprim)
legend('e0 = 1, eprim0 = 1','e0 = 3, eprim0 = 2','e0 = 4, eprim0 = 4')
end