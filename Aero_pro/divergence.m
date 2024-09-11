function div = divergence(u, v)
% Divergence function: computes the divergence of a vector field (u, v)
% INPUT:
%   u - velocity field in the x-direction (matrix)
%   v - velocity field in the y-direction (matrix)
% OUTPUT:
%   div - divergence of the vector field (matrix)

    % Compute the gradient of u (only the x-component is needed)
    [dux, ~] = gradient(u); 
    
    % Compute the gradient of v (only the y-component is needed)
    [~, dvy] = gradient(v); 
    
    % The divergence is the sum of the partial derivatives of u with respect to x 
    % and v with respect to y
    div = dux + dvy; 
end
