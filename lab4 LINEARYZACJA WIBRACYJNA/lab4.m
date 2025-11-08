clear all 
clc
close all


%% Zad1
stop_time = 100;


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

end

