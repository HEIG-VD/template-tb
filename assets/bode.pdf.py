#!/usr/bin/env python3
import numpy as np
import matplotlib.pyplot as plt
import control
import sys
G = 0.2 * control.tf([0.5, 1], [1.5, 0.5, 1])
Gp = control.tf(*control.pade(0.25, 3)) * G
w = np.logspace(-1.5, 1, 200)
control.bode(Gp, w, Hz=True, dB=True, deg=False)
plt.savefig(sys.stdout.buffer, format='pdf')