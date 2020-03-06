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
print('土地面积开平方之后的结果  和  房子到街道的距离之间的相关系数：')
houses['SqrtLotArea']=np.sqrt(houses['LotArea'])
print(houses['LotFrontage'].corr(houses['SqrtLotArea']))
sns.jointplot(houses['LotFrontage'],houses['SqrtLotArea'],color='gold')
##########################################################
plt.show()