% plotting graph to see dependency of result on T
results_dir = 'C:\Users\idris\Academics\disciplines\dynamical-systems\Lorentz-project\results' ;
tol_exponents = [6, 7, 8, 9] ;

for X = tol_exponents

    load(fullfile(results_dir, sprintf('batch_results_tol_1e-%d.mat', X))) ;

    pass_fail = zeros(size(T_all)) ;
    pass_fail(result == "PASS") = 1 ;
    pass_fail(result == "FAIL") = -1 ;

    figure ;
    hold on;

    % thin dotted lines from x-axis to each result point
    for i = 1:length(T_all)
        if pass_fail(i) == 1
            plot([T_all(i), T_all(i)], [0,1], ':', 'Color', [0.5 0.5 0.5], 'LineWidth', 0.5) ;
        else
            plot([T_all(i), T_all(i)], [-1,0], ':', 'Color', [0.5 0.5 0.5], 'LineWidth', 0.5) ;
        end
    end

    % main plot
    scatter(T_all(result == "PASS"), pass_fail(result == "PASS"), 15, [0.20 0.55 0.30], 'filled') ;
    scatter(T_all(result == "FAIL"), pass_fail(result == "FAIL"), 15, [0.80 0.20 0.20], 'filled') ;
    scatter(T_all, zeros(size(T_all)), 5, [0.50 0.50 0.50], 'filled') ;
    hold off;

    ylim([-1.5, 1.5]) ;
    yticks([-1, 1]) ;
    yticklabels({'FAIL', 'PASS'}) ;
    xlabel('Period T') ;
    ylabel('Result') ;
    title(sprintf('Endpoint check result vs orbit period at tol 1e-%d', X)) ;
    legend({'', '', 'PASS', 'FAIL'}, 'Location', 'best') ;
    grid on ;
    box on ;

    exportgraphics(gcf, fullfile(results_dir, 'pass-fail-vs-T', sprintf('pass_fail_vs_T_tol_1e-%d.png', X)), 'Resolution', 300) ;
    saveas(gcf, fullfile(results_dir, 'pass-fail-vs-T', sprintf('pass_fail_vs_T_tol_1e-%d.fig', X))) ;

    close(gcf) ;
end

disp('Done!')