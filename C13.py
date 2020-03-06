import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)

houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

##########################################################
houses["Alley"] = houses["Alley"].fillna('None') #用字符“None”填充空值
sns.stripplot(x=houses["Alley"], y=houses["SalePrice"],jitter=True) #jitter=True，不让小圆点都显示在通一条直线上，不然看不清。
##########################################################
plt.show()