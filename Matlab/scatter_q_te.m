function [scattering_q] = scatter_q_te(n, x, n_moments)
scattering_q = zeros(1, length(x));

zeroth_order_term = abs(te_moment(n, x, 0)) .^ 2;
for i=1:n_moments
    scattering_q = scattering_q + abs(te_moment(n, x, i)) .^ 2;
end
scattering_q = 2./x .*(zeroth_order_term + 2.*scattering_q);
end