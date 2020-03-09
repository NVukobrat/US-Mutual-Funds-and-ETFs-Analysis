import numpy as np
import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt


def main():
    # Load dataset
    df = pd.read_csv('dataset/ETFs.csv', index_col=False)

    num_unique_col = df.nunique()
    df = df[[col for col in df if 1 < num_unique_col[col] < 50]]
    for col in df:
        df_column = df[col]
        if np.issubdtype(type(df_column.iloc[0]), np.number):
            df_column.hist()
        else:
            df_column.value_counts().plot().bar(x=df_column, height=90)
        plt.ylabel('counts')
        plt.xticks(rotation=30)
        plt.title(col)
        plt.show()


if __name__ == '__main__':
    main()
