function [A,b,c,d]=tf2ss_3rzad(K)
%[A,b,c,d]=tf2ss_3rzad(K)
%Funkcja dokonuje konwersji transmitancji K=k/(a0*s^3 + a1 s^2 + a2 s + a3) 
%na opis w postaci rownan stanu:
%.
%x = Ax + bu,
%y = cx + du, d=0;
%gdzie wektor stanu x zdefiniowany jest w nastepujacy sposob:
%         .     ..    
%x1=y, x2=y, x3=y



[NUM,DEN] = tfdata(K,'v');

if size(DEN,2)~=4
    disp(' ')
    disp('Uwaga: W chwili obecnej konwersja mozliwa jest tylko dla inercji III-go rzedu !!!')
    disp(' ')
    A=[];b=[];c=[];d=[];
    return
end

a0=DEN(1);
NUM=NUM/a0;
DEN=DEN/a0;

a0=DEN(1);
a1=DEN(2);
a2=DEN(3);
a3=DEN(4);

b0=NUM(4);

A=[0 1 0
   0 0 1
  -a3 -a2 -a1];
b=[0;0;b0];
c=[1;0;0]';
d=0;