"""
Created on Mon Apr  9 15:57:00 2018

@author: Anubhab Haldar
"""

import numpy as np
from core import *
import matplotlib.pyplot as plt

wv = np.linspace(0.49, 0.71, 100)
x = 2*np.pi/wv * 0.205/2


nmodes = 1
#scqtm = scatter_q_tm(n, x, nmodes)
#scqte = scatter_q_te(n, x, nmodes)

#exqtm = extinct_q_tm(n, x, nmodes)

gaasnk= gaas_spline(wv)
# plt.plot(wv, gaasnk.real, wv, gaasnk.imag)
scqtm1 = scatter_q_te(gaasnk, x, nmodes)
scqtm2 = scatter_q_te(gaasnk, x, 100)

# scqte = scatter_q_te(gaasnk, x, nmodes)

plt.plot(wv, scqtm1, wv, scqtm2)
# plt.ylim([0, 3])
plt.show()

print(te_moment(1+1j, 0, 1))