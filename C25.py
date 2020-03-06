import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)

houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

##########################################################
sns.distplot(houses["YearBuilt"],color='seagreen')
plt.show()
sns.distplot(houses["YearRemodAdd"],color='r')

##########################################################
plt.show()