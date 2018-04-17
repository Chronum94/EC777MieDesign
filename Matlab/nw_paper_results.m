wv = linspace(0.49, 0.71, 100);

nmodes = 20;
gaasnk= gaas_spline(wv)
leglist = []
diams = np.array([86, 102, 128, 155, 183, 205])/1000

plt.figure(1)
plt.suptitle('TM scattering efficiencies for GaAs nanowires')
plotnum = 1