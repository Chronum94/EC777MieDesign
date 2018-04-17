# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt

from core import *

wv = np.linspace(0.4, 1, 2000)
d = 0.4
x = 2*np.pi/wv * d/2

n = 3.5

sctm_1 = scatter_q_tm(n, x, 10)
plt.plot(wv, sctm_1)