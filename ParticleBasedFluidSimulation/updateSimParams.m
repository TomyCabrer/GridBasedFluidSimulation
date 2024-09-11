function updateSimParams(value, param)
% Function to update various simulation parameters based on user input
% INPUT:
%   value - the new value to assign to the parameter
%   param - the name of the parameter to be updated (as a string)
% OUTPUT:
%   Updates the specified simulation parameter and refreshes the simulation preview

    % Use a switch-case statement to determine which parameter to update
    switch param
        case 'AoA'
            % Update the angle of attack (AoA)
            sim_params.AoA = value;
        case 'DispUp'
            % Update the upward displacement value
            sim_params.DispUp = value;
        case 'DispRight'
            % Update the rightward displacement value
            sim_params.DispRight = value;
        case 's'
            % Update the grid size
            sim_params.s = value;
        case 'ar'
            % Update the aspect ratio of the grid
            sim_params.ar = value;
        case 'ObstSize'
            % Update the obstacle size
            sim_params.ObstSize = value;
    end

    % Refresh the simulation preview with the updated parameters
    updateSimulationPreview();
end
