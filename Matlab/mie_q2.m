clearvars; close all;
wv = linspace(0.2, 1.4, 500);
nmodes = 20;

%% GaAs section
agnk= ag_spline(wv);
diams = linspace(0.01, 0.5, 6);

figure(1)
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2;
    scqtm_gaas = scatter_q_tm(agnk, x, nmodes);
    scqte_gaas = scatter_q_te(agnk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, scqtm_gaas, wv ,scqte_gaas);
    ylabel('$Q_{sca}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    %ylim([-1, 7]);
    plotnum = plotnum + 1;
end

figure(2);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2;
    scqtm_gaas = scatter_q_tm(agnk, x, nmodes);
    exqtm_gaas = extinct_q_tm(agnk, x, nmodes);
    scqte_gaas = scatter_q_te(agnk, x, nmodes);
    exqte_gaas = extinct_q_te(agnk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, exqtm_gaas - scqtm_gaas, wv, exqte_gaas - scqte_gaas);
    ylabel('$Q_{abs}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    %ylim([-1, 7]);
    plotnum = plotnum + 1;
end


%% Si section

aunk = au_spline(wv);

figure(3);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2;
    scqtm_si = scatter_q_tm(aunk, x, nmodes);
    scqte_si = scatter_q_te(aunk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, scqtm_si, wv, scqte_si);
    ylabel('$Q_{sca}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    plotnum = plotnum + 1;
end

figure(4);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2;
    scqtm_si = scatter_q_tm(aunk, x, nmodes);
    exqtm_si = extinct_q_tm(aunk, x, nmodes);
    scqte_si = scatter_q_te(aunk, x, nmodes);
    exqte_si = extinct_q_te(aunk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, exqtm_si - scqtm_si, wv, exqtm_si - scqte_si);
    ylabel('$Q_{abs}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    %ylim([-1, 7]);
    plotnum = plotnum + 1;
end

% Since multiplot figures have no suptitle with the bioinformatics toolbox.
fprintf('Figure 1: TE/TM scattering cross sections for Ag nanowires with varying diameters.\n');
fprintf('Figure 2: TE/TM absorption cross sections for Ag nanowires with varying diameters.\n');
fprintf('Figure 3: TE/TM scattering cross sections for Au nanowires with varying diameters.\n');
fprintf('Figure 4: TE/TM absorption cross sections for Au nanowires with varying diameters.\n');