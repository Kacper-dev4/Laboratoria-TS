clear all
clc

% I)

%% a)

x0w = [-5,1,5,10];
xp0w = [-3,5,0,4];
w = 0;
B = 1;
for i=1:4
    x0 = x0w(i);
    xp0 = xp0w(i);
    out = sim("czaso_optymal_przyk.mdl");
    
    figure(1)
    hold on
    plot(x,xp)
    xlabel('x')
    ylabel('xp')
    legend('x0=-5, xp0 = -3', 'x0=1, xp0=5','x0=5, xp0=0','x0=10, xp0=4')

    figure(2)
    hold on
    plot(tsim,x)
    xlabel('time, s')
    ylabel('x(t)')
    legend('x0=-5, xp0 = -3', 'x0=1, xp0=5','x0=5, xp0=0','x0=10, xp0=4')
end
%% b) 
x0 = -3;
xp0 = 4;
B = 1;

ww = [-3,-1,1,3];
for i=1:4
   w = ww(i);
    out = sim("czaso_optymal_przyk.mdl");
    
    figure(3)
    hold on
    plot(x,xp)
    xlabel('x')
    ylabel('xp')
    legend('w=-3','w=-1','w=1','w=3')

    figure(4)
    hold on
    plot(tsim,x)
    xlabel('time, s')
    ylabel('x(t)')
    legend('w=-3','w=-1','w=1','w=3')
end

%% c)

x0 = -3;
xp0 = 4;
w = 1;
Bw = [1,2,4,8];

for i=1:4
B = Bw(i);   
    out = sim("czaso_optymal_przyk.mdl");
    
    figure(5)
    hold on
    plot(x,xp)
    xlabel('x')
    ylabel('xp')
    legend('B=1','B=2','B=4','B=8')

    figure(6)
    hold on
    plot(tsim,x)
    xlabel('time, s')
    ylabel('x(t)')
    legend('B=1','B=2','B=4','B=8')
end


% II)