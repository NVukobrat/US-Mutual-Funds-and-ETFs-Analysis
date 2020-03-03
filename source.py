import numpy as np
import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt


def main():
    # Load dataset
    df = pd.read_csv('dataset/ETFs.csv', index_col=False)
    df['count'] = 1  # Count column

    # Clean
    df.replace('', 'NaN', inplace=True)
    df.replace('nan', 'NaN', inplace=True)

    # Populate
    df.replace('NaN', np.nan, inplace=True)
    df = df.fillna(df.mean)

    # Count(Bar) plots
    count = [
        'legal_type',
        'investment',
        'size',
        'currency',
    ]
    for c in count:
        chart = sns.countplot(df[c])
        chart.set_xticklabels(
            chart.get_xticklabels(),
            rotation=30,
            horizontalalignment='right',
        )
        plt.show()

    # # Line
    # line = [
    #     'net_assets',
    #     'ytd_return',
    #     'fund_yield',
    # ]
    # for l in line:
    #     df[l] = pd.to_numeric(df[l])
    #
    # for x in range(len(line)):
    #     for y in range(x + 1, len(line)):
    #         sns.lineplot(x=df[line[y]], y=df[line[x]])
    #         plt.show()


if __name__ == '__main__':
    main()
