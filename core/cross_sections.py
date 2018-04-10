# -*- coding: utf-8 -*-
"""
Created on Mon Apr  9 17:02:06 2018

@author: Anubhab Haldar
"""
import numpy as np

from .cyl_expansion import a_i, b_i

__all__ = ['scatter_q_tm', 'scatter_q_te', 'extinct_q_tm']

def scatter_q_tm(n, x, n_moments):
    scattering_q = np.zeros_like(x)
    for i in range(1, n_moments + 1):
        scattering_q += abs(b_i(n, x, i))**2
    scattering_q = 2/x * 2*scattering_q
    return scattering_q

def scatter_q_te(n, x, n_moments):
    scattering_q = np.zeros_like(x)
    for i in range(1, n_moments + 1):
        scattering_q += abs(a_i(n, x, i))**2
    scattering_q = 2/x * 2*scattering_q
    return scattering_q

def extinct_q_tm(n, x, n_moments):
    extinction_q = np.zeros_like(x)
    for i in range(1, n_moments + 1):
        extinction_q += b_i(n, x, i).real
    extinction_q = 2/x * 2*extinction_q
    return extinction_q