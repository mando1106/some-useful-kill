


%% Initialize system
clear; close all; clc;

x_limits = [-5, 5];
y_limits = [-5, 5];
nb_gridpoints = 30;

% mesh domain
[X, Y] = meshgrid(linspace(x_limits(1), x_limits(2), nb_gridpoints), ...
                  linspace(y_limits(1), y_limits(2), nb_gridpoints));

x_dot = zeros(nb_gridpoints);
y_dot = zeros(nb_gridpoints);

%% Compute and Draw Nominal Linear DS
A = [-1, 0; 
     0, -1];  %% Linear DS with stable attractor 
x01 = [-1; 1];  
b1 = -A*x01;   % Attractor coordinate are at Ax+b=0 

% Compute the DS
for i=1:nb_gridpoints
    for j=1:nb_gridpoints

%         dx=-(abs(X(i,j)))^0.3*sign(X(i,j));
%         x_dot(i,j) = 0;
%         y_dot(i,j) = dx; 
        ddx=0.3*abs(X(i,j))^(0.3-1)*Y(i,j);
        x_dot(i,j)=Y(i,j);
        y_dot(i,j) = ddx; 

    end
end

% Plot DS
f = figure(1); 
screensize = get(groot, 'Screensize'); 
f.Position = [0.05  * screensize(3), 0.1  * screensize(4), 0.6 * screensize(3), 0.8 * screensize(4)];  
subplot(2,2,1); hold on; 
plot_ds(X, Y, x_dot, y_dot, [0;0], 'Nominal Linear DS', 'streamslice');

%% Modulated DS - create non-linear DS 

% Coordinates of 3 modulators
z1=[-2; -3];
z2=[2; 3];
z3=[-2; 3];

sigma = 1; % Kernel width for effect of modulator

for i=1:nb_gridpoints
    for j=1:nb_gridpoints

         gamma1 = exp(-(1 / sigma^2) * norm([X(i,j); Y(i,j)] - z1)) + ...
                  exp(-(1 / sigma^2) * norm([X(i,j); Y(i,j)] - z2)) + ...
                  exp(-(1 / sigma^2) * norm([X(i,j); Y(i,j)] - z3)); 
          M1 = [1, 5*gamma1;
                0, 1];  % Modulation
       
        w = M1 * (A * [X(i,j); Y(i,j)] + b1); 
        x_dot(i,j) = w(1); 
        y_dot(i,j) = w(2); 
    end
end

% Plot DS
subplot(2,2,2); hold on; 
% plot_ds can either be called with 'streamslice' or 'streamline' for the
% plotting type of the DS (see function definition at the end of the file)
plot_ds(X, Y, x_dot, y_dot, x01, ...
    'Modulated DS with 3 nonlinearities', 'streamslice', [z1, z2, z3])

%% ------ Write your code below ------
%  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv %
x_limits = [-5, 5];
y_limits = [-5, 5];
nb_gridpoints = 30;

% mesh domain
[X, Y] = meshgrid(linspace(x_limits(1), x_limits(2), nb_gridpoints), ...
                  linspace(y_limits(1), y_limits(2), nb_gridpoints));

x_dot = zeros(nb_gridpoints);
y_dot = zeros(nb_gridpoints);

x01=[0; 0];

% Compute the DS
for i=1:nb_gridpoints
    for j=1:nb_gridpoints

%         w = [ 0 1;-1 -2] * [X(i,j); Y(i,j)] ; 
        if abs(X(i,j))>=2
            w = [ 0 1;-1 -2] * [X(i,j)^3; Y(i,j)] ;
        else
            w = [ 0 1;-1 -2] * [X(i,j); Y(i,j)] ;
        end   
        x_dot(i,j) = w(1);
        y_dot(i,j) = w(2); 
    end
end

subplot(2,2,3); 
hold on; 

plot_ds(X, Y, x_dot, y_dot, x01, 'Nominal Linear DS', 'streamslice');


x_limits = [-5, 5];
y_limits = [-5, 5];
nb_gridpoints = 30;

% mesh domain
[X, Y] = meshgrid(linspace(x_limits(1), x_limits(2), nb_gridpoints), ...
                  linspace(y_limits(1), y_limits(2), nb_gridpoints));

x_dot = zeros(nb_gridpoints);
y_dot = zeros(nb_gridpoints);

x01=[0; 0];

% Compute the DS
for i=1:nb_gridpoints
    for j=1:nb_gridpoints

%         w = [ 0 1;-1 -2] * [X(i,j); Y(i,j)] ; 
        if abs(X(i,j))>=2
            w = [ 0 1;-1 -2] * [X(i,j); Y(i,j)] ;
        else
            w = [ 0 1;-1 -2] * [X(i,j)^3; Y(i,j)] ;
        end       
        x_dot(i,j) = w(1);
        y_dot(i,j) = w(2); 
        
    end
end

subplot(2,2,4); 
hold on; 

plot_ds(X, Y, x_dot, y_dot, x01, 'Nominal Linear DS', 'streamslice');

% Mycolormap('AddColormapControls',80);  



%% Exercice 2.1.1 - One local rotation

% TODO : Uncomment and program one rotation

% Rotation angle and location of modulation
% theta = ; % Rotation angle
% z1 = ; % Coordinations of modulation
% sigma = ; % Kernel width for effect of modulator
% 
% for i=1:nb_gridpoints 
%     for j=1:nb_gridpoints
% 
%         % Rotation
%         gamma = ; 
%         M = ;          
%       
%         w =; 
%         x_dot(i,j) = w(1); 
%         y_dot(i,j) = w(2); 
%     end
% end

% % Plot DS
% subplot(2,2,3); hold on;
% plot_ds(X, Y, x_dot, y_dot, x01, ...
%    'Modulated DS with one rotation', 'streamslice', z1);

%% Exercice 2.1.2 - Two local rotations

% TODO : Uncomment and program two rotations

% Rotation angle and location of modulation
% theta = ; [deg]
% z1 = ;
% z2 = ;
% sigma = ;
% 
% for i=1:nb_gridpoints 
%     for j=1:nb_gridpoints
% 
%         % First rotation
%         gamma1 = ; 
%         M1 = ;
% 
%         % Second rotation
%         gamma2 = ; 
%         M2 = ;
%        
%         w = ;
%         x_dot(i,j) = w(1); 
%         y_dot(i,j) = w(2); 
%     end
% end

% % Plot DS
% subplot(2,2,4); hold on;
% plot_ds(X, Y, x_dot, y_dot, x01, ...
%   'Modulated DS with two rotations', 'streamslice', [z1, z2]);

%  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ &
%% ------ Write your code above ------


%% Plotting functions

function plot_ds(x, y, x_dot, y_dot, x0, titleName, type, x_target)
% PLOT_DS  Plot a dynamical system on a grid.
%   PLOT_DS(X, Y, X_DOT, Y_DOT, X0, TITLENAME, TYPE, X_TARGET) where the 
%   arrays X,Y define the coordinates for X_DOT,Y_DOT and are monotonic and
%   2-D plaid (as if produced by MESHGRID), plots a dynamical system with
%   attractor(s) X0 given as 2xN vector data and name TITLENAME.
%
%   The variable TYPE is one of 'streamslice', 'streamline' and defines the
%   plotting style of the DS.
%
%   The optional variable X_TARGET given as 2xN vector data can be used to
%   plot additional points of interest (e.g. local modulation points).
    
    title(titleName)
    [~, h] = contourf(x, y, sqrt(x_dot.^2 + y_dot.^2), 80);
    set(h, 'LineColor', 'none');
    colormap('summer');
    c_bar = colorbar;
    c_bar.Label.String = 'Absolute velocity';
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
    set(h_stream, 'HandleVisibility', 'off');
    axis equal;

    scatter(x0(1, :), x0(2, :), 100, 'r*', 'LineWidth', 2);

    if exist('x_target', 'var')
        scatter(x_target(1, :), x_target(2, :), 100, 'bd', 'LineWidth', 2);
    end
end