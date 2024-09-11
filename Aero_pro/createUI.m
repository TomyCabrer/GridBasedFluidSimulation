function createUI()
    % Close all figures
    close all;

    % Create a figure for the GUI with a better position and size
    guiFig = figure('Name', 'Simulation Parameters', 'NumberTitle', 'off', 'Position', [300, 300, 350, 300], ...
                    'MenuBar', 'none', 'ToolBar', 'none', 'Resize', 'off', 'Color', [0.94 0.94 0.94]);

    % Add a panel for grouping sliders
    sliderPanel = uipanel('Title', 'Parameters', 'FontSize', 12, ...
                          'Position', [0.05, 0.4, 0.9, 0.4], 'BackgroundColor', [0.94 0.94 0.94]);

    % Add a slider for AoA
    uicontrol('Parent', sliderPanel, 'Style', 'text', 'Position', [10, 80, 100, 20], 'String', 'AoA (degrees)');
    hAoASlider = uicontrol('Parent', sliderPanel, 'Style', 'slider', 'Position', [120, 80, 150, 20], 'Min', -45, 'Max', 45, 'Value', 0);
    addlistener(hAoASlider, 'ContinuousValueChange', @(src, event) updateSimParams(src.Value, 'AoA'));
    addlistener(hAoASlider, 'ContinuousValueChange', @(src, event) setAoA(src.Value));

    % Add a text box to show the AoA value
    hAoAText = uicontrol('Parent', sliderPanel, 'Style', 'text', 'Position', [280, 80, 40, 20], 'String', '0');
    addlistener(hAoASlider, 'ContinuousValueChange', @(src, event) set(hAoAText, 'String', num2str(round(src.Value))));

    % Add a slider for displacement up
    uicontrol('Parent', sliderPanel, 'Style', 'text', 'Position', [10, 50, 100, 20], 'String', 'Disp Up');
    hDispUpSlider = uicontrol('Parent', sliderPanel, 'Style', 'slider', 'Position', [120, 50, 150, 20], 'Min', 0 , 'Max', 50, 'Value', 20);
    addlistener(hDispUpSlider, 'ContinuousValueChange', @(src, event) updateSimParams(src.Value, 'DispUp'));
    addlistener(hDispUpSlider, 'ContinuousValueChange', @(src, event) setDispUp(src.Value));

    % Add a text box to show the displacement up value
    hDispUpText = uicontrol('Parent', sliderPanel, 'Style', 'text', 'Position', [280, 50, 40, 20], 'String', '20');
    addlistener(hDispUpSlider, 'ContinuousValueChange', @(src, event) set(hDispUpText, 'String', num2str(round(src.Value))));

    % Add a slider for displacement right
    uicontrol('Parent', sliderPanel, 'Style', 'text', 'Position', [10, 20, 100, 20], 'String', 'Disp Right');
    hDispRightSlider = uicontrol('Parent', sliderPanel, 'Style', 'slider', 'Position', [120, 20, 150, 20], 'Min', 1, 'Max', 20, 'Value', 5);
    addlistener(hDispRightSlider, 'ContinuousValueChange', @(src, event) updateSimParams(src.Value, 'DispRight'));
    addlistener(hDispRightSlider, 'ContinuousValueChange', @(src, event) setDispRight(src.Value));

    % Add a text box to show the displacement right value
    hDispRightText = uicontrol('Parent', sliderPanel, 'Style', 'text', 'Position', [280, 20, 40, 20], 'String', '5');
    addlistener(hDispRightSlider, 'ContinuousValueChange', @(src, event) set(hDispRightText, 'String', num2str(round(src.Value))));

    % Add a panel for grouping dropdown menus
    dropdownPanel = uipanel('Title', 'Settings', 'FontSize', 12, ...
                            'Position', [0.05, 0.1, 0.9, 0.375], 'BackgroundColor', [0.94 0.94 0.94]);

    % Add a dropdown menu for obstacle size
    uicontrol('Parent', dropdownPanel, 'Style', 'text', 'Position', [10, 70, 100, 20], 'String', 'Obstacle Size');
hObstSizedown = uicontrol('Parent', dropdownPanel, 'Style', 'popupmenu', 'Position', [120, 70, 150, 20], ...
    'String', {'50', '100', '150', '200', '250'}, 'Value', 2, ...  % Start with 100 selected (index 2)
    'Callback', @(src, event) updateSimParams(src.Value, 'ObstSize'), 'Callback', @setObstSize);

    % Add a dropdown menu for grid size
    uicontrol('Parent', dropdownPanel, 'Style', 'text', 'Position', [10, 40, 100, 20], 'String', 'Grid Size');
    hGridSizeDropdown = uicontrol('Parent', dropdownPanel, 'Style', 'popupmenu', 'Position', [120, 40, 150, 20], ...
        'String', {'40', '50', '60', '70', '80'}, 'Callback', @(src, event) updateSimParams(src.Value, 'GridSize'),'Callback', @setGridSize);

    % Add a dropdown menu for aspect ratio
    uicontrol('Parent', dropdownPanel, 'Style', 'text', 'Position', [10, 10, 100, 20], 'String', 'Aspect Ratio');
    hAspectRatioDropdown = uicontrol('Parent', dropdownPanel, 'Style', 'popupmenu', 'Position', [120, 10, 150, 20], ...
        'String', {'2', '3', '4', '5', '6'}, 'Value', 3, ...  % Start with 4 selected (index 2)
        'Callback', @(src, event) updateSimParams(src.Value, 'AspectRatio'),'Callback', @setAspectRatio);

    % Add a dropdown menu for obstacle size
    uicontrol('Parent', dropdownPanel, 'Style', 'text', 'Position', [10, -20, 100, 20], 'String', 'Obstacle Size');
    hObstSizedown = uicontrol('Parent', dropdownPanel, 'Style', 'popupmenu', 'Position', [120, -20, 150, 20], ...
        'String', {'50', '100', '150', '200', '250'}, 'Callback', @(src, event) updateSimParams(src.Value, 'ObstSize'));

    
    
    % Add a button to start the simulation
    uicontrol('Style', 'pushbutton', 'Position', [125, 1, 100, 30], 'String', 'Start Simulation', 'Callback', @(src, event) Main_fun());
    
    % Initialize simulation preview
    figure(2)
    updateSimulationPreview();
end