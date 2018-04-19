clearvars; close all;
wv = linspace(0.4, 1.4, 1000);

nmodes = 20;

%%
gaasnk= gaas_spline(wv);
diams = linspace(0.01, 0.5, 6);


figure(1)
% suptitle('TM scattering efficiencies for GaAs nanowires')
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2;
    scqtm_gaas = scatter_q_tm(gaasnk, x, nmodes);
    scqte_gaas = scatter_q_te(gaasnk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, scqtm_gaas, wv ,scqte_gaas);
    ylabel('$Q_{sca}$ for TM/TE', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    %ylim([-1, 7]);
    plotnum = plotnum + 1;
end

%%
figure(2)
% suptitle('TM scattering efficiencies for GaAs nanowires')
plotnum = 1;
d = 0.2;
rixes = linspace(1.5, 3.5, 6);
for n=rixes
    x = 2*pi./wv * d/2;
    scqtm_n = scatter_q_tm(n, x, nmodes);
    scqte_n = scatter_q_te(n, x, nmodes);
    subplot(230+plotnum);
    plot(wv, scqtm_n, wv ,scqte_n);
    ylabel('$Q_{sca}$ for TM/TE', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = sprintf('Refractive index of NW: %0.2f', n);
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    %ylim([-1, 7]);
    plotnum = plotnum + 1;
end

%%

sink= si_spline(wv);
diams = linspace(0.01, 0.5, 6);


figure(3);
% suptitle('TM scattering efficiencies for GaAs nanowires')
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2;
    scqtm_si = scatter_q_tm(sink, x, nmodes);
    exqtm_si = extinct_q_tm(sink, x, nmodes);
    scqte_si = scatter_q_te(sink, x, nmodes);
    exqte_si = extinct_q_te(sink, x, nmodes);
    subplot(230+plotnum);
    plot(wv, exqtm_si-scqtm_si, wv, exqte_si-scqte_si);
    ylabel('$Q_{abs}$ for TM/TE', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    %ylim([-1, 7]);
    plotnum = plotnum + 1;
end