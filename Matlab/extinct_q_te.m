function [extinction_q] = extinct_q_te(n, x, n_moments)
    extinction_q = zeros(1, length(x));

    zeroth_order_term = te_moment(n, x, 0);

    for i=1:n_moments
        extinction_q = extinction_q + real(te_moment(n, x, i));
    end
    extinction_q = 2./x .* real(zeroth_order_term + 2*extinction_q);
end