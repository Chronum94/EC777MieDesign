% This test script recreates the results found in
% Brönstrup, G., et al.
% "A precise optical determination of nanoscale diameters of semiconductor nanowires."
% Nanotechnology 22.38 (2011): 385201.

wv = linspace(0.49, 0.71, 1000);

nmodes = 20;
gaasnk= gaas_spline(wv);
diams = [86, 102, 128, 155, 183, 205]/1000;


figure(1)
% suptitle('TM scattering efficiencies for GaAs nanowires')
plotnum = 1;
for d=diams
    x = 2*pi./wv * d/2;
    scqtm = scatter_q_tm(gaasnk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, scqtm);
    ylabel('$Q_{sca}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    ylim([1, 7]);
    plotnum = plotnum + 1;
end

figure(2)
% plt.suptitle('TE scattering efficiencies for GaAs nanowires')
plotnum = 1;
for d=diams
    % plt.plot(wv, gaasnk.real, wv, gaasnk.imag)
    x = 2*pi./wv * d/2;
    scqte = scatter_q_te(gaasnk, x, nmodes);
    subplot(230+plotnum);
    plot(wv, scqte);
    ylabel('$Q_{sca}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    ylim([0, 3]);
    plotnum = plotnum + 1;
end

figure(3)
% plt.suptitle('TE+TM scattering efficiencies for GaAs nanowires')
plotnum = 1;
for d=diams
    % plt.plot(wv, gaasnk.real, wv, gaasnk.imag)
    x = 2*pi./wv * d/2;
    scqte = scatter_q_te(gaasnk, x, nmodes);
    scqtm = scatter_q_tm(gaasnk, x, nmodes);
    scq = 0.5 * (scqte + scqtm);
    subplot(230+plotnum);
    plot(wv, scq);
    ylabel('$Q_{sca}$', 'Interpreter', 'latex');
    xlabel('Wavelength[$\mu m$]', 'Interpreter', 'latex');
    rawtitle = strcat(sprintf('NW diameter: %0.3f', d), ' $\mu$m');
    title(rawtitle, 'Interpreter', 'latex');
    ylim([0, 5]);
    plotnum = plotnum + 1;
end
