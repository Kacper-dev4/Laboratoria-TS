clear all 
clc

%% zad1
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
