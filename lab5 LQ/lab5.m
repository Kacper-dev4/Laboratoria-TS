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
[K,S,lambda] = lqr(A,B,Q,R);


%% Zad3
results = table();
time = 50;
x0w = [1,0,0;
    1,2,3;
    0,1,1];
figure(100)
plot(real(lambda), imag(lambda), 'x', 'MarkerSize',8, 'LineWidth',2);
xlabel('Re')
ylabel('Im')
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

results = table();
time = 50;
Qw{1} =C'*C;
Qw{2} = diag([0,1,0]);
Qw{3} = diag([0,0,1]);
Qw{4} = diag([1,1,1]);
x0 = [1,2,3]';
for i=1:4
    Q = Qw{i};
   [K,S,lambda] = lqr(A,B,Q,R);
    t = sim("A_Model.slx");

    u0   = -K * x0;
    Imin = x0' * S * x0;
    
    switch i
        case 1
            leg_text = sprintf('Q = C''C');
        case 2 
            leg_text = sprintf('Q = diag{0,1,0}');
        case 3 
            leg_text = sprintf('Q = diag{0,0,1}');
        case 4 
            leg_text = sprintf('Q = diag{1,1,1}');
    end

    results = [results; table({leg_text}, u0, Imin, ...
        'VariableNames',{'Q', 'u_0', 'I_min'})];

    figure(5)
    hold on
    plot(t,y,'DisplayName', leg_text)
    xlabel('t')
    ylabel('y(t)')
    legend()

    figure(6)
    hold on
    plot(t,x(:,2),'DisplayName', leg_text)
    xlabel('t')
    ylabel('x2(t)')
    legend()

    figure(7)
    hold on
    plot(t,x(:,3),'DisplayName', leg_text)
    xlabel('t')
    ylabel('x3(t)')
    legend()

    figure(8)
    hold on
    plot(t,u,'DisplayName', leg_text)
    xlabel('t')
    ylabel('u(t)')
    legend()

    figure(9)
    hold on 
    plot(real(lambda), imag(lambda), 'x','DisplayName',leg_text, 'MarkerSize',8, 'LineWidth',2);
    xlabel('Re')
    ylabel('Im')
    legend()
end

disp(results);

%% Zad 5

results = table();
time = 50;
Rw = [0.1, 0.25, 0.75, 1];
x0 = [1,2,3]';
for i=1:4
    R = Rw(i);
   [K,S,lambda] = lqr(A,B,Q,R);
    t = sim("A_Model.slx");

    u0   = -K * x0;
    Imin = x0' * S * x0;
   
    leg_text = sprintf('p = %.2f',Rw(i)); 

    results = [results; table({leg_text}, u0, Imin, ...
        'VariableNames',{'p', 'u_0', 'I_min'})];

    figure(10)
    hold on
    plot(t,y,'DisplayName', leg_text)
    xlabel('t')
    ylabel('y(t)')
    legend()

    figure(11)
    hold on
    plot(t,u,'DisplayName', leg_text)
    xlabel('t')
    ylabel('u(t)')
    legend()

    figure(12)
    hold on 
    plot(real(lambda), imag(lambda), 'x','DisplayName',leg_text, 'MarkerSize',8, 'LineWidth',2);
    xlabel('Re')
    ylabel('Im')
    legend()
end

disp(results);

%%% B


%% Zad 6

zadaneWartosciWlasne = [-4,-5,-7];
h = place(A',C',zadaneWartosciWlasne');
h=h';

%% Zad7

% Simulink ale to już jest B_Model.slx

%% Zad8 

time = 50;
u = 1;
t1 = 2;
xo_obs = 0;
xo = 1;
t = sim("B_Model.slx");
for i=1:3
    leg_text = sprintf('x%g',i);
    figure(13)
    hold on
    plot(t,x(:,i),'DisplayName', leg_text)
    xlabel('t')
    ylabel('x(t)')
    leg_text = sprintf('xo%g',i);
    legend()

    figure(14)
    hold on
    plot(t,xO(:,i),'DisplayName', leg_text)
    xlabel('t')
    ylabel('xo(t)')
    legend()
end

%% Zad 9
zadaneWartosciWlasneW{1} = [-1,-2,-3];
zadaneWartosciWlasneW{2} = [-1,-5,-10];
zadaneWartosciWlasneW{3} = [-2,-4,-8];
u = 1;
t1 = 2;
xo_obs = 0;
xo = 1;


for i=1:3
zadaneWartosciWlasne = zadaneWartosciWlasneW{i};
h = place(A',C',zadaneWartosciWlasne');
hw{i} = h;
h=h';
t = sim("B_Model.slx");
leg1 = sprintf('x%g',1);
leg2 = sprintf('xo%g',1);
figure(11+i*3)
 hold on
    plot(t,x(:,1))
    plot(t,xO(:,1))
    xlabel('t')
    ylabel('x(t) oraz xo(t)')
    legend(leg1, leg2)
     title(sprintf('Wartości składowe [%d %d %d]',zadaneWartosciWlasne(1),zadaneWartosciWlasne(2),zadaneWartosciWlasne(3) ))
hold off

leg1 = sprintf('x%g',1);
leg2 = sprintf('xo%g',1);
figure(12+i*3)
 hold on
    plot(t,x(:,2))
    plot(t,xO(:,2))
    xlabel('t')
    ylabel('x(t) oraz xo(t)')
    legend(leg1, leg2)
    title(sprintf('Wartości składowe [%d %d %d]',zadaneWartosciWlasne(1),zadaneWartosciWlasne(2),zadaneWartosciWlasne(3) ))
hold off

leg1 = sprintf('x%g',1);
leg2 = sprintf('xo%g',1);
figure(13+i*3)
 hold on
    plot(t,x(:,3))
    plot(t,xO(:,3))
    xlabel('t')
    ylabel('x(t) oraz xo(t)')
    legend(leg1, leg2)
     title(sprintf('Wartości składowe [%d %d %d]',zadaneWartosciWlasne(1),zadaneWartosciWlasne(2),zadaneWartosciWlasne(3) ))
hold off

end