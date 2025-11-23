clear all 
clc
%%% A 
%% Zad1
s = tf('s');

ko = 1;
T1 = 1;
T2 = 1;
T3 = 8;

k = ko/((1+s*T1)*(1+s*T2)*(1+s*T3));
[A,B,C,D] = tf2ss_3rzad(k);

%% Zad2
Q = C'*C;
R = 1;
Ts= 0.01;
[K,S,lambda] = lqr(A,B,Q,R);
%% Zad3
results = table();
time = 50;
x0w = [1,0,0;
    1,2,3;
    0,1,1];
for i=1:3
    x0 = x0w(i,:)';
    t = sim("A_Model.slx");

    u0   = -K * x0;
    Imin = x0' * S * x0;
    results = [results; table({mat2str(x0')}, u0, Imin, ...
        'VariableNames',{'x0','u_0','I_min'})];
    leg_text = sprintf('x_0 = [%g  %g  %g]', x0(1), x0(2), x0(3));

    figure(1)
    hold on
    plot(t,y,'DisplayName', leg_text)
    xlabel('t')
    ylabel('y(t)')
    legend()

    figure(2)
    hold on
    plot(t,x(:,2),'DisplayName', leg_text)
    xlabel('t')
    ylabel('x2(t)')
    legend()

    figure(3)
    hold on
    plot(t,x(:,3),'DisplayName', leg_text)
    xlabel('t')
    ylabel('x3(t)')
    legend()

    figure(4)
    hold on
    plot(t,u,'DisplayName', leg_text)
    xlabel('t')
    ylabel('u(t)')
    legend()
end

disp(results);

%% Zad4




