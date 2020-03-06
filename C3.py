#引入必要的module
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)

#载入数据
houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

##########################################################

#将相关性以柱状图显示

num_feat = houses.columns[houses.dtypes != object]
num_feat = num_feat[1:-1]
labels = []
values = []



for col in num_feat:
    labels.append(col)
    values.append(np.corrcoef(houses[col].values, houses.SalePrice.values)[0, 1])

ind = np.arange(len(labels))
width = 0.8
fig, ax = plt.subplots(figsize=(12, 40))
rects = ax.barh(ind, np.array(values), color='green')
ax.set_yticks(ind + ((width) / 2.))
ax.set_yticklabels(labels, rotation='horizontal')
ax.set_xlabel("Correlation coefficient")
ax.set_title("Correlation Coefficients w.r.t Sale Price")


##########################################################
plt.show()