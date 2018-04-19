clearvars; close all;

npoints = 500;
wv = linspace(0.4, 1.4, npoints);
nmodes = 20; % Typically enough

%% GaAs section
gaasnk= gaas_spline(wv); % GaAs n, k values at wavelengths.
diams = linspace(0.01, 0.5, 6); %Diameter of nanowires.

% Only commenting the first plot loop. All others are identical.
figure(1)
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % Large fig
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2; % Size parameter.
    scqtm_gaas = scatter_q_tm(gaasnk, x, nmodes); % TM scattering Q.
    scqte_gaas = scatter_q_te(gaasnk, x, nmodes); % TE scattering Q.
    subplot(230+plotnum);
    plot(wv, scqtm_gaas, wv ,scqte_gaas);
    ylabel('$Q_{sca}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    plotnum = plotnum + 1;
end

figure(2);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2;
    scqtm_gaas = scatter_q_tm(gaasnk, x, nmodes);
    exqtm_gaas = extinct_q_tm(gaasnk, x, nmodes);
    scqte_gaas = scatter_q_te(gaasnk, x, nmodes);
    exqte_gaas = extinct_q_te(gaasnk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, exqtm_gaas - scqtm_gaas, wv, exqte_gaas - scqte_gaas);
    ylabel('$Q_{abs}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    plotnum = plotnum + 1;
end


%% Constant refractive index section
figure(3)
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
plotnum = 1;
d = 0.2;  % Looking at 200 nm diameter nanowire.
rixes = linspace(1.5, 3.5, 6); % n for plotting. Assuming no losses.
for n=rixes
    x = 2*pi./wv * d/2;
    scqtm_n = scatter_q_tm(n, x, nmodes);
    scqte_n = scatter_q_te(n, x, nmodes);
    subplot(230+plotnum);
    plot(wv, scqtm_n, wv ,scqte_n);
    ylabel('$Q_{sca}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = sprintf('Refractive index of NW: %0.2f', n);
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    plotnum = plotnum + 1;
end
%% Si section

sink = si_spline(wv);   % Silicon n, k spline.

figure(4);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2;
    scqtm_si = scatter_q_tm(sink, x, nmodes);
    scqte_si = scatter_q_te(sink, x, nmodes);
    subplot(230+plotnum);
    plot(wv, scqtm_si, wv, scqte_si);
    ylabel('$Q_{sca}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    plotnum = plotnum + 1;
end

figure(5);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2;
    scqtm_si = scatter_q_tm(sink, x, nmodes);
    exqtm_si = extinct_q_tm(sink, x, nmodes);
    scqte_si = scatter_q_te(sink, x, nmodes);
    exqte_si = extinct_q_te(sink, x, nmodes);
    subplot(230+plotnum);
    plot(wv, exqtm_si - scqtm_si, wv, exqtm_si - scqte_si);
    ylabel('$Q_{abs}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    legend('TM', 'TE');
    plotnum = plotnum + 1;
end

% Since multiplot figures have no suptitle with the bioinformatics toolbox.
fprintf('Figure 1: TE/TM scattering cross sections for GaAs nanowires with varying diameters.\n');
fprintf('Figure 2: TE/TM absorption cross sections for GaAs nanowires with varying diameters.\n');
fprintf('Figure 3: TE/TM scattering cross sections for constant refractive index nanowires of diameter = 200 nm.\n');
fprintf('Figure 4: TE/TM scattering cross sections for Si nanowires with varying diameters.\n');
fprintf('Figure 5: TE/TM absorption cross sections for Si nanowires with varying diameters.\n');