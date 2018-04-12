import numpy as np
from core import *
import matplotlib.pyplot as plt

wv = np.linspace(0.25, 1.0, 100)


nmodes = 20
gaasnk= gaas_spline(wv)

for d in np.linspace(0.08, 0.15, 10):
    x = 2 * np.pi / wv * d / 2
    scqtm = scatter_q_tm(gaasnk, x, nmodes)
    plt.plot(wv, scqtm, 'b-')
    plt.ylabel('$Q_{sca}$')
    plt.xlabel('Wavelength[$\mu m$]')
plt.show()