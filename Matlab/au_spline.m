function [nspline] = au_spline(wavelengths)
    aufile = dlmread('Materials/Au.txt');
    % [wv, n, k] = tdfread('Materials/GaAs.txt');
    aunk = aufile(:, 2) + 1j * aufile(:, 3);

    nspline = interp1(aufile(:, 1), aunk, wavelengths);
end