function setAoA(value)
% Function to set the Angle of Attack (AoA) in simulation parameters
% INPUT:
%   value - the new angle of attack (AoA) value
% OUTPUT:
%   Updates the global sim_params with the rounded AoA value

    % Declare the global variable sim_params to access simulation parameters
    global sim_params;

    % Update the Angle of Attack (AoA) in sim_params
    % The value is rounded to ensure it's an integer
    sim_params.AoA = round(value);
end
