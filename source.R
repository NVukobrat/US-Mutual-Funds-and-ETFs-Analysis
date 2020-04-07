library(tidyr)
library(fpp)
library(dplyr)

library(fBasics)

library(ggplot2)
library(corrplot)
library(plotly)
library(ggalt)

library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(party)
library(MASS)
library(Hmisc)
library(splus2R)

library(PortfolioAnalytics)
library(PerformanceAnalytics)
library(zoo)
library(DEoptim)
library(tidyverse)
library(tidyquant)
library(ROI)

require(ROI.plugin.glpk)
require(ROI.plugin.quadprog)

setwd("/home/nvukobrat/Documents/GitHub/us-mutial-funds-and-etfs-analysis")
ETF_data <- read.csv("dataset/ETFs.csv", sep = ",", header = TRUE, na = c("N/A", ""))
MUTUAL_data <- read.csv("dataset/Mutual Funds.csv", sep = ",", header = TRUE, na = c("N/A", ""))

ETF_data$price_earnings <- as.numeric(ETF_data$price_earnings)
MUTUAL_data$price_earnings <- as.numeric(MUTUAL_data$price_earnings)

ETF_data$fund_symbol <- NULL
ETF_data$fund_name <- NULL
ETF_data$fund_extended_name <- NULL
ETF_data$category <- NULL
ETF_data$fund_family <- NULL
ETF_data$currency <- NULL
ETF_data$legal_type <- NULL
ETF_data$rating_us_government <- NULL
ETF_data$returns_ytd <- NULL
ETF_data$alpha_3y <- NULL
ETF_data$beta_3y <- NULL
ETF_data$treynor_ratio_3y <- NULL
ETF_data$sharpe_ratio_3y <- NULL
ETF_data$standard_deviation_3y <- NULL
ETF_data$mean_annual_return_3y <- NULL
ETF_data$net_assets <- NULL
ETF_data$ytd_return <- NULL
ETF_data$fund_yield <- NULL
ETF_data$inception_date <- NULL
ETF_data$currency <- NULL
ETF_data$net_annual_expense_ratio_fund <- NULL
ETF_data$net_annual_expense_ratio_category <- NULL
ETF_data$price_book <- NULL
ETF_data$price_sales <- NULL
ETF_data$price_cashflow <- NULL
ETF_data$rating_us_government <- NULL
ETF_data$fund_return_ytd <- NULL
ETF_data$category_return_ytd <- NULL
ETF_data$fund_return_1month <- NULL
ETF_data$category_return_1month <- NULL
ETF_data$fund_return_3months <- NULL
ETF_data$category_return_3months <- NULL
ETF_data$fund_return_1year <- NULL
ETF_data$category_return_1year <- NULL
ETF_data$fund_return_3years <- NULL
ETF_data$category_return_3years <- NULL
ETF_data$fund_return_5years <- NULL
ETF_data$category_return_5years <- NULL
ETF_data$fund_return_10years <- NULL
ETF_data$category_return_10years <- NULL
ETF_data$fund_alpha_3years <- NULL
ETF_data$category_alpha_3years <- NULL
ETF_data$fund_alpha_5years <- NULL
ETF_data$category_alpha_5years <- NULL
ETF_data$fund_alpha_10years <- NULL
ETF_data$category_alpha_10years <- NULL
ETF_data$fund_beta_3years <- NULL
ETF_data$category_beta_3years <- NULL
ETF_data$fund_beta_5years <- NULL
ETF_data$category_beta_5years <- NULL
ETF_data$fund_beta_10years <- NULL
ETF_data$category_beta_10years <- NULL
ETF_data$fund_mean_annual_return_3years <- NULL
ETF_data$category_mean_annual_return_3years <- NULL
ETF_data$fund_mean_annual_return_5years <- NULL
ETF_data$category_mean_annual_return_5years <- NULL
ETF_data$fund_mean_annual_return_10years <- NULL
ETF_data$category_mean_annual_return_10years <- NULL
ETF_data$fund_r_squared_3years <- NULL
ETF_data$category_r_squared_3years <- NULL
ETF_data$fund_r_squared_5years <- NULL
ETF_data$category_r_squared_5years <- NULL
ETF_data$fund_r_squared_10years <- NULL
ETF_data$category_r_squared_10years <- NULL
ETF_data$fund_standard_deviation_3years <- NULL
ETF_data$category_standard_deviation_3years <- NULL
ETF_data$fund_standard_deviation_5years <- NULL
ETF_data$category_standard_deviation_5years <- NULL
ETF_data$fund_standard_deviation_10years <- NULL
ETF_data$category_standard_deviation_10years <- NULL
ETF_data$fund_sharpe_ratio_3years <- NULL
ETF_data$category_sharpe_ratio_3years <- NULL
ETF_data$fund_sharpe_ratio_5years <- NULL
ETF_data$category_sharpe_ratio_5years <- NULL
ETF_data$fund_sharpe_ratio_10years <- NULL
ETF_data$category_sharpe_ratio_10years <- NULL
ETF_data$fund_treynor_ratio_3years <- NULL
ETF_data$category_treynor_ratio_3years <- NULL
ETF_data$fund_treynor_ratio_5years <- NULL
ETF_data$category_treynor_ratio_5years <- NULL
ETF_data$fund_treynor_ratio_10years <- NULL
ETF_data$category_treynor_ratio_10years <- NULL

MUTUAL_data$fund_symbol <- NULL
MUTUAL_data$fund_name <- NULL
MUTUAL_data$fund_extended_name <- NULL
MUTUAL_data$category <- NULL
MUTUAL_data$fund_family <- NULL
MUTUAL_data$currency <- NULL
MUTUAL_data$rating_us_government <- NULL
MUTUAL_data$returns_ytd <- NULL
MUTUAL_data$alpha_3y <- NULL
MUTUAL_data$beta_3y <- NULL
MUTUAL_data$treynor_ratio_3y <- NULL
MUTUAL_data$sharpe_ratio_3y <- NULL
MUTUAL_data$standard_deviation_3y <- NULL
MUTUAL_data$mean_annual_return_3y <- NULL
MUTUAL_data$net_assets <- NULL
MUTUAL_data$ytd_return <- NULL
MUTUAL_data$fund_yield <- NULL
MUTUAL_data$inception_date <- NULL
MUTUAL_data$currency <- NULL
MUTUAL_data$net_annual_expense_ratio_fund <- NULL
MUTUAL_data$net_annual_expense_ratio_category <- NULL
MUTUAL_data$price_book <- NULL
MUTUAL_data$price_sales <- NULL
MUTUAL_data$price_cashflow <- NULL
MUTUAL_data$rating_us_government <- NULL
MUTUAL_data$fund_return_ytd <- NULL
MUTUAL_data$category_return_ytd <- NULL
MUTUAL_data$fund_return_1month <- NULL
MUTUAL_data$category_return_1month <- NULL
MUTUAL_data$fund_return_3months <- NULL
MUTUAL_data$category_return_3months <- NULL
MUTUAL_data$fund_return_1year <- NULL
MUTUAL_data$category_return_1year <- NULL
MUTUAL_data$fund_return_3years <- NULL
MUTUAL_data$category_return_3years <- NULL
MUTUAL_data$fund_return_5years <- NULL
MUTUAL_data$category_return_5years <- NULL
MUTUAL_data$fund_return_10years <- NULL
MUTUAL_data$category_return_10years <- NULL
MUTUAL_data$fund_alpha_3years <- NULL
MUTUAL_data$category_alpha_3years <- NULL
MUTUAL_data$fund_alpha_5years <- NULL
MUTUAL_data$category_alpha_5years <- NULL
MUTUAL_data$fund_alpha_10years <- NULL
MUTUAL_data$category_alpha_10years <- NULL
MUTUAL_data$fund_beta_3years <- NULL
MUTUAL_data$category_beta_3years <- NULL
MUTUAL_data$fund_beta_5years <- NULL
MUTUAL_data$category_beta_5years <- NULL
MUTUAL_data$fund_beta_10years <- NULL
MUTUAL_data$category_beta_10years <- NULL
MUTUAL_data$fund_mean_annual_return_3years <- NULL
MUTUAL_data$category_mean_annual_return_3years <- NULL
MUTUAL_data$fund_mean_annual_return_5years <- NULL
MUTUAL_data$category_mean_annual_return_5years <- NULL
MUTUAL_data$fund_mean_annual_return_10years <- NULL
MUTUAL_data$category_mean_annual_return_10years <- NULL
MUTUAL_data$fund_r_squared_3years <- NULL
MUTUAL_data$category_r_squared_3years <- NULL
MUTUAL_data$fund_r_squared_5years <- NULL
MUTUAL_data$category_r_squared_5years <- NULL
MUTUAL_data$fund_r_squared_10years <- NULL
MUTUAL_data$category_r_squared_10years <- NULL
MUTUAL_data$fund_standard_deviation_3years <- NULL
MUTUAL_data$category_standard_deviation_3years <- NULL
MUTUAL_data$fund_standard_deviation_5years <- NULL
MUTUAL_data$category_standard_deviation_5years <- NULL
MUTUAL_data$fund_standard_deviation_10years <- NULL
MUTUAL_data$category_standard_deviation_10years <- NULL
MUTUAL_data$fund_sharpe_ratio_3years <- NULL
MUTUAL_data$category_sharpe_ratio_3years <- NULL
MUTUAL_data$fund_sharpe_ratio_5years <- NULL
MUTUAL_data$category_sharpe_ratio_5years <- NULL
MUTUAL_data$fund_sharpe_ratio_10years <- NULL
MUTUAL_data$category_sharpe_ratio_10years <- NULL
MUTUAL_data$fund_treynor_ratio_3years <- NULL
MUTUAL_data$category_treynor_ratio_3years <- NULL
MUTUAL_data$fund_treynor_ratio_5years <- NULL
MUTUAL_data$category_treynor_ratio_5years <- NULL
MUTUAL_data$fund_treynor_ratio_10years <- NULL
MUTUAL_data$category_treynor_ratio_10years <- NULL

MUTUAL_data$morningstar_rating <- NULL
MUTUAL_data$inception_date <- NULL
MUTUAL_data$portfolio_cash<- NULL
MUTUAL_data$portfolio_others <- NULL
MUTUAL_data$portfolio_preferred <- NULL
MUTUAL_data$portfolio_convertable <- NULL
MUTUAL_data$morningstar_return_rating <- NULL
MUTUAL_data$morningstar_risk_rating <- NULL
MUTUAL_data$median_market_cap <- NULL
MUTUAL_data$bond_maturity <- NULL
MUTUAL_data$bond_duration <- NULL
MUTUAL_data$category_return_2018 <- NULL
MUTUAL_data$category_return_2017 <- NULL
MUTUAL_data$category_return_2016 <- NULL
MUTUAL_data$category_return_2015 <- NULL
MUTUAL_data$category_return_2014 <- NULL
MUTUAL_data$category_return_2013 <- NULL
MUTUAL_data$category_return_2012 <- NULL
MUTUAL_data$category_return_2011 <- NULL
MUTUAL_data$category_return_2010 <- NULL
MUTUAL_data$years_up <- NULL
MUTUAL_data$years_down <- NULL

ETF_data <- data.frame(na.omit(ETF_data))
MUTUAL_data <- data.frame(na.omit(MUTUAL_data))

ETF_data$fund_type <- "ETF"
MUTUAL_data$fund_type <- "MF"
BOTH_data <- rbind(ETF_data, MUTUAL_data)
remove(ETF_data, MUTUAL_data)

BOTH_data$portfolio_bonds <- BOTH_data$portfolio_bonds / 100
BOTH_data$portfolio_stocks <- BOTH_data$portfolio_stocks / 100

BOTH_data$fund_return_2010 <- BOTH_data$fund_return_2010 / 100
BOTH_data$fund_return_2011 <- BOTH_data$fund_return_2011 / 100
BOTH_data$fund_return_2012 <- BOTH_data$fund_return_2012 / 100
BOTH_data$fund_return_2013 <- BOTH_data$fund_return_2013 / 100
BOTH_data$fund_return_2014 <- BOTH_data$fund_return_2014 / 100
BOTH_data$fund_return_2015 <- BOTH_data$fund_return_2015 / 100
BOTH_data$fund_return_2016 <- BOTH_data$fund_return_2016 / 100
BOTH_data$fund_return_2017 <- BOTH_data$fund_return_2017 / 100
BOTH_data$fund_return_2018 <- BOTH_data$fund_return_2018 / 100

BOTH_data$basic_materials <- BOTH_data$basic_materials / 100
BOTH_data$consumer_cyclical <- BOTH_data$consumer_cyclical / 100
BOTH_data$financial_services <- BOTH_data$financial_services / 100
BOTH_data$real_estate <- BOTH_data$real_estate / 100
BOTH_data$consumer_defensive <- BOTH_data$consumer_defensive / 100
BOTH_data$healthcare <- BOTH_data$healthcare / 100
BOTH_data$utilities <- BOTH_data$utilities / 100
BOTH_data$communication_services <- BOTH_data$communication_services / 100
BOTH_data$energy <- BOTH_data$energy / 100
BOTH_data$industrials <- BOTH_data$industrials / 100
BOTH_data$technology <- BOTH_data$technology / 100

BOTH_data$rating_aaa <- BOTH_data$rating_aaa / 100
BOTH_data$rating_aa <- BOTH_data$rating_aa / 100
BOTH_data$rating_a <- BOTH_data$rating_a / 100
BOTH_data$rating_bbb <- BOTH_data$rating_bbb / 100
BOTH_data$rating_bb <- BOTH_data$rating_bb / 100
BOTH_data$rating_b <- BOTH_data$rating_b / 100
BOTH_data$rating_below_b <- BOTH_data$rating_below_b / 100
BOTH_data$rating_others <- BOTH_data$rating_others / 100
