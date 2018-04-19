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
    scqtm_ag = scatter_q_tm(agnk, x, nmodes);
    scqte_ag = scatter_q_te(agnk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, scqtm_ag, wv ,scqte_ag);
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
    scqtm_ag = scatter_q_tm(agnk, x, nmodes);
    exqtm_ag = extinct_q_tm(agnk, x, nmodes);
    scqte_ag = scatter_q_te(agnk, x, nmodes);
    exqte_ag = extinct_q_te(agnk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, exqtm_ag - scqtm_ag, wv, exqte_ag - scqte_ag);
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
    scqtm_au = scatter_q_tm(aunk, x, nmodes);
    scqte_au = scatter_q_te(aunk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, scqtm_au, wv, scqte_au);
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
    scqtm_au = scatter_q_tm(aunk, x, nmodes);
    exqtm_au = extinct_q_tm(aunk, x, nmodes);
    scqte_au = scatter_q_te(aunk, x, nmodes);
    exqte_au = extinct_q_te(aunk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, exqtm_au - scqtm_au, wv, exqtm_au - scqte_au);
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