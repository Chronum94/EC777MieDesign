# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt
from scipy.special import jv, jvp, hankel1 as h1v, h1vp

from core import *


wv = np.linspace(0.4, 1)
d = 0.1
x = 2*np.pi/wv * d/2

n = 3.5

te_m = jvp(7, x)
plt.plot(x, te_m.real)