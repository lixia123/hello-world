import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
dataset = pd.read_csv("c:\\usalaotu\\911.csv")
print('top 5 emergencies in dataset:\n',dataset['title'].value_counts().head(10))
