from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import numpy as np


f = open("NB_E_2dimers_min_logex.dat")
lines = f.readlines()

x, y, z = [], [], []

for line in lines:
	x.append(float(line.split()[0]))
	y.append(float(line.split()[1]))
	z.append(float(line.split()[2]))

f.close()

fig = plt.figure()
ax = fig.gca(projection='3d')

ax.scatter(x, y, z)

#ax.set_zlim(7.0, 10.0)
ax.zaxis.set_major_locator(LinearLocator(10))
ax.zaxis.set_major_formatter(FormatStrFormatter('%.02f'))

ax.set_xlabel('Translational distance')
ax.set_ylabel('Angle of rotation')
ax.set_zlabel('$log_10$(Energy (kcal/mol))')

plt.show()
