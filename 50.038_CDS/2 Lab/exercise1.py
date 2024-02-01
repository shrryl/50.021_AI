# Importing libraries
import pandas as pd
# given
city_names = pd.Series(['San Francisco', 'San Jose', 'Sacramento'])
population = pd.Series([852469, 1015785, 485199])
cities = pd.DataFrame({ 'City name': city_names, 'Population': population })
cities['Area square miles'] = pd.Series([46.87, 176.53, 97.92])

# Add a new column bool if city named after saint & greater than 50 square miles
cities['Bool'] = (cities['City name'].str.contains('San')) & (cities['Area square miles'] >50)

# view result
print(cities.head(3))