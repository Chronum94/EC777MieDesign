"""
Created on Mon Apr  9 15:02:46 2018

@author: Anubhab Haldar
"""

import numpy as np
from scipy.special import jv, jvp
from scipy.special import hankel1 as h1v, h1vp # Bessel, Hankel, and derivs.
# from scipy.special import hankel2 as h2v, h2vp

__all__ = ['te_moment', 'tm_moment']

def te_moment(n, x, order):
    """
    n: Complex refractive index. Array or scalar.
    x: Real size parameter of cylinder. Array or scalar.
    order: The order of the moment to return.
    """
    # Calculating moment value for all wavelengths.
    # If refractive_index is a scalar, it will be the same for all wavelengths
    # If an array, must have same length as wavelength array.
    nx = n*x
    numer = n * jv(order, nx) * jvp(order, x) - jvp(order, nx) * jv(order, x)
    denom = n * jv(order, nx) * h1vp(order, x) - jvp(order, nx) * h1v(order, x)
    # print(numer, denom)
    if np.any(numer == np.nan+np.nan*1j):
        raise ZeroDivisionError
    return numer/denom

def tm_moment(n, x, order):
    """
    n: Complex refractive index. Array or scalar.
    x: Real size parameter of cylinder. Array or scalar.
    order: The order of the moment to return.
    """
    # Calculating moment value for all wavelengths.
    # If refractive_index is a scalar, it will be the same for all wavelengths
    # If an array, must have same length as wavelength array.

    nx = n*x
    numer = jv(order, nx) * jvp(order, x) - n * jvp(order, nx) * jv(order, x)
    denom = jv(order, nx) * h1vp(order, x) - n * jvp(order, nx) * h1v(order, x)
    # print('N: ', numer, 'D: ', denom)
    return numer/denom
