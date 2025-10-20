clear all;
clc;


T = 3;
a2 = 0;
k2 = 3;
B2 = 4;
w2 = 1;

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
xlabel('e')
ylabel('eprim')
end


%% Zad2


T = 3;
a2 = 0;
k2 = 3;
B2 = 4;
w2 = 1;

out = sim('lab2sim.slx');
e2 = out.e2.Data;
eprim2 = out.eprim2.Data;

figure(2)
plot(e2,eprim2)
xlabel('e')
ylabel('eprim')

