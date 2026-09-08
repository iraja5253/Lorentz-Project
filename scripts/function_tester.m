% testing the functions
s = 10; r = 28; b = 8/3;
C = [sqrt(b*(r-1)); sqrt(b*(r-1)); r-1] ;

disp(norm(vfield(C))) ;
disp(norm(spectral_deriv(C, T1))) ;
disp(norm(relative_residual(orbit1, T11))) ;