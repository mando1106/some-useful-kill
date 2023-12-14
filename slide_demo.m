
clc;clear;close all
x_limits = [-5, 5];
y_limits = [-5, 5];
nb_gridpoints = 30;
lamda=0.5
% mesh domain
[X, Y] = meshgrid(linspace(x_limits(1), x_limits(2), nb_gridpoints), ...
                  linspace(y_limits(1), y_limits(2), nb_gridpoints));

x_dot = zeros(nb_gridpoints);
y_dot = zeros(nb_gridpoints);
x01=[0;0];
for i=1:nb_gridpoints
    for j=1:nb_gridpoints
        s(i,j)=Y(i,j)+abs(X(i,j))^lamda*sign(X(i,j));
        
        ddx=-s(i,j)-lamda*abs(X(i,j))^(lamda-1)*Y(i,j);
        x_dot(i,j)=Y(i,j);
        y_dot(i,j) = ddx; 
    end
    dx(i)=-abs(X(1,i))^lamda*sign(X(1,i));
end

f = figure(1); 
screensize = get(groot, 'Screensize'); 
f.Position = [0.05  * screensize(3), 0.1  * screensize(4), 0.6 * screensize(3), 0.8 * screensize(4)];  
subplot(2,3,1); hold on; 
plot_ds(X, Y, x_dot, y_dot,s,dx, x01, 'Nominal Linear DS', 'streamslice');
xlabel('Time','FontSize',8,'FontName','Times New Roman');
ylabel('Y','FontSize',8,'FontName','Times New Roman');
%% 
clc;clear;
x_limits = [-5, 5];
y_limits = [-5, 5];
nb_gridpoints = 30;
lamda=0.5
% mesh domain
[X, Y] = meshgrid(linspace(x_limits(1), x_limits(2), nb_gridpoints), ...
                  linspace(y_limits(1), y_limits(2), nb_gridpoints));

x_dot = zeros(nb_gridpoints);
y_dot = zeros(nb_gridpoints);
x01=[0;0];
for i=1:nb_gridpoints
    for j=1:nb_gridpoints
        s(i,j)=Y(i,j)+abs(X(i,j))^lamda*sign(X(i,j));
        
        ddx=-s(i,j)-lamda*abs(X(i,j))^(lamda-1)*Y(i,j);
        x_dot(i,j)=Y(i,j);
        y_dot(i,j) = ddx; 
    end
    dx(i)=-abs(X(1,i))^lamda*sign(X(1,i));
end

subplot(2,3,2); hold on; 
plot_ds(X, Y, x_dot, y_dot,s,dx, x01, 'Nominal Linear DS', 'streamslice');
yticklabels(gca,{});
ax=gca;
xlabel('Time','FontSize',8,'FontName','Times New Roman');
%% 
clc;clear;
x_limits = [-5, 5];
y_limits = [-5, 5];
nb_gridpoints = 30;
lamda=0.5
% mesh domain
[X, Y] = meshgrid(linspace(x_limits(1), x_limits(2), nb_gridpoints), ...
                  linspace(y_limits(1), y_limits(2), nb_gridpoints));

x_dot = zeros(nb_gridpoints);
y_dot = zeros(nb_gridpoints);
x01=[0;0];
for i=1:nb_gridpoints
    for j=1:nb_gridpoints
        s(i,j)=Y(i,j)+abs(X(i,j))^lamda*sign(X(i,j));
        
        ddx=-s(i,j)-lamda*abs(X(i,j))^(lamda-1)*Y(i,j);
        x_dot(i,j)=Y(i,j);
        y_dot(i,j) = ddx; 
    end
    dx(i)=-abs(X(1,i))^lamda*sign(X(1,i));
end

subplot(2,3,3); hold on; 
plot_ds(X, Y, x_dot, y_dot,s,dx, x01, 'Nominal Linear DS', 'streamslice');
yticklabels(gca,{});
xlabel('Time','FontSize',8,'FontName','Times New Roman');
% linkaxes([subplot(2,3,1) subplot(2,3,2) subplot(2,3,3)], 'y');
%% 


function plot_ds(x, y, x_dot, y_dot,s,dx, x0, titleName, type, x_target)

    num=80;
    title(titleName)
%     [~, h] = contourf(x, y, s, num);
%     set(h, 'LineColor', 'none');
%     colormap('summer');
%     c_bar = colorbar;
%     c_bar.Label.String = 'Absolute velocity';
    if exist('type', 'var')
        if strcmp(type, 'streamline')
            h_stream = streamline(x, y, x_dot, y_dot, x(1:2:end, 1:2:end), y(1:2:end, 1:2:end));
        elseif strcmp(type, 'streamslice')
            h_stream = streamslice(x, y, x_dot, y_dot, 2, 'method', 'cubic');
        else
            error('Unsupported plot type');
        end
    else
        error("Set plot type ('streamline' or 'streamslice')");
    end
    set(h_stream, 'LineWidth', 1);
    set(h_stream, 'color', [0. 0. 0.]);
%     set(h_stream, 'HandleVisibility', 'off');
%     set(h_stream,'Box','on')
%     plot(x(1,:),dx,'LineWidth',2,'Color',[180 0 0]./255);hold on;

    l=size(dx,2);
    Index=floor(l/2);
    x1=x(1,1:Index);y1=dx(1,1:Index);
    x2=x(1,Index:end);y2=dx(1,Index:end);
    x2=fliplr(x2);y2=fliplr(y2);


    arrowPlot(x1,y1,'number', 2, 'color', 'r', 'LineWidth', 2, 'scale', 2, 'ratio', 'equal');hold on
     arrowPlot(x2,y2,'number', 2, 'color', 'r', 'LineWidth', 2, 'scale', 2, 'ratio', 'equal');hold on




    scatter(x0(1, :), x0(2, :), 100, 'b*', 'LineWidth', 2);hold on
%     axis equal;
    xlim([-5,5]);ylim([-5,5]);
    ax=gca;
    set(gca,'Box','on');
    ax.FontName = 'Times New Roman';
 
    
    if exist('x_target', 'var')
        scatter(x_target(1, :), x_target(2, :), 100, 'bd', 'LineWidth', 2);
    end
%     Mycolormap('AddColormapControls',num); 
end




