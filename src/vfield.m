% computing lorenz vector field
function F = vfield(orbit)

    s = 10; r = 28; b = 8/3;
    x = orbit(1, : ) ;
    y = orbit(2, : ) ;
    z = orbit(3, : ) ;

    F = zeros(size(orbit)) ;
    F(1, : ) = s * (y - x) ;
    F(2, : ) = r*x - y - x.*z ;
    F(3, : ) = x.*y - b*z ;
end
