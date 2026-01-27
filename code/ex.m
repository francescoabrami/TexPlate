%% ENERGY SPECTRUM

E_1_FFT = (abs(X_1_FFT)).^2;
E_2_FFT = (abs(X_2_FFT)).^2;

E_1_DFT = (abs(X_1_DFT)).^2;
E_2_DFT = (abs(X_2_DFT)).^2;

%% PLOT DFT RESULTS

fig1 = figure;
subplot(2, 1, 1);
plot(f_1,20 * log10(fftshift(E_1_DFT)), 'red');
% xlim([-lim lim]);
disp(f_1);
title(['DFT - Finestra ', num2str(finestra),' di ' num2str(Nfin_1)]);
xlabel('kHz');
ylabel('dB');
grid on;

subplot(2, 1, 2);
plot(f_2,20 * log10(fftshift(E_2_DFT)), 'blue');
% xlim([-lim lim]);
disp(f_2);
title(['DFT - Finestra ', num2str(finestra),' di ' num2str(Nfin_2)]);
xlabel('kHz');
ylabel('dB');
grid on;

figure_name = sprintf('F-%dDFT-M%.2f.png', finestra, M);
print(fig1, figure_name, '-dpng', '-r300');