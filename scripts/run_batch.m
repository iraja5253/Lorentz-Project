addpath('../src')
data_dir = 'C:\Users\idris\Academics\disciplines\dynamical-systems\Lorentz-project\data-Vishwanath\DATA1';

num_orbits = 1375 ;

endpt_err = zeros(num_orbits, 1) ;
residual_err = zeros(num_orbits, 1) ;
result = strings(num_orbits, 1) ;
tolerance = 1e-9 ;

passed_idx = [] ;   
failed_idx = [] ;

for i = 1:1375

    orbit = load(fullfile(data_dir, sprintf('orbit%d.dat', i)));  
    T = load(fullfile(data_dir, sprintf('T%d.dat', i)));
    T_all(i) = T ;

    [r, ~, ~] = endpoint_check(orbit, T, tolerance) ;
    endpt_err(i) = r ;
    residual_err(i) = relative_residual(orbit, T) ;

    if r < tolerance
        result(i) = "PASS" ;
        passed_idx(end+1) = i ;
    else
        result(i) = "FAIL" ;
        failed_idx(end+1) = i ;
    end
end

% counting fails and passes
num_passed = numel(passed_idx) ;
num_failed = numel(failed_idx) ;

% sorting based on time period 
[T_sorted, sort_idx] = sort(T_all) ;   % sort_idx(k) = orbit no. with k-th smallest T

endpt_err_sorted = endpt_err(sort_idx) ;
residual_err_sorted = residual_err(sort_idx) ;
result_sorted = result(sort_idx) ;

T_failed = T_all(failed_idx) ;
[T_failed_sorted, sort_failed_idx] = sort(T_failed) ;
failed_idx_by_T = failed_idx(sort_failed_idx) ;

save('C:\Users\idris\Academics\Projects\Lorentz-project\results\batch_results_tol_1e-9.mat', ...
    'endpt_err', 'residual_err', 'result', 'T_all', ...
    'passed_idx', 'failed_idx', 'num_passed', 'num_failed', ...
    'endpt_err_sorted', 'residual_err_sorted', 'result_sorted', ...
    'T_failed_sorted', 'sort_failed_idx') ;

disp('Done!')
