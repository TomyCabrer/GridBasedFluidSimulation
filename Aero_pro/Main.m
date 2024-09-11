% Imperial College London Student Lisence
% Copy right (c) Bartolome Cabrer Falomir

clear
Geometry % Initialize geometry parameters
createUI % Create the user interface (UI) for simulation control

global sim_params % Declare global variables to share parameters across functions
X=sim_params.X; % X-coordinates grid based on simulation parameters
Y=sim_params.Y; % Y-coordinates grid based on simulation parameters

% Declare another global variable to store results from the simulation
global sim_results
u=sim_results.u; % Velocity field in the x-direction
v=sim_results.v; % Velocity field in the y-direction
p=sim_results.p; % Pressure field


% Possible figures

% figure
% surf(X,Y,u)
% figure
% quiver(X,Y,u,v)
% quiver(X, Y, u, v, 'AutoScale', 'on', 'AutoScaleFactor', 2, 'Color', 'b', 'LineWidth', 1.5);
% quiver(X, Y, u, v, 'MaxHeadSize', 0.5, 'LineWidth', 1.5);
% xlabel('X');
% ylabel('Y');
% title('Quiver Plot of Velocity Field (u, v)');
% figure
% streamslice(X,Y,u,v)
% xlabel('X');
% ylabel('Y');
% title('Streamslice Plot of Velocity Field (u, v)');
% figure
% hold on
% contourf(X,Y,p)
% %plot(xx, yy, 'ok', 'MarkerSize', 4)
% colormap('jet');
% colorbar;
% xlabel('X');
% ylabel('Y');
% title('Contour Plot of Pressure (Pa)');
% figure
% contourf(X,Y,v)
% colorbar;
