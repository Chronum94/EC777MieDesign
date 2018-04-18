clearvars;
close all;

x = linspace(-1, 1, 100);
[xx yy] = meshgrid(x, x);
r = hypot(xx, yy);
imagesc(jv(0, r*20)./r);
colorbar;