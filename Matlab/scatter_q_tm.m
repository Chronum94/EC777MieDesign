function [scattering_q] = scatter_q_tm(n, x, n_moments)
    scattering_q = zeros_like(x);

    zeroth_order_term = abs(tm_moment(n, x, 0)) .^ 2;
    for i=1, n_moments
        scattering_q = scattering_q + abs(tm_moment(n, x, i)) .^ 2;
    end
    scattering_q = 2/x *(zeroth_order_term + 2*scattering_q);
 end