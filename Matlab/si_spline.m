function [nspline] = si_spline(wavelengths)
    sifile = dlmread('Materials/Si.txt');
    % [wv, n, k] = tdfread('Materials/GaAs.txt');
    sink = sifile(:, 2) + 1j * sifile(:, 3);

    nspline = interp1(sifile(:, 1), sink, wavelengths);
end