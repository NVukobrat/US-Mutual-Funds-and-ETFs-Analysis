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
- Returns
- Returns by year
- Alpha Returns
- Beta Returns
- Mean Annual Returns
- R-Squared Annual Returns
- Standard Deviation Annual
- Annual Sharpe Ratio
- Annual Treynor Ratio

## Columns
##### Basic Info
- **fund_name** - Name of the investment fund
- **fund_extended_name** - Full name of the investment fund
- **category** - Fund category
- **fund_family** - Fund family
- **net_assets** - Total net assets possessed by fund
- **ytd_return** - Year to date (YTD) returns on portfolio
- **fund_yield** - Fund [Yield](https://www.investopedia.com/terms/m/mutual-fund-yield.asp) (measure of the income return of a fund)
- **legal_type** - Legal type of a fund
- **investment** - Investment type/strategy 
- **size** - Size of fund
- **currency** - Default fund currency

##### Expenses and Earnings
- **net_annual_expense_ratio_fund** - [Total expense ration (TER)](https://www.investopedia.com/terms/t/ter.asp) for fund
- **net_annual_expense_ratio_category** - [Total expense ration (TER)](https://www.investopedia.com/terms/t/ter.asp) for category
- **portfolio_stocks** - Portfolio [stock/equity (ownership stakes)](https://www.thebalance.com/the-difference-between-stocks-and-bonds-417069) percentage
- **portfolio_bonds** - Portfolio [bonds (debt)](https://www.thebalance.com/the-difference-between-stocks-and-bonds-417069) percentage
- **price_earnings** - [Earning ratio](https://www.investopedia.com/terms/e/eps.asp)
- **price_book** - [Book ratio](https://www.investopedia.com/terms/p/price-to-bookratio.asp)
- **price_sales** - [Sales ratio](https://www.investopedia.com/terms/p/price-to-salesratio.asp)
- **price_cashflow** - [Cash Flow ratio](https://www.investopedia.com/terms/o/ocfratio.asp)

##### Investment allocation per industry
- **basic_materials** - Materials
- **consumer_cyclical** - Cyclical 
- **financial_services** - Finance 
- **real_estate** - Real Estates
- **consumer_defensive** - Defensive 
- **healthcare** - Health Care
- **utilities** - Utilities
- **communication_services** - Communications
- **energy** - Energy
- **industrials** - Industrial
- **technology** - Technology

##### Ratings
- **rating_us_government** - US government
- **rating_aaa** - [AAA](https://www.investopedia.com/terms/i/investmentgrade.asp)
- **rating_aa** - [AA](https://www.investopedia.com/terms/i/investmentgrade.asp)
- **rating_a** - [A](https://www.investopedia.com/terms/i/investmentgrade.asp)
- **rating_bbb** - [BBB](https://www.investopedia.com/terms/i/investmentgrade.asp)
- **rating_bb** - [BB](https://www.investopedia.com/terms/i/investmentgrade.asp)
- **rating_b** - [B](https://www.investopedia.com/terms/i/investmentgrade.asp)
- **rating_below_b** - [Below B](https://www.investopedia.com/terms/i/investmentgrade.asp)
- **rating_others** - Others

##### Returns
- **fund_return_ytd** - Return [Year to Date (YTD)](https://www.investopedia.com/ask/answers/060115/how-do-i-calculate-my-yeartodate-ytd-return-my-portfolio.asp)
- **category_return_ytd** - Return [Year to Date (YTD)](https://www.investopedia.com/ask/answers/060115/how-do-i-calculate-my-yeartodate-ytd-return-my-portfolio.asp)
- **fund_return_1month** - Return 1 month
- **category_return_1month** - Return 1 month
- **fund_return_3months** - Return 3 months
- **category_return_3months** - Return 3 months
- **fund_return_1year** - Return 1 year
- **category_return_1year** - Return 1 year
- **fund_return_3years** - Return 3 years
- **category_return_3years** - Return 3 years
- **fund_return_5years** - Return 5 years
- **category_return_5years** - Return 5 years
- **fund_return_10years** - Return 10 years
- **category_return_10years** - Return 10 years

##### Returns by year
- **fund_return_2018** - Return 2018
- **fund_return_2017** - Return 2017
- **fund_return_2016** - Return 2016
- **fund_return_2015** - Return 2015
- **fund_return_2014** - Return 2014
- **fund_return_2013** - Return 2013
- **fund_return_2012** - Return 2012
- **fund_return_2011** - Return 2011
- **fund_return_2010** - Return 2010

##### [Alpha](https://www.investopedia.com/terms/a/alpha.asp) Returns
- **fund_alpha_3years** - Ratio 3 years
- **category_alpha_3years** - Ratio 3 years
- **fund_alpha_5years** - Ratio 5 years
- **category_alpha_5years** - Ratio 5 years
- **fund_alpha_10years** - Ratio 10 years
- **category_alpha_10years** - Ratio 10 years

##### [Beta](https://www.investopedia.com/ask/answers/102714/whats-difference-between-alpha-and-beta.asp) Returns
- **fund_beta_3years** - Ratio 3 years
- **category_beta_3years** - Ratio 3 years
- **fund_beta_5years** - Ratio 5 years
- **category_beta_5years** - Ratio 5 years
- **fund_beta_10years** - Ratio 10 years
- **category_beta_10years** - Ratio 10 years

##### Mean Annual Returns
- **fund_mean_annual_return_3years** - Returns 3 years
- **category_mean_annual_return_3years** - Returns 3 years
- **fund_mean_annual_return_5years** - Returns 5 years
- **category_mean_annual_return_5years** - Returns 5 years
- **fund_mean_annual_return_10years** - Returns 10 years
- **category_mean_annual_return_10years** - Returns 10 years

##### [R-Squared Annual Returns](https://www.investopedia.com/terms/r/r-squared.asp)
- **fund_r_squared_3years** - R-Squared 3 years
- **category_r_squared_3years** - R-Squared 3 years
- **fund_r_squared_5years** - R-Squared 5 years
- **category_r_squared_5years** - R-Squared 5 years
- **fund_r_squared_10years** - R-Squared 10 years
- **category_r_squared_10years** - R-Squared 10 years

##### [Standard Deviation](https://www.investopedia.com/terms/s/standarddeviation.asp) Annual
- **fund_standard_deviation_3years** - Standard Deviation 3 years
- **category_standard_deviation_3years** - Standard Deviation 3 years
- **fund_standard_deviation_5years** - Standard Deviation 5 years
- **category_standard_deviation_5years** - Standard Deviation 5 years
- **fund_standard_deviation_10years** - Standard Deviation 10 years
- **category_standard_deviation_10years** - Standard Deviation 10 years

##### Annual [Sharpe Ratio](https://www.investopedia.com/terms/s/sharperatio.asp)
- **fund_sharpe_ratio_3years** - Sharpe Ratio 3 years
- **category_sharpe_ratio_3years** - Sharpe Ratio 3 years
- **fund_sharpe_ratio_5years** - Sharpe Ratio 5 years
- **category_sharpe_ratio_5years** - Sharpe Ratio 5 years
- **fund_sharpe_ratio_10years** - Sharpe Ratio 10 years
- **category_sharpe_ratio_10years** - Sharpe Ratio 10 years

##### Annual [Treynor Ratio](https://www.investopedia.com/terms/t/treynorratio.asp)
- **fund_treynor_ratio_3years** - Treynor Ratio 3 years
- **category_treynor_ratio_3years** - Treynor Ratio 3 years