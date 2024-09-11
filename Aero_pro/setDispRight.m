function setDispRight(value)
% Function to set the horizontal displacement (DispRight) in the simulation parameters
% INPUT:
%   value - the new displacement value in the right direction
% OUTPUT:
%   Updates the global sim_params with the rounded displacement value

    % Declare the global variable sim_params to access simulation parameters
    global sim_params;

    % Update the rightward displacement in sim_params
    % The value is rounded to ensure it's an integer
    sim_params.DispRight = round(value);
end
