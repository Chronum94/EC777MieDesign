
import numpy as np
from scipy.interpolate import BSpline

import os


DIRECTORY_PATH = os.path.dirname(os.path.abspath(__file__))
__all__ = ['gaas_spline', 'si_spline']
def gaas_spline(wavelengths):
    data = np.loadtxt(DIRECTORY_PATH+r'/GaAs.txt')
    wv, n, k = data.T
    nspline = BSpline(wv, n, k=1, extrapolate=False)
    kspline = BSpline(wv, k, k=1, extrapolate=False)
    return nspline(wavelengths)+1j*kspline(wavelengths)

def si_spline(wavelengths):
    data = np.loadtxt(DIRECTORY_PATH+r'/Si.txt')
    wv, n, k = data.T
    nspline = BSpline(wv, n, k=1, extrapolate=False)
    kspline = BSpline(wv, k, k=1, extrapolate=False)
    return nspline(wavelengths)+1j*kspline(wavelengths)