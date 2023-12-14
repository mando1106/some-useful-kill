clc;clear;close all

% fx=@(x,m) x.^m;
var=0.05;k=2;
fx=@(x,m) abs(x).^m.*sign(x);
fxx=@(x,m) (abs(x)>var) .* abs(x).^m.*sign(x) + (abs(x)<=var) .*x*k;

t=-2:1e-3:2;

k=[0.3  1  2];
figure;
for i=1:size(k,2)
    y=feval(fxx,t,k(i));
    h=plot(t,y);hold on;
end




%% 求微分方程解析解 sliding face
clc;clear; 
%TSM
syms x(t) b a x0
% eqn = diff(x,t) == -b*abs(x)^a*sign(x);
eqn = diff(x,t) == -b*x^a;
cond=x(0)==x0;
S = dsolve(eqn,cond)
an=solve(S==0,t)
simplify(an)
%% FTSM
clc;clear; 
syms x(t) b a x0 l

eqn = diff(x,t) ==-a*x-b*x^0.3;
% eqn = diff(x,t) ==-a*x-b*abs(x)^l*sign(x);
cond=x(0)==x0;
S = dsolve(eqn,cond)
an=solve(S==0,t)
simplify(an)
% 
%% NTSM

clc;clear; 
syms x(t) b a x0 l

eqn = diff(x,t)^(1.3) ==-a*x;
% eqn = diff(x,t) ==-a*x-b*abs(x)^l*sign(x);
cond=x(0)==x0;
S = dsolve(eqn,cond)
an=solve(S==0,t)
simplify(an)






