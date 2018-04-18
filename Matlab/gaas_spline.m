function [nspline] = gaas_spline(wavelengths)
    gaasfile = dlmread('Materials/GaAs.txt');
    % [wv, n, k] = tdfread('Materials/GaAs.txt');
    gaasnk = gaasfile(:, 2) + 1j * gaasfile(:, 3);

    nspline = interp1(gaasfile(:, 1), gaasnk, wavelengths);
end