function [Mr, Mphi, Mz] = M_n(order, k, sidelen, res)
% This function assumes normal incidence with respect to the cylinder axis,
% thus, a few terms go to 0, and a few squares a perfect. Bohren and
% Huffman, pg 195. When assuming normal incidence relative to axis, the h
% value goes to 0 as do many other terms. The extra 0 arrays are returned
% to maintain ease of use and generality.

if nargin == 3
    x = linspace(-sidelen/2, sidelen/2, 100);
    Mz = zeros(100);
else
    x = linspace(-sidelen/2, sidelen/2, res);
    Mz = zeros(res);
end
[xx, yy] = meshgrid(x, x);
r = hypot(xx, yy);
phi = atan2(xx, yy);
angular_dependence = exp(1j*order*phi);
Mr = k.*1j.*order.*jv(order, r)./r .* angular_dependence;
% Mr(r < cyl_d/2) = 0;
Mphi = k.*jvp(order, r) .* angular_dependence;
% Mphi(r < cyl_d/2) = 0;
end