import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)
houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

##########################################################
#If PoolArea is 0, that means that house doesn't have a pool.
#So we can replace PoolQuality with None.
houses["PoolQC"] = houses["PoolQC"].fillna('None') #处理null
sns.factorplot("PoolArea","SalePrice",data=houses,hue="PoolQC",kind='bar') #用图示表示泳池状况
plt.title("Pool Area , Pool quality and SalePrice ")
plt.ylabel("SalePrice")
plt.xlabel("Pool Area in sq feet")
##########################################################
plt.show()