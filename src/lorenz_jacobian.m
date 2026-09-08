function J = lorenz_jacobian(x)

    s = 10; r = 28; b = 8/3;

    X = x(1); Y = x(2); Z = x(3);

    J = [ -s,      s,     0  ;
           r-Z,   -1,    -X  ;
           Y,      X,    -b  ] ;
end