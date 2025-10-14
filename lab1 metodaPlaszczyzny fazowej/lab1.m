clear all
clc


for i = 1:4
 aw = [0.5, 1, 2, 5];
 a=aw(i);
%a = 1;
%bw = [1,2,3,8];
%b = bw(i);
b=2;
%cw = [1.5,3,6,12];
%c = cw(i);
c = 3;
x0 = 1.416;
xprim0 = 0;
out = sim('lab1sim.slx');

x = out.x.Data;
xprim = out.xprim.Data;
t = out.tout;

figure(1)
hold on
plot(x,xprim)
title('Portret fazowy')
xlabel('x')
ylabel('xprim')
legend('a=0.5', 'a=1', 'a=2','a=5')
%legend('b=1', 'b=2', 'b=3', 'b=8')
%legend('c=1.5', 'c=3', 'c=6', 'c=12')
end

hold off


% figure
% plot(t,x)
% title('Wykres zmiany x w czasie')
% xlabel('Czas')
% ylabel('x')
% 
% 
% figure
% plot(t,xprim)
% title('Wykres zmiany pochodnej x w czasie')
% xlabel('Czas')
% ylabel('xprim')
