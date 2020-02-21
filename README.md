# Description
## Data source


## Context
ETFs represent a cheap alternative to Mutual Funds and they are growing in fast in the last decade.
Is the 2017 hype around ETFs confirmed by good returns in 2018?

## Content
The file contains 25,265 Mutual Funds and 2,353 ETFs with general aspects (as Total Net Assets, management company and size), portfolio indicators (as cash, stocks, bonds, and sectors), returns (as yeartodate, 2018-10) and financial ratios (as price/earning, Treynor and Sharpe ratios, alpha, and beta).

## Acknowledgements
This dataset was scrapped by [Stefano Leone](https://www.kaggle.com/kerneler/starter-mutual-funds-and-etfs-50b33855-2) from the publicly available website https://finance.yahoo.com.

## Inspiration
Datasets allow for multiple comparisons regarding portfolio decisions from investment managers in Mutual Funds and portfolio restrictions to the indexes in ETFs.
The inspiration comes from the 2017 hype regarding ETFs, that convinced many investors to buy shares of Exchange Traded Funds rather than Mutual Funds.
Datasets will be updated every one or two semesters, hopefully with additional information scraped from Morningstar.com.

## Categories
- Basic Info
- Expenses and Earnings
- Investment allocation per industry
- Ratings

- Basic info (name, category, utilities, family, type, assets, earnings, yield, size, currentcy)
- Expense ratios (annual by fund and category)
- Percentage in stocks and founds
- Prices for earnings, books, sales, cashflow
- Industry (materials, cylical, finance, real estates, defensive, healtcare, utilities, communications, energy, industrials, technology)
- Ratings (us government, aaa, aa, a, bbb, bb, b, bellow b, others)
- Returns by found and category (per 1m, 3m, 1y, 3y, 5y, 10y, by year from 2018 - 2010, alpha, beta, mean anually, r squared, standard deviation, sharpe ratio, tereynor ratio)

## Columns
##### Basic Info
- fund_name - Name of the investment fund
- fund_extended_name - Full name of the investment fund
- category - Fund category
- fund_family - Fund family
- net_assets - Total net assets possessed by fund
- ytd_return - Year to date (YTD) returns on portfolio
- fund_yield - Fund [Yield](https://www.investopedia.com/terms/m/mutual-fund-yield.asp) (measure of the income return of a fund)
- legal_type - Legal type of a fund
- investment - Investment type/strategy 
- size - Size of fund
- currency - Default fund currency

##### Expenses and Earnings
- net_annual_expense_ratio_fund - [Total expense ration (TER)](https://www.investopedia.com/terms/t/ter.asp) for fund
- net_annual_expense_ratio_category - [Total expense ration (TER)](https://www.investopedia.com/terms/t/ter.asp) for category
- portfolio_stocks - Portfolio [stock/equity (ownership stakes)](https://www.thebalance.com/the-difference-between-stocks-and-bonds-417069) percentage
- portfolio_bonds - Portfolio [bonds (debt)](https://www.thebalance.com/the-difference-between-stocks-and-bonds-417069) percentage
- price_earnings - [Earning ratio](https://www.investopedia.com/terms/e/eps.asp)
- price_book - [Book ratio](https://www.investopedia.com/terms/p/price-to-bookratio.asp)
- price_sales - [Sales ratio](https://www.investopedia.com/terms/p/price-to-salesratio.asp)
- price_cashflow - [Cash Flow ratio](https://www.investopedia.com/terms/o/ocfratio.asp)

##### Investment allocation per industry
- basic_materials - Materials
- consumer_cyclical - Cyclical 
- financial_services - Finance 
- real_estate - Real Estates
- consumer_defensive - Defensive 
- healthcare - Health Care
- utilities - Utilities
- communication_services - Communications
- energy - Energy
- industrials - Industrial
- technology - Technology

##### Ratings
- rating_us_government - US government
- rating_aaa - aaa
- rating_aa - aa
- rating_a - a
- rating_bbb - bbb
- rating_bb - bb
- rating_b - b
- rating_below_b - below b
- rating_others - others


- fund_return_ytd - return year to date
- category_return_ytd - return year to date
- fund_return_1month - return 1 month
- category_return_1month - return 1 month
- fund_return_3months - return 3 months
- category_return_3months - return 3 months
- fund_return_1year - return 1 year
- category_return_1year - return 1 year
- fund_return_3years - return 3 years
- category_return_3years - return 3 years
- fund_return_5years - return 5 years
- category_return_5years - return 5 years
- fund_return_10years - return 10 years
- category_return_10years - return 10 years
- fund_return_2018 - return 2018
- fund_return_2017 - return 2017
- fund_return_2016 - return 2016
- fund_return_2015 - return 2015
- fund_return_2014 - return 2014
- fund_return_2013 - return 2013
- fund_return_2012 - return 2012
- fund_return_2011 - return 2011
- fund_return_2010 - return 2010
- fund_alpha_3years - ratio 3 years
- category_alpha_3years - ratio 3 years
- fund_alpha_5years - ratio 5 years
- category_alpha_5years - ratio 5 years
- fund_alpha_10years - ratio 10 years
- category_alpha_10years - ratio 10 years
- fund_beta_3years - ratio 3 years
- category_beta_3years - ratio 3 years
- fund_beta_5years - ratio 5 years
- category_beta_5years - ratio 5 years
- fund_beta_10years - ratio 10 years
- category_beta_10years - ratio 10 years
- fund_mean_annual_return_3years - returns 3 years
- category_mean_annual_return_3years - returns 3 years
- fund_mean_annual_return_5years - returns 5 years
- category_mean_annual_return_5years - returns 5 years
- fund_mean_annual_return_10years - returns 10 years
- category_mean_annual_return_10years - returns 10 years
- fund_r_squared_3years - r squared 3 years
- category_r_squared_3years -  r squared 3 years
- fund_r_squared_5years - r squared 5 years
- category_r_squared_5years - r squared 5 years
- fund_r_squared_10years - r squared 10 years
- category_r_squared_10years - r squared 10 years
- fund_standard_deviation_3years - stdev 3 years
- category_standard_deviation_3years - stdev 3 years
- fund_standard_deviation_5years - stdev 5 years
- category_standard_deviation_5years - stdev 5 years
- fund_standard_deviation_10years - stdev 10 years
- category_standard_deviation_10years - stdev 10 years
- fund_sharpe_ratio_3years - ratio 3 years
- category_sharpe_ratio_3years - ratio 3 years
- fund_sharpe_ratio_5years - ratio 5 years
- category_sharpe_ratio_5years - ratio 5 years
- fund_sharpe_ratio_10years - ratio 10 years
- category_sharpe_ratio_10years - ratio 10 years
- fund_treynor_ratio_3years - ratio 3 years
- category_treynor_ratio_3years - ratio 3 years