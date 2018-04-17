function [moments] = te_moment(n, order, x)
nx = n.*x;
numer = n .* jv(order, nx) .* jvp(order, x) - jvp(order, nx) .* jv(order, x);
denom = n .* jv(order, nx) .* h1vp(order, x) - jvp(order, nx) .* h1v(order, x);

moments = numer./denom;
end