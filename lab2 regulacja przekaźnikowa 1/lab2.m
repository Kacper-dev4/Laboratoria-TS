clear all;
clc;
stop_time = 20;
 
T = 3;
a2 = 0;
k2 = 3;
B2 = 4;
w2 = 1;
e02= 0;
eprim02 =0;


T3 = 1;
a3 = 2;
b3 = 1;
k3 = 1;
B3 = 2;
w3 = 0;
e03 =0;
eprim03 = 0;

%% Zad1


for i=1:5
e0w = [1,3,4,7,10];

e0 = e0w(i);
eprim0 = 0;

k = 3;
B = 3;
a = 2;
w = 0;
out = sim('lab2sim.slx');

e = out.e.Data;
eprim = out.eprim.Data;
t = out.tout;

y1 = -20:1:20;
x1 = a*ones(1,length(y1));

figure(1)
hold on
plot(e,eprim)
if i==5
plot(x1,y1,'--')

end
xlabel('e')
ylabel('eprim')
legend('e0 = 1','e0 = 3','e0 = 4','e0 = 7','e0 = 10','prosta przełączeń')


figure(2)
hold on
plot(t,e)
legend('e0 = 1','e0 = 3','e0 = 4','e0 = 7','e0 = 10')
xlabel('t')
ylabel('e')

end


%% Zad2

for i=1:5
T = 1;
a2 = 1;
k2 = 2;
B2 = 2;
w2 = 0;
t = out.tout;

y1 = -4:0.1:4;
x1 = a2*ones(1,length(y1));


y2 = -4:0.1:4;
x2 = -a2*ones(1,length(y2));

e0w2 = [1.1,1.3,1.5,1.6,1.7];


e02 = e0w2(i);
eprim02 = 0;
out = sim('lab2sim.slx');
e2 = out.e2.Data;
eprim2 = out.eprim2.Data;


figure(3)
hold on
plot(e2,eprim2)
xlabel('e')
ylabel('eprim')
if i==5
plot(x1,y1,'--','Color',[0,0,0])
plot(x2,y2,'--','Color',[0,0,0])
end
legend('e0 = 1.1','e0 = 1.3','e0 = 1.5','e0 = 1.6','e0 = 1.7','proste przełączeń')


figure(2)
hold on
plot(t,e2)
legend('e0 = 1.1','e0 = 1.3','e0 = 1.5','e0 = 1.6','e0 = 1.7')
xlabel('t')
ylabel('e')


end
hold off
%% Zad3

e03 = 1.5;
eprim03 = 0;


for i=1:5



T3 = 2;
a3 = i+1;
b3 = 1;
k3 = 1;
B3 = 2;
w3 = 0;



y1 = -3:0.1:1;
x1 = a3*ones(1,length(y1));
y2 = -3:0.1:1;
x2 = -a3*ones(1,length(y2));

y3 = -3:0.1:1;
x3 = b3*ones(1,length(y1));
y4 = -3:0.1:1;
x4 = -b3*ones(1,length(y2));


out = sim('lab2sim.slx');
e3 = out.e3.Data;
eprim3 = out.eprim3.Data;


figure(5)
hold on
plot(e3,eprim3)
xlabel('e')
ylabel('eprim')
if i==5
plot(x1,y1,'--','Color',[0,0,0])
plot(x2,y2,'--','Color',[0,0,0])
plot(x3,y3,'--','Color',[0,0,0])
plot(x4,y4,'--','Color',[0,0,0])
end
legend('Δ=1','Δ=2','Δ=3','Δ=4','Δ=5','proste przełączeń')
%title(sprintf('k = %.d, A = %.2f', a3-b3,(a3+b3)/2));




t = out.tout;
out = sim('lab2sim.slx');
e3 = out.e3.Data;
eprim3 = out.eprim3.Data;

y1 = -1.5:0.1:1;
x1 = a3*ones(1,length(y1));
y2 = -1.5:0.1:1;
x2 = -a3*ones(1,length(y2));

y3 = -1.5:0.1:1;
x3 = b3*ones(1,length(y1));
y4 = -1.5:0.1:1;
x4 = -b3*ones(1,length(y2));

figure(6)
hold on
plot(t,e3)
legend('Δ=1','Δ=2','Δ=3','Δ=4','Δ=5')
xlabel('t')
ylabel('e')
%title(sprintf('Δ = %.d, A = %.2f', a3-b3,(a3+b3)/2));


T3 = 2;
a3 = i+1;
b3 = i;
k3 = 1;
B3 = 2;
w3 = 0;
t = out.tout;

figure(7)
hold on
plot(e3,eprim3)
xlabel('e')
ylabel('eprim')
if i==5
plot(x1,y1,'--','Color',[0,0,0])
plot(x2,y2,'--','Color',[0,0,0])
plot(x3,y3,'--','Color',[0,0,0])
plot(x4,y4,'--','Color',[0,0,0])
end
legend('A=1.5','A=2.5','A=3.5','A=4.5','A=5.5','proste przełączeń')
%title(sprintf('Δ = %.d, A = %.2f', a3-b3,(a3+b3)/2));

figure(8)
hold on
plot(t,e3)
legend('T=1','T=2','T=3','T=4','T=5')
xlabel('t')
ylabel('e')
%title(sprintf('Δ = %.d, A = %.2f', a3-b3,(a3+b3)/2));


end
hold off


