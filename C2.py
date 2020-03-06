#引入必要的module
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)


houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

#计算数据集中各个字段和“SalePrice”字段的相关性，我们只关心，相关性大于0.5的字段。
#这个相关性计算是很重要的。
corr=houses.corr()["SalePrice"]
#对于相关系数进行排序
print(corr[np.argsort(corr, axis=0)[::-1]])