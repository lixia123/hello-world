import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)

houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

##########################################################
#装饰面类型与saleprice之间的关系
sns.boxplot("MasVnrType","SalePrice",data=houses);
##########################################################
plt.show()