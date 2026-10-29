% HW3: f = 440 * 2^((n-49)/12)  ->  linearized: ln f = ln A + k n
csvFile = 'notes.csv';    % columns: key (piano key number), f_Hz (one row per trial)

T = readtable(csvFile);  T = T(~isnan(T.f_Hz), :);
n = T.key;  f = T.f_Hz;

p  = polyfit(n, log(f), 1);           % ln f = k*n + lnA
k  = p(1);  A = exp(p(2));
fit_f = A * exp(k*n);
R2 = 1 - sum((f - fit_f).^2) / sum((f - mean(f)).^2);
r  = exp(k);                           % fitted semitone ratio (theory 2^(1/12) = 1.05946)
f49 = A * exp(k*49);                   % fitted A4 (theory 440 Hz)

fprintf('f = %.4g * exp(%.5f n)    R^2 = %.5f\n', A, k, R2);
fprintf('k = %.5f (theory %.5f, ratio %.4f)\n', k, log(2)/12, k/(log(2)/12));
fprintf('semitone ratio = %.5f (theory 1.05946), f(49) = %.1f Hz (theory 440)\n', r, f49);

% per note: mean, SD, cents off from equal temperament
un = unique(n);
m  = arrayfun(@(u) mean(f(n==u)), un);
s  = arrayfun(@(u) std(f(n==u)),  un);
cents = 1200*log2(m ./ (440*2.^((un-49)/12)));
disp(table(un, m, s, cents, 'VariableNames', {'key','mean_Hz','SD_Hz','cents_off'}));

nn  = linspace(min(n)-0.5, max(n)+0.5, 200);
fig = figure('Position', [100 100 760 480]);  theme(fig, 'light');
errorbar(un, m, s, 'o', 'LineWidth', 1.2); hold on;
plot(nn, A*exp(k*nn), '-', 'LineWidth', 1.6);
plot(nn, 440*2.^((nn-49)/12), '--', 'Color', [0.5 0.5 0.5]);
xlabel('Piano key number n');  ylabel('Fundamental frequency (Hz)');
title(sprintf('Bottle notes vs. piano key:  f = %.3g e^{%.4f n},  R^2 = %.4f', A, k, R2));
legend({'measured (mean \pm SD)', 'exponential fit', 'equal temperament 440\cdot2^{(n-49)/12}'}, 'Location', 'northwest');
grid on;
exportgraphics(fig, 'plot_notes.png', 'Resolution', 200);
