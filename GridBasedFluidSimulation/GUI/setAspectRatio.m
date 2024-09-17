function setAspectRatio(src,~)
% Function to set the aspect ratio in the simulation parameters
% INPUT:
%   src - handle to the UI control (e.g., dropdown menu) that contains the aspect ratio values
% OUTPUT:
%   Updates the global sim_params with the selected aspect ratio

    % Declare the global variable sim_params to access simulation parameters
    global sim_params;

    % Convert the selected aspect ratio from the UI dropdown menu (string format) to a number
    % 'src.String{src.Value}' accesses the selected aspect ratio (as a string)
    % 'str2double' converts it to a numeric value
    sim_params.ar = str2double(src.String{src.Value});
end
