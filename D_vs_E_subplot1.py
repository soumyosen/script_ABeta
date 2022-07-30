
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv("Log10Energy_2dimers.dat", sep=' ', names=["distance", "angle", "log(Energy)"])

fig, axs = plt.subplots(1,3)
fig.subplots_adjust(hspace = .5, wspace=.4)
axs = axs.ravel()
i = 0

for ang in [4.8, 4.9, 5.0]:
	df1 = df[df['angle']==ang]
	axs[i].plot(df1['distance'],df1['log(Energy)'],linewidth=1.0)
	axs[i].set_title(ang, color='red')
	axs[i].set_ylim(5,10)
	i = i+1

axs[0].set_ylabel("$log_10$(Energy)")

for k in range(0,3):
        axs[k].set_xlabel("distance ($\AA$)")


plt.show()
