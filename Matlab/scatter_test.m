clearvars; close all;
wv = linspace(0.4, 1, 2000);
d = 0.4;
x = 2*pi./wv * d/2;

n = 3.5;

sctm_1 = scatter_q_tm(n, x,  10);
plot(wv, sctm_1)