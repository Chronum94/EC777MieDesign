function [nspline] = gaas_spline(wavelengths)
    gaasfile = dlmread('Materials/GaAs.txt');
    % [wv, n, k] = tdfread('Materials/GaAs.txt');
    disp(gaasfile)
    a= 1;
    % n = n + k;
    nspline = a;
end