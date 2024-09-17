function setGridSize(src,~)
% Function to set the grid size in the simulation parameters
% INPUT:
%   src - handle to the UI control (e.g., dropdown menu) that contains the grid size values
% OUTPUT:
%   Updates the global sim_params with the selected grid size

    % Declare the global variable sim_params to access simulation parameters
    global sim_params;

    % Convert the selected grid size from the UI dropdown menu (string format) to a number
    % 'src.String{src.Value}' accesses the selected grid size (as a string)
    % 'str2double' converts it to a numeric value
    sim_params.s = str2double(src.String{src.Value});
end
