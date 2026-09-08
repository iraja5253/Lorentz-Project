% plotting grpah to see dependency of result on T
results_dir = 'C:\Users\idris\Academics\disciplines\dynamical-systems\Lorentz-project\results' ;
tol_exponents = [6, 7, 8, 9] ;

for X = tol_exponents

    fname = fullfile(results_dir, sprintf('batch_results_tol_1e-%d.mat', X)) ;
    load(fname) ;

    figure ;
    hold on ;

    scatter(T_all(result == "PASS"), residual_err(result == "PASS"), 15, [0.20 0.55 0.30], 'filled') ;
    scatter(T_all(result == "FAIL"), residual_err(result == "FAIL"), 15, [0.80 0.20 0.20], 'filled') ;

    hold off ;
    set(gca, 'YScale', 'log') ;
    xlabel('Period T') ;
    ylabel('Relative residual error') ;
    title(sprintf('Residual error vs orbit period (endpoint tol = 1e-%d)', X)) ;
    legend({'PASS', 'FAIL'}, 'Location', 'best') ;
    grid on ;
    box on ;

    saveas(gcf, fullfile(results_dir, 'residual-err-vs-T', sprintf('residual_err_vs_T_tol_1e-%d.fig', X))) ;
    exportgraphics(gcf, fullfile(results_dir,'residual-err-vs-T', sprintf('residual_err_vs_T_tol_1e-%d.png', X)), 'Resolution', 300) ;

    close(gcf) ;
end

disp('Done!')