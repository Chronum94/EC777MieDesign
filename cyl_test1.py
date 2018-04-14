"""
Created on Mon Apr  9 15:57:00 2018

@author: Anubhab Haldar
"""
# This test script recreates the results found in
# Brönstrup, G., et al.
# "A precise optical determination of nanoscale diameters of semiconductor nanowires."
# Nanotechnology 22.38 (2011): 385201.
import numpy as np
from core import *
import matplotlib.pyplot as plt


def main():
    wv = np.linspace(0.49, 0.71, 1000)


    nmodes = 20
    gaasnk= gaas_spline(wv)
    leglist = []
    diams = np.array([86, 102, 128, 155, 183, 205])/1000

    plt.figure(1)
    plt.suptitle('TM scattering efficiencies for GaAs nanowires')
    plotnum = 1
    for d in diams:
    # plt.plot(wv, gaasnk.real, wv, gaasnk.imag)
        x = 2*np.pi/wv * d/2
        scqtm = scatter_q_tm(gaasnk, x, nmodes)
        leglist += [f'{d:0.3} 10 modes']
        plt.subplot(230+plotnum)
        plt.plot(wv, scqtm)
        plt.ylabel('$Q_{sca}$')
        plt.xlabel('Wavelength[$\mu m$]')
        plt.title(f'NW diameter: {d} $\mu$m')
        plt.ylim([1, 7])
        plotnum += 1

    plt.figure(2)
    plt.suptitle('TE scattering efficiencies for GaAs nanowires')
    plotnum = 1
    for d in diams:
    # plt.plot(wv, gaasnk.real, wv, gaasnk.imag)
        x = 2*np.pi/wv * d/2
        scqte = scatter_q_te(gaasnk, x, nmodes)
        leglist += [f'{d:0.3} 10 modes']
        plt.subplot(230+plotnum)
        plt.plot(wv, scqte)
        plt.ylabel('$Q_{sca}$')
        plt.xlabel('Wavelength[$\mu m$]')
        plt.title(f'NW diameter: {d} $\mu$m')
        plt.ylim([0, 3])
        plotnum += 1

    plt.figure(3)
    plt.suptitle('TE+TM scattering efficiencies for GaAs nanowires')
    plotnum = 1
    for d in diams:
    # plt.plot(wv, gaasnk.real, wv, gaasnk.imag)
        x = 2*np.pi/wv * d/2
        scqte = scatter_q_te(gaasnk, x, nmodes)
        scqtm = scatter_q_tm(gaasnk, x, nmodes)
        scq = 0.5 * (scqte + scqtm)
        leglist += [f'{d:0.3} 10 modes']
        plt.subplot(230+plotnum)
        plt.plot(wv, scq)
        plt.ylabel('$Q_{sca}$')
        plt.xlabel('Wavelength[$\mu m$]')
        plt.title(f'NW diameter: {d} $\mu$m')
        plt.ylim([0, 5])
        plotnum += 1

    plt.show()

if __name__=="__main__":
    main()
