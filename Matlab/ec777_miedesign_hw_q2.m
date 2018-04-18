clearvars; close all;

wv = linspace(0.4, 1.5, 1000);
d = 1;


nmodes = 100;
au_nk = gaas_spline(wv);
hold on;
for d=linspace(0.2, 1, 15)
    x = 2*pi./wv * d/2;
    scqtm = extinct_q_te(au_nk, x, nmodes);
    plot(wv, scqtm);
end