% relative error for whether it is a lorenz orbit
function rerr = relative_residual(orbit, T)

    w = 2*pi/T ;
    d_orbit = spectral_deriv(orbit, T) ;
    F = vfield(orbit) ;

    err = w*d_orbit - F ;
    rerr = norm(err, 'fro') / (w*norm(d_orbit, 'fro')) ;
end
