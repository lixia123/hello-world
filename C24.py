import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="whitegrid", color_codes=True)
sns.set(font_scale=1)

houses=pd.read_csv("c:\\usalaotu\\house\\train.csv")
houses_test = pd.read_csv("c:\\usalaotu\\house\\test.csv")

##########################################################
plt.scatter(houses["GarageArea"],houses.SalePrice, color='green')
plt.title("Sale Price vs Garage Area")
plt.ylabel('Sale Price(in dollars)')
plt.xlabel("Garage Area in sq foot")

##########################################################
plt.show()
