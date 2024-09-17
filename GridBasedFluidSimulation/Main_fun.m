
function Main_fun()
% Main simulation function
% This function simulates fluid flow using a specified grid and boundary conditions.
% It uses the Runge-Kutta 4th order method for advection, solves the pressure equation 
% using Jacobi iterations, and visualizes particle movement.

close all
global sim_params
s = sim_params.s;            % Grid size
ar = sim_params.ar;          % Aspect ratio
ob = sim_params.ob;          % Obstacle information
viscosity = sim_params.vis;

% Create meshgrid based on grid size and aspect ratio
[X, Y] = meshgrid(1:sim_params.s*sim_params.ar, 1:sim_params.s);

% Initialize pressure and velocity fields
p = zeros(s, s*ar); % Pressure field
u = p;  % Velocity field in x-direction
v = p;  % Velocity field in y-direction

% Initial positions of particles
[int_x, int_y] = meshgrid(1:2, 1:s);
% Reshape to column vectors
px = int_x(:);
py = int_y(:);  

% Save initial positions for the inflow
pxo = px;
pyo = py;

% Define obstacle regions
obstacle = ob;  % Use the predefined obstacle from the global parameters


% Remove zero values from obstacle coordinates
[yy, xx] = find(obstacle);

% Create figure to check if it's closed
f = figure(1);

% Main simulation loop: continues until the figure is closed
while ishandle(f)
    % Set initial velocity in a specific region for particles
    v(int_y, int_x) = 0;
    u(int_y, int_x) = 1;

    % Apply viscous effects using the Laplacian operator
    u = u + viscosity * laplacian(u);
    v = v + viscosity * laplacian(v);

    % Enforce obstacle boundary conditions
    u(obstacle) = 0;
    v(obstacle) = 0;
    p(obstacle) = 0;    % Ensure pressure is zero inside the obstacle

    % Compute right-hand side for pressure equation
    rhs = -divergence(u, v);

    % Jacobi iteration to solve for pressure (100 iterations for convergence)
    for i = 1:100
        p = conv2(p, [0 1 0; 1 0 1; 0 1 0]/4, 'same') + rhs/4;
    end

    [dx, dy] = gradient(p); % Calculate pressure gradients in x and y directions

    % Compute velocity gradient and update velocities for non-boundary pixels
    u(2:end-1, 2:end-1) = u(2:end-1, 2:end-1) - dx(2:end-1, 2:end-1);
    v(2:end-1, 2:end-1) = v(2:end-1, 2:end-1) - dy(2:end-1, 2:end-1);

    % Enforce obstacle boundary conditions again
    u(obstacle) = 0;
    v(obstacle) = 0;
    p(obstacle) = 0;     % Ensure pressure is zero inside the obstacle

    % Advect velocity field using Runge-Kutta 4th order method (backward advection)
    [pu, pv] = Runge_Kutta(X, Y, u, v, -1);
    u = interp2(u, pu, pv, 'linear', 0);
    v = interp2(v, pu, pv, 'linear', 0);

    % Advect particles using Runge-Kutta 4th order method (forward advection)
    [px, py] = Runge_Kutta(px, py, u, v, 1);

    % Add the inflow particles
    px = [px; pxo];
    py = [py; pyo];

    % Remove particles outside the grid
    valid_idx = px > 0 & px <= s*ar & py > 0 & py <= s;
    px = px(valid_idx);
    py = py(valid_idx);

    % Visualization of particle positions
    hold on
    scatter(px, py, 1, 'filled', 'MarkerFaceColor', [0 0.4470 0.7410]);
    plot(xx, yy, 'ok', 'MarkerSize', 4)
    hold off

    % Visualization of particle positions and obstacle
    axis equal;
    axis([0 s*ar 0 s]);
    xlabel('X');
    ylabel('Y');
    grid on
    max_vx = max(max(u));
    % Update title with maximum velocity
    titleString = ['Maximum Velocity: ', num2str(max_vx)];
    title(titleString);

    drawnow;
end

% Save the final results (velocity and pressure fields)
global sim_results
sim_results.u=u;
sim_results.v=v;
sim_results.p=p;

end
