close all 
clear all
clc

%% Zad 1-2:
s = tf('s');

ko = 1;
T1 = 1;
T2 = 1;
T3 = 8;

k = ko/((1+s*T1)*(1+s*T2)*(1+s*T3));
[A,B,C,D] = tf2ss_3rzad(k);

% 
%% Zad 3:
 x0tab = [-2 -2 -2; 1 1 1; 6 6 6];
 u0 = [];
 Imin = [];
% 
 for i = 1 : 3
     R = 0.1;
     Q = C'*C;
     N = 0;
     [K,S,e] = lqr(A,B,Q,R,N);
%     
%     
     x0 = x0tab(i,:);
     tsim = 15;
     sim('A_Model', tsim);
%     
     tytul = [ 'Warunki pocz¹tkowe: [' num2str(x0) ']' ];
     A_Plot(tout,u,x,y,x0,tytul)
     u0 = [u0 ; u(1)];
     Imin = [Imin ; x0*S*x0'];
 end
 [u0 Imin]
 e
 figure; plot(e,'bx'); %title('Wartoœci w³asne')
 xlabel('Re'); ylabel('Im') ; grid on
 if real(e) < 0
     disp('uk³ad jest stabilny')
 end
% 


%% Zad 4:
 x0 = [1 1 1];
 u0 = [];
 Imin = [];
 Etab = [];
% 
 R = 0.1;
 N = 0;
 Qtab = {C'*C, diag([0 1 0]), diag([0 0 1]), diag([1 1 1])};
 Qlegend = { 'c^Tc', 'diag(0, 1, 0)', 'diag(0, 0, 1)' , 'diag(1, 1, 1)' } 
% 
 for i = 1 : 4
%     
     Q = Qtab{i};
     [K,S,e] = lqr(A,B,Q,R,N);
% 
     tsim = 20;
     sim('A_Model', tsim);
%     
     tytul = [ 'Q_' num2str(i) ' = ' Qlegend{i} ];
     A_Plot(tout,u,x,y,x0,tytul)
     u0 = [u0 ; u(1)];
     Imin = [Imin ; x0*S*x0'];
     Etab = [Etab , e];
 end
 [u0 Imin]
 Etab
 figure; 
 plot(Etab(:,1),'rx'); hold on;
 plot(Etab(:,2),'gx'); hold on;
 plot(Etab(:,3),'bx'); hold on;
 plot(Etab(:,4),'kx'); hold off;
 legend('Q_1','Q_2','Q_3','Q_4','Location','NorthEast');
title('Wartoœci w³asne')
 xlabel('Re'); ylabel('Im') ; grid on
 if real(e) < 0
     disp('uk³ad jest stabilny')
 end

%% Zad 4 - inny wykres:
% x0 = [1 1 1];
% u0 = [];
% Imin = [];
% Etab = [];
% 
% R = 0.001;
% N = 0;
% Qtab = {C'*C, diag([0 1 0]), diag([0 0 1]), diag([1 1 1])};
% Qlegend = { 'cTc', 'diag(0, 1, 0)', 'diag(0, 0, 1)' , 'diag(1, 1, 1)' } 
% kolor = ['r','b','g','m'];
% for i = 1 : 4
%     
%     Q = Qtab{i};
%     [K,S,e] = lqr(A,B,Q,R,N);
% 
%     tsim = 10;
%     sim('A_Model', tsim);
%     
%      %tytul = [ 'Macierz diagonalana Q' num2str(i) ' = ' Qlegend{i} ];
%     %A_Plot(tout,u,x,y,x0,tytul)
%     
%     figure(1)
%     plot(tout,x(:,1),kolor(i),'Linewidth',1.5); grid on; hold on
%     title('Zmienna stanu x_1(t) - przybli¿enie', 'FontSize', 12 ); xlabel('t'); ylabel('x_1(t)')
%     
%     figure(2)
%     plot(tout,x(:,2),kolor(i),'Linewidth',1.5); grid on; hold on
%     title('Zmienna stanu x_2(t) - przybli¿enie', 'FontSize', 12 ); xlabel('t'); ylabel('x_2(t)')
%     
%     figure(3)
%     plot(tout,x(:,3),kolor(i),'Linewidth',1.5); grid on; hold on
%     title('Zmienna stanu x_3(t) - przybli¿enie', 'FontSize', 12 ); xlabel('t'); ylabel('x_3(t)')
%     
% %     figure(4)
% %     plot(tout,u,kolor(i),'Linewidth',1.5); grid on; hold on
% %     
% %     figure(5)
% %     plot(tout,y,kolor(i),'Linewidth',1.5); grid on; hold on
% 
% end
% figure(1)
% legend('Q1','Q2','Q3','Q4','Location','NorthEast');
% figure(2)
% legend('Q1','Q2','Q3','Q4','Location','NorthEast');
% figure(3)
% legend('Q1','Q2','Q3','Q4','Location','NorthEast');


%% Zad 5:
 x0 = [1 1 1];
 u0 = [];
 Imin = [];
 Etab = [];
 N = 0;
% 
 Rtab = [0.05 0.1 0.5 1];
 kolor = ['r' 'g' 'b' 'm'];
 
 for i = 1 : 4
     R = Rtab(i);
     Q = C'*C;
     [K,S,e] = lqr(A,B,Q,R,N);
% 
     tsim = 15;
     sim('A_Model', tsim);
% 
     figure(51)
     plot(tout, u, kolor(i));
     xlabel('t'); ylabel('u(t)'); grid on;
    title('Wp³yw R na u(t)');
     hold on;
% 
     figure(52)
     plot(tout, y, kolor(i));
     xlabel('t'); ylabel('y(t)'); grid on;
     title('Wp³yw R na y(t)');
     hold on;
% 
% 
     u0 = [u0 ; u(1)];
     Imin = [Imin ; x0*S*x0'];
     Etab = [Etab , e];
 end
 figure(51)
 legend(['R = ' num2str(Rtab(1))], ['R = ' num2str(Rtab(2))],...
        ['R = ' num2str(Rtab(3))], ['R = ' num2str(Rtab(4))]);
% 
 figure(52)
 legend(['R = ' num2str(Rtab(1))], ['R = ' num2str(Rtab(2))],...
        ['R = ' num2str(Rtab(3))],['R = ' num2str(Rtab(4))]);
 
 [u0 Imin]
 Etab
 figure(53) 
 plot(Etab(:,1),'rx'); hold on;
 plot(Etab(:,2),'gx'); hold on;
 plot(Etab(:,3),'bx'); hold on;
 plot(Etab(:,4),'mx'); hold on;
 
 legend(['R = ' num2str(Rtab(1))], ['R = ' num2str(Rtab(2))],...
        ['R = ' num2str(Rtab(3))],['R = ' num2str(Rtab(4))],  'Location','SouthWest');
title('Wartoœci w³asne')
 xlabel('Re'); ylabel('Im') ; grid on
 if real(e) < 0
     disp('uk³ad jest stabilny')
 end
