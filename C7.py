
import pandas as pd

import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)

houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

##########################################################
print('如下columns含有missing value')
null_columns=houses.columns[houses.isnull().any()]
print(houses[null_columns].isnull().sum())
##########################################################