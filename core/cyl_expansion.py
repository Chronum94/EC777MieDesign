"""
Created on Mon Apr  9 15:02:46 2018

@author: Anubhab Haldar
"""

from scipy.special import jv, jvp
from scipy.special import hankel1 as h1v, h1vp # Bessel, Hankel, and derivs.
# from scipy.special import hankel2 as h2v, h2vp
__all__ = ['a_i', 'b_i']

def a_i(n, x, order):
    """
    n: Complex refractive index. Array or scalar.
    x: Scalar. Size parameter of cylinder.
    order: The order of the moment to return.
    """
    # Calculating moment value for all wavelengths.
    # If refractive_index is a scalar, it will be the same for all wavelengths
    # If an array, must have same length as wavelength array.
    nx = n*x
    numer = n * jv(nx, order) * jvp(x, order) - jvp(nx, order) * jv(x, order)
    denom = n * jv(nx, order) * h1vp(x, order) - jvp(nx, order) * h1v(x, order)
    # print(numer, denom)
    return numer/denom

def b_i(n, x, order):
    """
    n: Complex refractive index. Array or scalar.
    x: Scalar. Size parameter of cylinder.
    order: The order of the moment to return.
    """
    # Calculating moment value for all wavelengths.
    # If refractive_index is a scalar, it will be the same for all wavelengths
    # If an array, must have same length as wavelength array.

    nx = n*x
    numer = jv(nx, order) * jvp(x, order) - n * jvp(nx, order) * jv(x, order)
    denom = jv(nx, order) * h1vp(x, order) - n * jvp(nx, order) * h1v(x, order)
    # print(numer, denom)
    return numer/denom
