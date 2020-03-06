import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
dataset = pd.read_csv("c:\\usalaotu\\911.csv")
#根据title当中的信息，生成category和sub-category
dataset['Category'] = dataset['title'].apply(lambda x: x.split(':')[0])
dataset['Sub-Category'] = dataset['title'].apply(lambda x: ''.join(x.split(':')[1]))
#########################################################
sns.countplot('Category', data = dataset)
plt.show()
