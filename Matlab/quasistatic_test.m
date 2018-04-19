wv = 0.6;%linspace(0.2, 1.5, 1000);

nmodes = 20;
agnk= si_spline(wv);
d = linspace(0.05, 0.5, 1000);


figure(1)
% suptitle('TM scattering efficiencies for GaAs nanowires')
plotnum = 1;
x = 2*pi./wv * d/2;
scqtmm = scatter_q_tm(agnk, x, nmodes);
scqtmd = scatter_q_tm(agnk, x, 0);
plot(x, scqtmm, x, scqtmd, '.-', 'MarkerIndices', 1:20:length(x));
ylabel('$Q_{sca}$ for TM', 'Interpreter', 'latex');
xlabel('Size parameter', 'Interpreter', 'latex');
title('Scattering efficiency at 600 nm wavelength of a Si nanowire')
legend('Mie, 20 modes', 'Quasistatic')
plotnum = plotnum + 1;