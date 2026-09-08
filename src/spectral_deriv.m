% finding derivative
function d_orbit = spectral_deriv(orbit, T) 

    n = size(orbit, 2) ;
    w = 2*pi/T ;
    k = [0, 1:n/2-1, 0, -n/2+1:-1] ;     % 1xn matrix
    
    orbitf = fft (orbit, [], 2) ;     
    orbitf = orbitf .* (ones (3, 1) * ( 1i * k )) ;     
    d_orbit = real (ifft (orbitf, [], 2)) ;    
end

