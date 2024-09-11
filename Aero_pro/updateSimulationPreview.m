function updateSimulationPreview()
% Function to update the simulation preview when parameters such as grid size,
% aspect ratio, displacement, or angle of attack are changed.

    % Access global simulation parameters
    global sim_params
    s = sim_params.s;       % Grid size
    ar = sim_params.ar;     % Aspect ratio
    AoA=sim_params.AoA;     % Angle of attack
    
    % Create a grid based on the updated grid size and aspect ratio
    [X, Y] = meshgrid(1:s*ar, 1:s);
    
    % Initialize pressure and velocity fields (filled with zeros)
    p = zeros(s, s*ar);
    
    % Access the foil data and rotate it based on the angle of attack
    foil=sim_params.foil;
    turn=find(foil(:,1)==min(foil(:,1)));   % Index where the foil changes shape
    fx=foil(:,1);
    
    % Rotate the foil by applying AoA and correcting the y-coordinates
    cor=fx-fx.*cosd(AoA); % Correction factor for y-values based on AoA
    foil(:,1)=fx.*cosd(AoA); % Apply rotation to the x-values
    foil(:,2)=foil(:,2)-cor; % Apply correction to the y-values
    
    
    % Define obstacle size and apply scaling to foil data
    num=sim_params.ObstSize;
    foil=foil.*num; % Scale foil size based on obstacle size
    N=num;
    
    % Create top and bottom outlines for the foil by interpolating points
    X_top=linspace(max(foil(:,1)),0,N+1);
    X_top=round(X_top);
    X_bot=flip(X_top);  % Bottom outline is the flipped version of the top outline
    Y_top=round(interp1(foil(1:turn,1),foil(1:turn,2),X_top,"pchip", 'extrap'));
    Y_bot=round(interp1(foil(turn:end,1),foil(turn:end,2),X_bot,"pchip", 'extrap'));
    
    % Apply displacement to the foil based on user input
    X_top=X_top+sim_params.DispRight;
    X_bot=X_bot+sim_params.DispRight;
    Y_top=Y_top+sim_params.DispUp;
    Y_bot=Y_bot+sim_params.DispUp;
    
    % Create the obstacle matrix (boolean mask for obstacle locations)
    m=zeros(s,s*ar);
    ob=false(size(m));
    
    % Mark the top and bottom points of the obstacle in the grid
    for i=1:N+1
        ob(Y_top(i),X_top(i))=true;
        ob(Y_bot(i),X_bot(i))=true;
    end
    
    % Fill the obstacle between the top and bottom points
    for i=1:s*ar
        n=1;
        pos=[];
        for e=1:s
            if ob(e,i)==true
                pos(n)=e;
                n=n+1;
            end
            if length(pos)==2
                for f=pos(1):pos(2)
                    ob(f,i)=true;
                end
                pos=[];
            end
    
        end
    end
    
    % Prepare obstacle coordinates for plotting
    xx=[];
    yy=[];
    for i=1:ar*s
        xx=[xx,ob(:,i).*i]; % X-coordinates of the obstacle
    end
    for i=1:s
        yy=[yy;ob(i,:).*i];  % Y-coordinates of the obstacle
    end
    
    % Close any previous figure 2 and open a new one
    close(2)
    figure (2)
    
    % Plot the top and bottom outlines and the obstacle points
    hold on
    plot(X_bot,Y_bot,color='k') % Plot the bottom outline of the foil
    plot(X_top,Y_top,color='k') % Plot the top outline of the foil
    plot(xx,yy,'o',color='k',linewidth=1,MarkerSize=4)  % Plot obstacle
    xlabel('X');
    ylabel('Y');
    axis equal;
    axis([0 s*ar 0 s]); % Set axis limits based on grid size and aspect ratio
    hold off
    
    % Save updated obstacle and grid to sim_params for future use
    sim_params.ob=ob;
    sim_params.X=X;
    sim_params.Y=Y;
end
