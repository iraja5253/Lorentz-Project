function dYdt = variational_rhs(~, Y)

    x = Y(1:3) ;
    Phi = reshape(Y(4:12), 3, 3) ;

    dxdt = lorenz_rhs([], x) ;

    J = lorenz_jacobian(x) ;
    dPhidt = J * Phi ;

    dYdt = [dxdt ; dPhidt(:)] ;
end