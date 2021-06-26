#!/usr/bin/env python3
import control, sys, matplotlib, numpy
matplotlib.pyplot.rcParams['axes.xmargin'] = 0
matplotlib.pyplot.rcParams['figure.figsize'] = (10.0, 5.0)
G = 0.2 * control.tf([0.5, 1], [1.5, 0.5, 1])
Gp = control.tf(*control.pade(0.25, 3)) * G
w = numpy.logspace(-1.5, 1, 200)
control.bode(Gp, w, Hz=True, dB=True, deg=False)
matplotlib.pyplot.savefig(sys.stdout.buffer, format='pdf')