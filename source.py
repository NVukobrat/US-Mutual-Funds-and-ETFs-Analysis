import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
from sklearn.preprocessing import LabelEncoder


def pre_config():
    plt.rcParams.update({'font.size': 20})


def load_dataset():
    df_etf = pd.read_csv('dataset/ETFs.csv', index_col=False)
    df_mf = pd.read_csv('dataset/Mutual Funds.csv', index_col=False)

    return df_etf, df_mf


# Use for ML part of the project
def clean(df):
    df.replace('', 'NaN', inplace=True)
    df.replace('nan', 'NaN', inplace=True)
    df.replace('NaN', np.nan, inplace=True)

    # num_mean = df.select_dtypes(np.number).mean()
    num_mean = df.select_dtypes(np.number)
    num_mean.join(df['fund_treynor_ratio_3years'])  # As consequence of too many NaN values
    num_mean.join(df['category_treynor_ratio_5years'])  # As consequence of too many NaN values
    # num_mean = num_mean.mean()

    str_mean = df[df.columns.difference(num_mean.columns)]
    str_mean = str_mean.drop('fund_treynor_ratio_3years', axis=1)  # As consequence of too many NaN values
    str_mean = str_mean.drop('category_treynor_ratio_5years', axis=1)  # As consequence of too many NaN values
    str_mean.replace(np.nan, 'NaN', inplace=True)
    le = LabelEncoder()
    for col in str_mean:
        df[col] = le.fit_transform(str_mean[col])

    mu = num_mean.quantile(0)
    sigma = num_mean.std(axis=0)
    for col in num_mean:
        stack = num_mean[col]
        null_stack = stack[pd.isnull(stack)]
        ran = np.random.normal(mu[col], sigma[col], len(null_stack))
        stack.loc[null_stack.index] = ran
        df[col] = stack.values

    # for col in str_mean:
    #     df[col] = le.inverse_transform(str_mean[col])

    return df


def hist_bar_plot(df, rc_num=(2, 6), size=(16 * 3, 9 * 3)):
    # Chose adequate columns for visualization
    num_unique_col = df.nunique()
    df = df[[col for col in df if 1 < num_unique_col[col] < 50]]

    # Create Hist and Bar plots
    plt.figure(figsize=size)
    for i, col in enumerate(df):
        plt.subplot(rc_num[0], rc_num[1], i + 1)
        df_column = df[col]
        if np.issubdtype(type(df_column.iloc[0]), np.number):
            df_column.hist()
        else:
            df_column.value_counts().plot.bar()
        plt.title(col)
        plt.xticks(rotation=30)
        plt.ylabel('counts')

        if i == 10:
            break
    plt.tight_layout(pad=1.0, w_pad=1.0, h_pad=1.0)
    plt.show()


def main():
    pre_config()
    df_etf, df_mf = load_dataset()
    # df_etf = clean(df_etf)
    hist_bar_plot(df_etf)


if __name__ == '__main__':
    main()
