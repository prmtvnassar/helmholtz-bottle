% Plunger Bottle: f = a/sqrt(V0+x)  ->  linearized: 1/f^2 = (x+V0)/a^2
csvFile = 'data.csv';  % use 'data.csv' for real data
tempC = 20;  neckD_mm = 21.78;  neckL_mm = 23.89;  bottle_mL = 50; 

T = readtable(csvFile);  T = T(~isnan(T.f_Hz), :);
x = T.x_mL;  f = T.f_Hz;

% linearize and fit a straight line:  y = p(1)*x + p(2)
y  = 1 ./ f.^2;
p  = polyfit(x, y, 1);
a  = 1 / sqrt(p(1));          % slope = 1/a^2
V0 = p(2) / p(1);             % intercept/slope = V0
R2lin = 1 - sum((y - polyval(p, x)).^2) / sum((y - mean(y)).^2);
fit_f = a ./ sqrt(V0 + x);
R2    = 1 - sum((f - fit_f).^2) / sum((f - mean(f)).^2);

% theory
c = 331.3 + 0.606*tempC;  d = neckD_mm*1e-3;
aTh = c/(2*pi) * sqrt((pi*d^2/4) / (neckL_mm*1e-3 + 0.85*d)) * 1000;

fprintf('1/f^2 = %.4g*x + %.4g   (R^2 linearized = %.4f)\n', p(1), p(2), R2lin);
fprintf('a  = %.1f  (theory %.1f, ratio %.3f)\n', a, aTh, a/aTh);
fprintf('V0 = %.1f mL  (measured air %.0f mL)\n', V0, bottle_mL);
fprintf('f-space R^2 = %.4f\n', R2);

% plots: mean +/- SD per setting
ux = unique(x);
m  = arrayfun(@(u) mean(f(x==u)), ux);
s  = arrayfun(@(u) std(f(x==u)),  ux);
xx = linspace(min(x), max(x), 200);
fig = figure('Position', [100 100 700 760]);  theme(fig, 'light');
subplot(2,1,1);
errorbar(ux, m, s, 'o'); hold on;  plot(xx, a./sqrt(V0+xx), '-');
xlabel('Syringe reading x (mL)');  ylabel('Frequency (Hz)');
title(sprintf('f = %.0f/\\surd(%.0f + x),  R^2 = %.4f', a, V0, R2));  grid on;
subplot(2,1,2);
plot(x, y, 'o'); hold on;  plot(xx, polyval(p, xx), '-');
xlabel('Syringe reading x (mL)');  ylabel('1/f^2 (Hz^{-2})');
title(sprintf('Linearized: 1/f^2 = %.3g x + %.3g,  R^2 = %.4f', p(1), p(2), R2lin));  grid on;
exportgraphics(fig, 'plot_matlab.png', 'Resolution', 200);
