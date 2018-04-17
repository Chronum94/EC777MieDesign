function [y] = h1vp(order, z)

order_div_z = order./z;
y = besselh(order - 1, 1, z) - order_div_z .* besselh(order, 1, z);
end