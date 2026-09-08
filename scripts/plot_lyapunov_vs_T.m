addpath('../src') ;

data_dir    = 'C:\Users\idris\Academics\disciplines\dynamical-systems\Lorentz-project\data-Vishwanath\DATA1' ;
results_dir = 'C:\Users\idris\Academics\disciplines\dynamical-systems\Lorentz-project\results' ;
num_orbits  = 1375 ;

% pre-allocate  (3 exponents per orbit)
mu_all     = zeros(num_orbits, 3) ;   % Floquet exponents   [real]
lambda_all = zeros(num_orbits, 3) ;   % Floquet multipliers [complex → stored as real(abs)]
T_all      = zeros(1, num_orbits) ;
failed_idx = [] ;

fprintf('Running Floquet exponent batch...\n') ;

for i = 1:num_orbits

    orbit = load(fullfile(data_dir, sprintf('orbit%d.dat', i))) ;
    T     = load(fullfile(data_dir, sprintf('T%d.dat',     i))) ;
    T_all(i) = T ;

    try
        [mu, lam, ~] = lyapunov_exponents(orbit, T) ;

        mu_all(i, :)     = mu(:).' ;
        lambda_all(i, :) = abs(lam(:)).') ;

    catch ME
        fprintf('WARN: orbit %d failed — %s\n', i, ME.message) ;
        mu_all(i, :)     = NaN ;
        lambda_all(i, :) = NaN ;
        failed_idx(end+1) = i ;
    end

end

fprintf('Batch complete. %d orbits failed.\n', numel(failed_idx)) ;

save(fullfile(results_dir, 'lyapunov_batch_results.mat'), ...
    'mu_all', 'lambda_all', 'T_all', 'failed_idx', 'num_orbits') ;

disp('Done!')