# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt

from core import *

wv = 0.5#np.linspace(0.4, 1, 2000)
d = np.linspace(0.28, 0.29, 1000)
x = 2*np.pi/wv * d/2

n = 3.5

sctm_1 = scatter_q_tm(n, x, 100)
plt.plot(d, sctm_1)