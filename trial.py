import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv("Log10Energy_2dimers_all.dat", sep=' ', names=["distance", "angle", "log(Energy)"])
df1 = df.pivot(index="distance", columns="angle")
#print df1
z = df1.as_matrix()
print z.shape
