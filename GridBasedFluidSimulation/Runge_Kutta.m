function [x_new, y_new] = Runge_Kutta(px, py, u, v, h)
% Runge-Kutta 4th order method for advection
% INPUT:
%   px, py - current positions of particles or grid points
%   u, v   - velocity fields in x and y directions
%   h      - time step (positive for forward advection, negative for backward advection)
% OUTPUT:
%   x_new, y_new - new positions after advection

    % Step 1: Compute the first intermediate velocity (k1) using the current positions
    k1x = interp2(u, px, py);  % Interpolate velocity in the x-direction at (px, py)
    k1y = interp2(v, px, py);  % Interpolate velocity in the y-direction at (px, py)

    % Step 2: Compute the second intermediate velocity (k2) using k1
    % The new positions are displaced by h/2 * k1x and h/2 * k1y
    k2x = interp2(u, px + h/2 * k1x, py + h/2 * k1y);  % Interpolated velocity at midpoint
    k2y = interp2(v, px + h/2 * k1x, py + h/2 * k1y);  % Interpolated velocity at midpoint

    % Step 3: Compute the third intermediate velocity (k3) using k2
    % The positions are displaced by h/2 * k2x and h/2 * k2y
    k3x = interp2(u, px + h/2 * k2x, py + h/2 * k2y);  % Interpolated velocity at midpoint
    k3y = interp2(v, px + h/2 * k2x, py + h/2 * k2y);  % Interpolated velocity at midpoint

    % Step 4: Compute the fourth intermediate velocity (k4) using k3
    % The positions are displaced by h * k3x and h * k3y
    k4x = interp2(u, px + h * k3x, py + h * k3y);  % Interpolated velocity at end point
    k4y = interp2(v, px + h * k3x, py + h * k3y);  % Interpolated velocity at end point

    % Final position update: Average the intermediate velocities (k1, k2, k3, k4) and update the positions
    x_new = px + h/6 * (k1x + 2*k2x + 2*k3x + k4x);  % New x-position
    y_new = py + h/6 * (k1y + 2*k2y + 2*k3y + k4y);  % New y-position
end
