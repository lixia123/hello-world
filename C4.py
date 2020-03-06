#引入必要的module
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)

houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

##########################################################

orrelations=houses.corr()
attrs = orrelations.iloc[1:-1,1:-1]

threshold = 0.5

important_corrs = (attrs[abs(attrs) > threshold][attrs != 1.0]) .unstack().dropna().to_dict()

unique_important_corrs = pd.DataFrame(list(set([(tuple(sorted(key)), important_corrs[key])for key in important_corrs])),columns=['Attribute Pair', 'Correlation'])
 # sorted by absolute value
unique_important_corrs = unique_important_corrs.ix[abs(unique_important_corrs['Correlation']).argsort()[::-1]]

print(unique_important_corrs)


##########################################################