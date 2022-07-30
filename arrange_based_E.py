import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv("Log10Energy_2dimers_all.dat", sep=' ', names=["distance", "angle", "log(Energy)"])
df1 = df.sort_values(by='log(Energy)')
#plt.style.use('ggplot')

#df2=df1.head(100)
#df2=df1.head(100).groupby(['distance','angle']).count()
df2=df1.head(100).groupby('distance').count()
#df2['distance'].hist()
df2.to_csv("lowest100E_dist.dat", sep=' ')
#plt.show()

