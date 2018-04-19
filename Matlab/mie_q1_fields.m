clearvars;close all;

npoints = 100;
d = 0.2; % 200 nm diameter cyl.
nmodes = 25; % Small number of modes. High scattering is typically dominated by a dipole resonance.
res = 200; % Resolution of field images.
slen = 10; % Side length of field images.
imglims = [-slen/2, slen/2];
wv = linspace(0.4, 1.4, npoints); % Wavelengths.
x = 2*pi./wv * d/2;

% TM
gaasnk = gaas_spline(wv);
[~, scatter_max_index] = max(scatter_q_tm(gaasnk, x, nmodes));
x_resonance = x(scatter_max_index);
k = 2*pi/wv(scatter_max_index);
rix_resonance = gaasnk(scatter_max_index);

order = 1:nmodes;

% TM moments of negative order are equal to moments of positive order. This
% halves the calculations. B & H, pg 198.
tm_moments = tm_moment(rix_resonance, x_resonance, order);
E0 = 1; % Normalizing to unit electric field amplitude.
Ez = zeros(res); % TM scattering E field only has Ez contribution.
Hr = zeros(res);
Hphi = zeros(res);
slen_ = slen*k;
for n=1:nmodes
    [~, ~, enz] = N_n(n, k, slen_, res);
    [~, ~, enz_]  = N_n(-n, k, slen_, res);
    [hnr, hnphi, ~] = M_n(n, k, slen_, res);
    [hnr_, hnphi_, ~]  = M_n(-n, k, slen_, res);
    Ez = Ez + E0 * (-1j)^n/k *tm_moments(n) .* enz + E0 * (-1j)^(-n)/k *tm_moments(n) .* enz_;
    Hr = Hr + E0 * (-1j)^n/k *tm_moments(n) .* hnr + E0 * (-1j)^(-n)/k *tm_moments(n) .* hnr_;
    Hphi = Hphi + E0 * (-1j)^n/k *tm_moments(n) .* hnphi + E0 * (-1j)^(-n)/k *tm_moments(n) .* hnphi_;
end
Ez = -Ez;
Hr = -1j*Hr;
Hphi = -1j*Hphi;
figure(1);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

subplot(231);
imagesc(imglims, imglims, real(Ez));
colorbar;
title('Real Ez');

subplot(232)
imagesc(imglims, imglims, real(Hr));
colorbar;
title('Real Hr');

subplot(233);
imagesc(imglims, imglims, real(Hphi));
colorbar;
title('Real Hphi');

subplot(234);
imagesc(imglims, imglims, imag(Ez));
colorbar;
title('Real Ez');

subplot(235);
imagesc(imglims, imglims, imag(Hr));
colorbar;
title('Imag Hr');

subplot(236);
imagesc(imglims, imglims, imag(Hphi));
title('Imag Hphi');
colorbar;

fprintf('Figure 1: EM fields for GaAs scattering at wavelength = %0.3f microns.\n', wv(scatter_max_index));
%% Si nanowires.
% TM
sink = si_spline(wv);
[~, scatter_max_index] = max(scatter_q_tm(sink, x, nmodes));
x_resonance = x(scatter_max_index);
k = 2*pi/wv(scatter_max_index);
rix_resonance = sink(scatter_max_index);

order = 1:nmodes;

% TM moments of negative order are equal to moments of positive order. This
% halves the calculations. B & H, pg 198.
tm_moments = tm_moment(rix_resonance, x_resonance, order);
E0 = 1; % Normalizing to unit electric field amplitude.
Ez = zeros(res); % TM scattering E field only has Ez contribution.
Hr = zeros(res);
Hphi = zeros(res);
slen_ = slen*k;
for n=1:nmodes
    [~, ~, enz] = N_n(n, k, slen_, res);
    [~, ~, enz_]  = N_n(-n, k, slen_, res);
    [hnr, hnphi, ~] = M_n(n, k, slen_, res);
    [hnr_, hnphi_, ~]  = M_n(-n, k, slen_, res);
    Ez = Ez + E0 * (-1j)^n/k *tm_moments(n) .* enz + E0 * (-1j)^(-n)/k *tm_moments(n) .* enz_;
    Hr = Hr + E0 * (-1j)^n/k *tm_moments(n) .* hnr + E0 * (-1j)^(-n)/k *tm_moments(n) .* hnr_;
    Hphi = Hphi + E0 * (-1j)^n/k *tm_moments(n) .* hnphi + E0 * (-1j)^(-n)/k *tm_moments(n) .* hnphi_;
end

Ez = -Ez;
Hr = -1j*Hr;
Hphi = -1j*Hphi;
figure(2);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

subplot(231);
imagesc(imglims, imglims, real(Ez));
colorbar;
title('Real Ez');

subplot(232)
imagesc(imglims, imglims, real(Hr));
colorbar;
title('Real Hr');

subplot(233);
imagesc(imglims, imglims, real(Hphi));
colorbar;
title('Real Hphi');

subplot(234);
imagesc(imglims, imglims, imag(Ez));
colorbar;
title('Real Ez');

subplot(235);
imagesc(imglims, imglims, imag(Hr));
colorbar;
title('Imag Hr');

subplot(236);
imagesc(imglims, imglims, imag(Hphi));
title('Imag Hphi');
colorbar;

fprintf('Figure 2: EM fields for Si scattering at wavelength = %0.3f microns.\n', wv(scatter_max_index));
