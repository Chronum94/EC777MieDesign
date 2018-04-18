function [nspline] = ag_spline(wavelengths)
    agfile = dlmread('Materials/Ag.txt');
    % [wv, n, k] = tdfread('Materials/GaAs.txt');
    agnk = agfile(:, 2) + 1j * agfile(:, 3);

    nspline = interp1(agfile(:, 1), agnk, wavelengths);
end