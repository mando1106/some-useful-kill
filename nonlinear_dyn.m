%  nonlinear admittance
% 定义时间范围
tspan = [0 10];
% 初始状态
y0 = [0 0];
% 输入函数（这里简单地使用一个步进输入）
u = @(t)  (t >= 2) *1 + (t<2) *0;
% 调用 ode45 求解微分方程
[t, y] = ode45(@(t, x) non_dyn(t, x, u(t)), tspan, y0);
plot(t,y)

function Dx=non_dyn(t,x,u)
m=1;k=2;c=2;

dx=x(2);
ddx=1/(m)*(-k*(x(1)^3)-c*x(2)+u);
Dx=[dx;ddx];

end