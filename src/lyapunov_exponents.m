function [mu, lambda, M] = lyapunov_exponents(orbit, T)

    x0vec = orbit(:, 1) ;

    Phi0 = eye(3) ;
    Y0 = [x0vec ; Phi0(:)] ;

    options = odeset('RelTol', 1e-12, 'AbsTol', 1e-14) ;
    [~, Y] = ode45(@variational_rhs, [0, T], Y0, options) ;

    Yend = Y(end, :)' ;
    M = reshape(Yend(4:12), 3, 3) ;   

    lambda = eig(M) ;

    % just making an ordered list
    [~, idx] = sort(abs(lambda), 'descend') ;
    lambda = lambda(idx) ;

    mu = log(abs(lambda)) / T ;

    fprintf('Floquet multipliers (eigenvalues of monodromy matrix):\n') ;
    disp(lambda) ;
    fprintf('Floquet exponents (Lyapunov exponents of the orbit):\n') ;
    disp(mu) ;

end

