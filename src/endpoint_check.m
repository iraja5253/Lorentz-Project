% endpoint checking
function [r, xTvec, x0vec] = endpoint_check(orbit, T, tolerance)
    
    x0vec = orbit(:, 1) ;          % initial conditions

    options = odeset('RelTol', 1e-12, 'AbsTol', 1e-14, 'Vectorized', 'on') ;
    [~, X] = ode45(@(t, x) vfield(x), [0, T], x0vec, options) ;
    xTvec = X(end, :).' ;

    r = norm (xTvec - x0vec) ;

    if r < tolerance
        fprintf('Result: PASS, orbit closes within tolerance.\n');
    else
        fprintf('Result: FAIL, orbit does NOT close within tolerance.\n');
    end

end

