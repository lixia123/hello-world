import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
dataset = pd.read_csv("c:\\usalaotu\\911.csv")
#根据title当中的信息，生成category和sub-category
dataset['Category'] = dataset['title'].apply(lambda x: x.split(':')[0])
dataset['Sub-Category'] = dataset['title'].apply(lambda x: ''.join(x.split(':')[1]))
#########################################################
#新生成一系列时间相关的字段
from dateutil import parser
dataset['datetime'] = dataset['timeStamp'].apply(lambda x : parser.parse(x))
dataset['Month'] = dataset['datetime'].apply(lambda x: x.month)
dataset['Year'] = dataset['datetime'].apply(lambda x: x.year)
dataset['day'] = dataset['datetime'].apply(lambda x: x.day)

def timeZone(timestamp):
    hour = timestamp.hour
    if (hour > 6 and hour < 12) or hour == 6:
        return 'Morning'
    elif hour == 12:
        return 'Noon'
    elif hour > 12 and hour < 17:
        return 'Afternoon'
    elif (hour > 17 and hour < 21) or hour == 17:
        return 'Evening'
    elif (hour > 21 and hour < 6) or hour == 21:
        return 'Night'
dataset['timezone'] = dataset['datetime'].apply(lambda x: timeZone(x))

#########################################
#时间转换为星期几
import datetime
def dayofweek(x):
    day = x.weekday()
    if day == 0:
        return 'Monday'
    elif day == 1:
        return 'Tuesday'
    elif day == 2:
        return 'Wednesday'
    elif day == 3:
        return 'Thursday'
    elif day == 4:
        return 'Friday'
    elif day == 5:
        return 'Saturday'
    elif day == 6:
        return 'Sunday'
dataset['dayofweek'] = dataset['datetime'].apply(lambda x : dayofweek(x))

#####################################################
plt.title('LOWER MERION incidents by Category')
sns.countplot('Category', data = dataset[dataset['twp'] == 'LOWER MERION'])
plt.show()
