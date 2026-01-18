clear all
clc

N = 1;
D = 1;
T0 = 0;
a = 0;
wariancja = 0;
amp = 0;
% I)

%% a)
time = 50;
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
time = 50;
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
time = 50;

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
%% a)
time = 30;
x0 = -3;
xp0 = 4;
w = 1;
B = 1;
s = tf('s');
T = 0.1;
Rzadw = [1 2 4 8];
N = 1;

for i=1:4
    n = Rzadw(i);
    D = (1+s*T)^n;
    K = N/D;
    [num,D] = tfdata(K,'v');
    out = sim('czaso_optymal_przyk.mdl');

     figure(7)
    hold on
    plot(x,xp)
    xlabel('x')
    ylabel('xp')
    legend('n=1','n=2','n=4','n=8')

    figure(8)
    hold on
    plot(tsim,x)
    xlabel('time, s')
    ylabel('x(t)')
    legend('n=1','n=2','n=4','n=8')
    
end

%% b)

N = 1; 
D = 1;
T0w = [0,1,4,8];

time = 15;
x0 = 1;
xp0 = 0;
w = 1;
B = 1;

for i=1:4
T0 = T0w(i);
    out = sim('czaso_optymal_przyk.mdl');

    figure(9)
    hold on
    plot(x,xp)
    xlabel('x')
    ylabel('xp')
    legend('T0=0','T0=2','T0=4','T0=8')

    figure(10)
    hold on
    plot(tsim,x)
    xlabel('time, s')
    ylabel('x(t)')
     legend('T0=0','T0=2','T0=4','T0=8')
    
end

%% c)

N = 1; 
D = 1;
time = 30;
x0 = -3;
xp0 = 4;
w = 1;
B = 1;
T0 = 0;

wariancjaw = [0, 1, 2, 4]; 

for i=1:4
wariancja = wariancjaw(i);
    out = sim('czaso_optymal_przyk.mdl');

    figure(11)
    hold on
    plot(x,xp)
    xlabel('x')
    ylabel('xp')
    legend('var=0','var=1','var=2','var=4')

    figure(12)
    hold on
    plot(tsim,x)
    xlabel('time, s')
    ylabel('x(t)')
    legend('var=0','var=1','var=2','var=4')
    
end

% III)
%% a)

N = 1; 
D = 1;
time = 30;
x0 = -3;
xp0 = 4;
w = 1;
B = 1;
T0 = 0;
wariancja = 0;
aw = [0, 1, 2, 4]; 

for i=1:4
a = aw(i);
    out = sim('czaso_optymal_przyk.mdl');

    figure(13)
    hold on
    plot(x,xp)
    xlabel('x')
    ylabel('xp')
    legend('a=0','a=1','a=2','a=4')

    figure(14)
    hold on
    plot(tsim,x)
    xlabel('time, s')
    ylabel('x(t)')
    legend('a=0','a=1','a=2','a=4')

    
end

 %% b)
% 
% N = 1; 
% D = 1;
% time = 30;
% x0 = -3;
% xp0 = 4;
% w = 1;
% B = 1;
% T0 = 0;
% wariancja = 0;
% 
% aw = [0.4, 0.6, 0.9, 1];
% for i=1:4
% a = aw(i);
%     out = sim('czaso_optymal_przyk.mdl');
% 
%     figure(15)
%     hold on
%     plot(x,xp)
%     xlabel('x')
%     ylabel('xp')
%     legend('a=0.4','a=0.6','a=0.9','a=1')
% 
%     figure(16)
%     hold on
%     plot(tsim,x)
%     xlabel('time, s')
%     ylabel('x(t)')
%     legend('a=0.4','a=0.6','a=0.9','a=1')
% 
% 
% end

%% c)

% N = 1; 
% D = 1;
% time = 30;
% x0 = -3;
% xp0 = 4;
% w = 1;
% B = 1;
% T0 = 0;
% wariancja = 0;
% bw = [1, 2, 3, 4]; 
% aw = [2, 4, 6, 8];
% for i=1:4
% a = aw(i);
% b = bw(i);
%     out = sim('czaso_optymal_przyk.mdl');
% 
%     figure(17)
%     hold on
%     plot(x,xp)
%     xlabel('x')
%     ylabel('xp')
%     legend('b=1, a=2','b=2, a=4','b=3, a=6','b=4, a=8')
% 
%     figure(18)
%     hold on
%     plot(tsim,x)
%     xlabel('time, s')
%     ylabel('x(t)')
%     legend('b=1, a=2','b=2, a=4','b=3, a=6','b=4, a=8')
% 
% 
% end

% IV) 

%% a)

N = 1; 
D = 1;
time = 30;
x0 = -3;
xp0 = 4;
w = 1;
B = 1;
T0 = 0;
a = 0;
wariancjaw = [0, 0.5, 1, 6]; 

for i=1:4
wariancja = wariancjaw(i);
    out = sim('czaso_optymal_przyk.mdl');

    figure(19)
    hold on
    plot(x,xp)
    xlabel('x')
    ylabel('xp')
    legend('var=0','var=0.5','var=1','var=6')

    figure(20)
    hold on
    plot(tsim,x)
    xlabel('time, s')
    ylabel('x(t)')
    legend('var=0','var=0.5','var=1','var=6')
    
end

%% b) 

N = 1; 
D = 1;
time = 30;
x0 = -3;
xp0 = 4;
w = 1;
B = 1;
T0 = 0;
a = 0;
ampw = [0, 0.5, 1, 4]; 

for i=1:4
amp = ampw(i);
    out = sim('czaso_optymal_przyk.mdl');

    figure(21)
    hold on
    plot(x,xp)
    xlabel('x')
    ylabel('xp')
    legend('amp=0','amp=0.5','amp=1','amp=4')

    figure(22)
    hold on
    plot(tsim,x)
    xlabel('time, s')
    ylabel('x(t)')
    legend('amp=0','amp=0.5','amp=1','amp=4')
    
end


