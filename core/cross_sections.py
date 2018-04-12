# -*- coding: utf-8 -*-
"""
Created on Mon Apr  9 17:02:06 2018

@author: Anubhab Haldar
"""
import numpy as np

from .cyl_expansion import te_moment, tm_moment

__all__ = ['scatter_q_tm', 'scatter_q_te', 'extinct_q_tm']

def scatter_q_tm(n, x, n_moments):
    scattering_q = np.zeros_like(x)

    zeroth_order_term = abs(tm_moment(n, x, 0)) ** 2
    for i in range(1, n_moments + 1):
        scattering_q += abs(tm_moment(n, x, i)) ** 2
    scattering_q = 2/x *(zeroth_order_term + 2*scattering_q)
    return scattering_q

def scatter_q_te(n, x, n_moments):
    scattering_q = np.zeros_like(x)

    zeroth_order_term = abs(te_moment(n, x, 0)) ** 2
    for i in range(1, n_moments + 1):
        scattering_q += abs(te_moment(n, x, i)) ** 2
    scattering_q = 2/x *(zeroth_order_term + 2*scattering_q)
    return scattering_q

def extinct_q_tm(n, x, n_moments):
    extinction_q = np.zeros_like(x)

    zeroth_order_term = te_moment(n, x, 0)

    for i in range(1, n_moments + 1):
        extinction_q += te_moment(n, x, i).real
    extinction_q = 2/x * np.real(zeroth_order_term + 2*extinction_q)
    return extinction_q