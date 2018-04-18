function [Mr, Mphi] = M_n(order, k, sidelen, res)
% This function assumes normal incidence with respect to the cylinder axis,
% thus, a few terms go to 0, and a few squares a perfect. Bohren and
% Huffman, pg 195.

if nargin == 1
    x = linspace(-sidelen/2, sidelen/2, 100);
else
    x = linspace(-sidelen/2, sidelen/2, res);
end
[xx, yy] = meshgrid(x, x);
r = hypot(xx, yy);
phi = atan2(xx, yy);
angular_dependence = exp(1j*order*phi);
Mr = k.*1j.*order.*jv(order, r)./r .* angular_dependence;
Mphi = k.*jvp(order, r) .* angular_dependence;
end