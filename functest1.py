# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt
from scipy.special import jv, jvp, hankel1 as h1v, h1vp

from core import *


wv = np.linspace(0.4, 1, 200)
d = 0.4
x = 2*np.pi/wv * d/2

n = 3.5
nx = n*x
order = 1
numer = n * jv(order, nx) * jvp(order, x) - jvp(order, nx) * jv(order, x)
denom = n * jv(order, nx) * h1vp(order, x) - jvp(order, nx) * h1v(order, x);

te_m = tm_moment(n, x, order)
plt.plot(x, numer.real, x, numer.imag)
plt.plot(x, denom.real, '.', x, denom.imag, '.')
plt.plot(x, te_m.real, x, te_m.imag)