clear all 
clc
k=1;
kr=1;
Td=1;
b=0.5;
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
t = out.tout;
figure(4)
hold on
plot(e,eprim)
xlabel('e')
ylabel('eprim')
legend('k1 = 0', 'k1 = 1', 'k1 = 2','k1 = 3','k1 = 4')
figure(101)
hold on
plot(t,e)
xlabel('t')
ylabel('e')
legend('k1 = 0', 'k1 = 1', 'k1 = 2','k1 = 3','k1 = 4')

end

%% Zad3

stop_time = 40;
%i=1.1:0.01:1.2
for i=1:5
a = 1;
e0w = [1.1,1.3,1.5,1.6,1.7];
e0 = -e0w(i);
eprim0 = 0;
w = 0;
k=2;
k1 = 2;
k2 = 1;
B = 2;
kr = 1;
T = 2;

Td = 1.5;

out = sim('lab3sim.slx');
e = out.e3.Data;
eprim = out.eprim3.Data;
t = out.tout;

figure(5)
hold on
plot(e,eprim);
xlabel('e')
ylabel('eprim')
%legend( 'Td = 1', 'Td = 2','Td = 3','Td = 4','Td = 5')
legend('e0 = 1.1','e0 = 1.3','e0 = 1.5','e0 = 1.6','e0 = 1.7')

figure(6)
hold on 
plot(t,e)
xlabel('t')
ylabel('e')
%legend( 'Td = 1', 'Td = 2','Td = 3','Td = 4','Td = 5')
legend('e0 = 1.1','e0 = 1.3','e0 = 1.5','e0 = 1.6','e0 = 1.7')


a = 1;
e0 = 0;
eprim0 = 0;
w = i+1;
k=1;
k1 = 2;
k2 = 1;
B = 2;
kr = 1;
T = 2;

Td = 1.5;

out = sim('lab3sim.slx');
e = out.e3.Data;
eprim = out.eprim3.Data;
t = out.tout;

figure(7)
hold on
plot(e,eprim);
xlabel('e')
ylabel('eprim')
%legend( 'Td = 1', 'Td = 2','Td = 3','Td = 4','Td = 5')
legend('w = 2','w = 3','w = 4','w = 5','w = 6')

figure(8)
hold on 
plot(t,e)
xlabel('t')
ylabel('e')
%legend( 'Td = 1', 'Td = 2','Td = 3','Td = 4','Td = 5')
legend('w = 2','w = 3','w = 4','w = 5','w = 6')


end

%% Zad4 

stop_time = 100;
%i=1.1:0.01:1.2
for i=1:5
a = 5;
b = 2;
e0 = -10;
eprim0 = 0;
w = 0;
k=1;
k1 = 2;
k2 = 1;
B = 2;
kr = 1;
T = 10;

Td = i^3;

out = sim('lab3sim.slx');
e = out.e4.Data;
eprim = out.eprim4.Data;
t = out.tout;

figure(9)
hold on
plot(e,eprim);
xlabel('e')
ylabel('eprim')
legend( 'Td = 1', 'Td = 4','Td = 9','Td = 16','Td = 25')
grid on

figure(10)
hold on 
plot(t,e)
xlabel('t')
ylabel('e')
legend( 'Td = 1', 'Td = 4','Td = 9','Td = 16','Td = 25')

if i==5
    break;
end

% a = i+1;
% b = 1;
% e0 = -7;
% eprim0 = 0;
% w = 0;
% k=1;
% k1 = 2;
% k2 = 1;
% B = 5;
% kr = 1;
% T = 4;
% 
% Td = 1.5;
% 
% out = sim('lab3sim.slx');
% e = out.e4.Data;
% eprim = out.eprim4.Data;
% t = out.tout;
% 
% figure(11)
% hold on
% plot(e,eprim);
% xlabel('e')
% ylabel('eprim')
% legend( 'Δ= 1','Δ = 2','Δ = 3','Δ = 4')
% 
% figure(12)
% hold on 
% plot(t,e)
% xlabel('t')
% ylabel('e')
% legend( 'Δ= 1','Δ = 2','Δ = 3','Δ = 4')

end
%% poslizg
a = 2;
b = 1;
e0 = -10;
eprim0 = 0;
w = 0;
k=1;
k1 = 2;
k2 = 1;
B = 2;
kr = 1;
T = 2;

Td = 5;

x = 1:0.01:10;
y1 = (x-b)*(-1/Td);
y2 = (x-a)*(-1/Td);
out = sim('lab3sim.slx');
e = out.e4.Data;
eprim = out.eprim4.Data;
t = out.tout;

figure(13)
hold on
plot(e,eprim);
plot(x,y1,'--','Color',[0,0,0])
plot(x,y2,'--','Color',[0,0,0])
xlabel('e')
ylabel('eprim')


figure(14)
hold on 
plot(t,e)
xlabel('t')
ylabel('e')



a = 2;
b = 1;
e0 = 10;
eprim0 = 0;
w = 0;
k=5;
k1 = 2;
k2 = 1;
B = 10;
kr = 1;
T = 2;

Td = 0.75;

x = -10:0.01:10;
y1 = (x-b)*(-1/Td);
y2 = (x-a)*(-1/Td);
y3 = (x+b)*(-1/Td);
y4 = (x+a)*(-1/Td);
out = sim('lab3sim.slx');
e = out.e4.Data;
eprim = out.eprim4.Data;
t = out.tout;

figure(15)
hold on
plot(e,eprim);
plot(x,y1,'--','Color',[0,0,0])
plot(x,y2,'--','Color',[0,0,0])
plot(x,y3,'--','Color',[0,0,0])
plot(x,y4,'--','Color',[0,0,0])
xlabel('e')
ylabel('eprim')
ylim([-5,15])

figure(16)
hold on 
plot(t,e)
xlabel('t')
ylabel('e')
