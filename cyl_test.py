"""
Created on Mon Apr  9 15:57:00 2018

@author: Anubhab Haldar
"""

import numpy as np
from core import *
import matplotlib.pyplot as plt

wv = np.linspace(1.6, 2.6, 1000)
d = np.linspace(0.1, 10, 1000)
x = 2*np.pi/1.55 * d/2

n = 3.5+0.01j
a1 = te_moment(n, x, 1)
b1 = tm_moment(n, x, 2)

#plt.plot(wv, abs(a1)**2, linewidth=3)
#plt.plot( wv, abs(b1)**2, linewidth=0.7)
#plt.hlines(0, 0.4, 1.4, linestyles='dashed')
#plt.legend(['f'])
nmodes = 30
scqtm = scatter_q_tm(n, x, nmodes)
scqte = scatter_q_te(n, x, nmodes)
plt.semilogy(x, scqtm, x, scqte)
plt.show()

exqtm = extinct_q_tm(n, x, nmodes)
#exqte = extinct_q_te(n, x, nmodes)
plt.plot(x, exqtm+scqtm)