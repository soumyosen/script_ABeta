
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv("Log10Energy_2dimers_all.dat", sep=' ', names=["distance", "angle", "log(Energy)"])

fig, axs = plt.subplots(7,2)
fig.subplots_adjust(hspace = .5, wspace=.4)
axs = axs.ravel()
i = 0

for dist in [4.7, 4.8, 4.9, 5.0, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9, 6.0]:
	df1 = df[df['distance']==dist]
	axs[i].plot(df1['angle'],df1['log(Energy)'],linewidth=1.0)
	axs[i].set_title(dist, color='red')
	axs[i].set_ylim(5,12)
	#axs[i].axvline(x=1.2, color='yellow')
	#axs[i].axvline(x=3.35, color='yellow')
	i = i+1

axs[6].set_ylabel("$log_10$(Energy)")

for k in range(12,14):
        axs[k].set_xlabel("angle (degree)")


plt.show()
