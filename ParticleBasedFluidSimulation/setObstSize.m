function setObstSize(src,~)
% Function to set the obstacle size in the simulation parameters
% INPUT:
%   src - handle to the UI control (e.g., dropdown menu) that contains the obstacle size values
% OUTPUT:
%   Updates the global sim_params with the selected obstacle size

    % Declare the global variable sim_params to access simulation parameters
    global sim_params;

    % Convert the selected obstacle size from the UI dropdown menu (string format) to a number
    % 'src.String{src.Value}' accesses the selected obstacle size (as a string)
    % 'str2double' converts it to a numeric value
    sim_params.ObstSize = str2double(src.String{src.Value});
end
