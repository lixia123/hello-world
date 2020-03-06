import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)

houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

##########################################################





print('房屋总评分和saleprice之间的关系')
print(houses[['OverallQual','SalePrice']].groupby(['OverallQual'],as_index=False).mean().sort_values(by='OverallQual', ascending=False))



print('车位和saleprice之间的关系')
print(houses[['GarageCars','SalePrice']].groupby(['GarageCars'],as_index=False).mean().sort_values(by='GarageCars', ascending=False))
print('壁炉和saleprice之间的关系')
print(houses[['Fireplaces','SalePrice']].groupby(['Fireplaces'],as_index=False).mean().sort_values(by='Fireplaces', ascending=False))