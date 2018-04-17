wv = linspace(0.4, 1, 200);
d = 0.4;
x = 2*pi./wv * d/2;

n = 3.5;
order = 1;
nx = n.*x;
numer = n .* jv(order, nx) .* jvp(order, x) - jvp(order, nx) .* jv(order, x);
denom = n .* jv(order, nx) .* h1vp(order, x) - jvp(order, nx) .* h1v(order, x);
te_m = tm_moment(n, x, order);
hold on;
plot(x, real(numer), x, imag(numer))
plot(x, real(denom), '.', x, imag(denom), '.')
plot(x, real(te_m), x, imag(te_m))