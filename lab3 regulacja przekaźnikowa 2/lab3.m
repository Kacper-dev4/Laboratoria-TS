clear all 
clc
k=1;
kr=1;
Td=1;
%% zad1
T = 2;
stop_time = 20;
for i=1:5:16
a = 0;
e0 = i;
eprim0 = 0;
w = 0;

k1 = 1.7;
k2 = 1;
B = 1;

out = sim('lab3sim.slx');

e = out.e.Data;
eprim = out.eprim.Data;

figure(1)
hold on
plot(e,eprim)
xlabel('e')
ylabel('eprim')

end


for i=4:2.5:14
a = 0;
e0 = 0;
eprim0 = 0;
w = -i;

k1 = 1.7;
k2 = 1;
B = 1;

out = sim('lab3sim.slx');

e = out.e.Data;
eprim = out.eprim.Data;

figure(2)
hold on
plot(e,eprim)
xlabel('e')
ylabel('eprim')

end


for i=2:2
a = 0.05;
e0 = i;
eprim0 = 0;
w = 0;

k1 = 2;
k2 = 1;
B = 1;

out = sim('lab3sim.slx');

e = out.e.Data;
eprim = out.eprim.Data;

figure(3)
hold on
plot(e,eprim)

end


%% zad2

T = 2;
stop_time = 40;
for i=0:1:4
a = 2;
e0 = -5;
eprim0 = 0;
w = 0;
k=1;
k1 = i;
k2 = 1;
B = 3;

out = sim('lab3sim.slx');

e = out.e2.Data;
eprim = out.eprim2.Data;

figure(4)
hold on
plot(e,eprim)
xlabel('e')
ylabel('eprim')
legend('k1 = 0', 'k1 = 1', 'k1 = 2','k1 = 3','k1 = 4')

end

%% Zad3

stop_time = 40;
%i=1.1:0.01:1.2
for i=1:5
a = 1;
e0 = -6;
eprim0 = 0;
w = 0;
k=1;
k1 = 2;
k2 = 1;
B = 3;
kr = 1;
T = 2;

Td = i^3;

out = sim('lab3sim.slx');
e = out.e3.Data;
eprim = out.eprim3.Data;
t = out.tout;

figure(5)
hold on
plot(e,eprim);
xlabel('e')
ylabel('eprim')
legend( 'Td = 1', 'Td = 2','Td = 3','Td = 4','Td = 5')

figure(6)
hold on 
plot(t,e)
xlabel('t')
ylabel('e')
legend( 'Td = 1', 'Td = 2','Td = 3','Td = 4','Td = 5')

end

%% Zad4 

