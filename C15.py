import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)
houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

##########################################################
houses["FireplaceQu"] = houses["FireplaceQu"].fillna('None') #首先处理空值
sns.factorplot("Fireplaces","SalePrice",data=houses,hue="FireplaceQu")
print(pd.crosstab(houses.Fireplaces, houses.FireplaceQu)) #打印统计结果
##########################################################
plt.show()