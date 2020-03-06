import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
dataset = pd.read_csv("c:\\usalaotu\\911.csv")
#根据title当中的信息，生成category和sub-category
dataset['Category'] = dataset['title'].apply(lambda x: x.split(':')[0])
dataset['Sub-Category'] = dataset['title'].apply(lambda x: ''.join(x.split(':')[1]))
#########################################################
print('categories:\n',dataset['Category'].value_counts())
print('=======================================')
print('number of unique emergency titles:\n',dataset['title'].nunique())
print('=======================================')
print('Top 5 EMS Sub categories:\n',dataset[dataset['Category'] == 'EMS']['Sub-Category'].value_counts().head(5))
print('=======================================')
print('Top 5 Fire Sub categories:\n',dataset[dataset['Category'] == 'Fire']['Sub-Category'].value_counts().head(5))
print('=======================================')
print('Top 5 Traffic Sub categories:\n',dataset[dataset['Category'] == 'Traffic']['Sub-Category'].value_counts().head(5))
print('=======================================')

