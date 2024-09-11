function lap = laplacian(f)
% Laplacian function: computes the discrete Laplacian of a scalar field f
% INPUT:
%   f - scalar field (matrix)
% OUTPUT:
%   lap - Laplacian of the field f (matrix), used to apply viscous effects

    % Initialize the output matrix 'lap' with the same size as input 'f'
    lap = zeros(size(f));
    
    % Compute the Laplacian using central finite differences.
    % For each inner point in the matrix (2:end-1), the Laplacian is computed
    % using the values of its neighbors (up, down, left, right) minus 4 times
    % the central value.    
    lap(2:end-1, 2:end-1) = f(3:end, 2:end-1) + f(1:end-2, 2:end-1) + ...
                            f(2:end-1, 3:end) + f(2:end-1, 1:end-2) - 4 * f(2:end-1, 2:end-1);
end
