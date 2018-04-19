clearvars;
close all;

k = 8*pi; % 500 nm wavelength.
E0 = 1;
E_array = zeros(100);
for i=0:100
    E_array = E_array + E0*(-1j).^i/k .* N_n(i, k, 50) + E0*(-1j).^(-i)/k .* N_n(-i, k, 50);
end

figure(1)
imagesc(real(E_array));
colorbar;

E0 = 1;
E_array = zeros(100);
for i=0:100
    [mrplus, mphiplus] = M_n(i, k, 50);
    mrplus = E0*(-1j).^i/k .* mrplus;
    mphiplus = E0*(-1j).^i/k .* mphiplus;
    [mrminus, mphiminus] = M_n(-i, k, 50);
    mrminus = E0*(-1j).^(-i)/k .* mrminus;
    mphiminus = E0*(-1j).^(-i)/k .* mphiminus;
    E_array = E_array + mphiplus + mphiminus + mrplus + mrminus;
end

figure(2)
imagesc(imag(E_array));
colorbar;