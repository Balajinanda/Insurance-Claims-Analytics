import pandas as pd

df = pd.read_csv("insurance_data.csv")

print("First 5 rows:")
print(df.head())

print("\nDataset shape:")
print(df.shape)

print("\nMissing values:")
print(df.isnull().sum())

df = df.drop_duplicates()

df.to_csv("insurance_clean.csv", index=False)

print("\nCleaning completed. insurance_clean.csv created.")