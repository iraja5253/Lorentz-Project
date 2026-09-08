addpath('../src')
data_dir = 'C:\Users\idris\Academics\disciplines\dynamical-systems\Lorentz-project\data-Vishwanath\DATA1';

% asking the user
orbit_no = input("Enter a orbit number from 1 to 1375: ") ;

% doing the main thing
orbit = load ( fullfile(data_dir, sprintf('orbit%d.dat', orbit_no)) );  
T = load ( fullfile(data_dir, sprintf('T%d.dat', orbit_no)) );
n = load ( fullfile(data_dir, sprintf('n%d.dat', orbit_no)) );
tolerance = 1e-8 ;

fprintf('Checking endpoint meeting for orbit%d in DATA1... \n' , orbit_no) ;
disp(endpoint_check(orbit, T, tolerance)) ;


fprintf('Checking residual error for orbit%d in DATA1... \n' , orbit_no) ;
disp(relative_residual(orbit, T)) ;





