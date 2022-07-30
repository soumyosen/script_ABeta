import matplotlib
import numpy as np
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt
import pandas as pd

f = open("Log10Energy_2dimers_all.dat")
lines = f.readlines()

x, y, z = [], [], []

for line in lines:
	x.append(float(line.split()[0]))
	y.append(float(line.split()[1]))

f.close()

x1=np.unique(x)
y1=np.unique(y)

df = pd.read_csv("Log10Energy_2dimers_all.dat", sep=' ', names=["distance", "angle", "log(Energy)"])
df1 = df.pivot(index="angle", columns="distance")
z = df1.as_matrix()


fig = plt.figure()
ax = plt.contour(x1,y1,z)


plt.clabel(ax, inline=1, fontsize=10)
plt.xlabel("Translational Distance ($\AA$)")
plt.ylabel("Rotational Angle (degree)")
plt.show()
