# Loading libraries
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
library(ROI)
require(ROI.plugin.glpk)
require(ROI.plugin.quadprog)
library(tidyverse)
library(tidyquant)

# Loading data
setwd('/home/nvukobrat/Documents/GitHub/us-mutial-funds-and-etfs-analysis')
ETF_data <- read.csv("dataset/ETFs.csv", sep = ",", header = TRUE, na = c("N/A", ""))
MUTUAL_data <- read.csv("dataset/Mutual Funds.csv", sep = ",", header = TRUE, na = c("N/A", ""))

ETF_data$price_earnings <- as.numeric(ETF_data$price_earnings)
MUTUAL_data$price_earnings <- as.numeric(MUTUAL_data$price_earnings)

# Cleaning ETF (removing columns)
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

# Cleaning MF (removing columns)
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

# Removing MFs attributes that don't exist in ETFs
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

# Cleaning missing data
ETF_data <- data.frame(na.omit(ETF_data))
MUTUAL_data <- data.frame(na.omit(MUTUAL_data))

# Combine dataframes
BOTH_data <- rbind(ETF_data, MUTUAL_data)
remove(ETF_data, MUTUAL_data)

# Normalizing from decimal to percentage range [0, 1]
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

# TODO: More details
# 2. Deklaracja - dołączenie wag dla wszystkich klas aktywów w kontekście wag dla całego portfolio,
# zgodnie z założeniem, że: 0 < waga_aktywa <= 1 ORAZ suma(waga_wszystkich_aktywów) = 1
# Wagi dla każdego aktywa z osobna w kontekście całego portfolio dla akcji, gdzie
# klasa_aktywa(akcje) * podklasa_aktywa(sektor_akcji)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_basic_materials" = BOTH_data$basic_materials * BOTH_data$portfolio_stocks)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_consumer_cyclical" = BOTH_data$consumer_cyclical * BOTH_data$portfolio_stocks)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_financial_services" = BOTH_data$financial_services * BOTH_data$portfolio_stocks)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_real_estate" = BOTH_data$real_estate * BOTH_data$portfolio_stocks)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_consumer_defensive" = BOTH_data$consumer_defensive * BOTH_data$portfolio_stocks)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_healthcare" = BOTH_data$healthcare * BOTH_data$portfolio_stocks)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_utilities" = BOTH_data$utilities * BOTH_data$portfolio_stocks)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_communication_services" = BOTH_data$communication_services * BOTH_data$portfolio_stocks)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_energy" = BOTH_data$energy * BOTH_data$portfolio_stocks)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_industrials" = BOTH_data$industrials * BOTH_data$portfolio_stocks)
BOTH_data <- cbind(BOTH_data, "WEIGHT_STOCK_technology" = BOTH_data$technology * BOTH_data$portfolio_stocks)

# TODO: More details
# Wagi dla każdego aktywa z osobna w kontekście całego portfolio dla obligacji, gdzie
# klasa_aktywa(obligacji) * podklasa_aktywa(rating_obligacji)
BOTH_data <- cbind(BOTH_data, "WEIGHT_BOND_aaa" = BOTH_data$rating_aaa * BOTH_data$portfolio_bonds)
BOTH_data <- cbind(BOTH_data, "WEIGHT_BOND_aa" = BOTH_data$rating_aa * BOTH_data$portfolio_bonds)
BOTH_data <- cbind(BOTH_data, "WEIGHT_BOND_a" = BOTH_data$rating_a * BOTH_data$portfolio_bonds)
BOTH_data <- cbind(BOTH_data, "WEIGHT_BOND_bbb" = BOTH_data$rating_bbb * BOTH_data$portfolio_bonds)
BOTH_data <- cbind(BOTH_data, "WEIGHT_BOND_bb" = BOTH_data$rating_bb * BOTH_data$portfolio_bonds)
BOTH_data <- cbind(BOTH_data, "WEIGHT_BOND_b" = BOTH_data$rating_b * BOTH_data$portfolio_bonds)
BOTH_data <- cbind(BOTH_data, "WEIGHT_BOND_below_b" = BOTH_data$rating_below_b * BOTH_data$portfolio_bonds)
BOTH_data <- cbind(BOTH_data, "WEIGHT_BOND_others" = BOTH_data$rating_others * BOTH_data$portfolio_bonds)

# TODO: More details
# Nowa waga nie tylko dla całej klasy, lecz i podklasy aktywów, które nie wliczają się ani do akcji, ani do obligacji, 
# a która stanowi różnicę całkowitej sumy wag oraz sumy wag akcji i obligacji
BOTH_data <- cbind(BOTH_data, "WEIGHT_OTHER_assets" = (1 - (BOTH_data$portfolio_stocks + BOTH_data$portfolio_bonds)))

# DATA ANALYSIS AND VISUALIZATION
hist(
  BOTH_data$portfolio_stocks,
  xlab="The ratio of stocks in the portfolio",
  ylab = "Number of stocks",
  main = "Distribution of stocks in a portfolio",
  col="forestgreen",
  breaks = 10
)

hist(
  BOTH_data$portfolio_bonds,
  xlab="The ratio of bonds in the portfolio",
  ylab = "Number of bonds",
  main = "Distribution of bond ratios in the portfolio",
  col="royalblue4",
  breaks = 10
)

hist(
  BOTH_data$WEIGHT_OTHER_assets,
  xlab="Ratio of other assets in the portfolio",
  ylab = "Number of assets",
  main = "Distribution of relations between other assets in the portfolio",
  col="khaki",
  breaks = 10
)

margines <- par(mar = c(4, 10.5, 1, 1) + 0.5)
boxplot(
  BOTH_data$basic_materials,
  BOTH_data$consumer_cyclical,
  BOTH_data$financial_services,
  BOTH_data$real_estate,
  BOTH_data$consumer_defensive,
  BOTH_data$healthcare,
  BOTH_data$utilities,
  BOTH_data$communication_services,
  BOTH_data$energy,
  BOTH_data$industrials,
  BOTH_data$technology,
  xlab = "The ratio of the sector to shares in the portfolio",
  main = "Distribution of sectors to shares in the portfolio",
  names = c("Basic materials", "Consumer cyclical", "Financial services", "Realestate", "Consumer defensive", "Healthcare", "Utilities", "Communication services", "Energy", "Industrials", "Technology"),
  col = c("cadetblue3", "antiquewhite3", "aquamarine3", "chartreuse3", "azure3", "chocolate3", "bisque3", "mediumorchid3", "navajowhite3", "olivedrab3", "royalblue3"),
  las = 1,
  horizontal = TRUE
)

margines <- par(mar = c(5, 5, 4, 2) + 0.1)
boxplot(
  BOTH_data$rating_aaa,
  BOTH_data$rating_aa,
  BOTH_data$rating_a,
  BOTH_data$rating_bbb,
  BOTH_data$rating_bb,
  BOTH_data$rating_b,
  BOTH_data$rating_below_b,
  BOTH_data$rating_others,
  xlab = "The ratio of ratings to bonds in the portfolio",
  main = "Distribution of ratings to bonds in the portfolio",
  names = c("AAA", "AA", "A", "BBB", "BB", "B", "Bellow B", "Others"),
  col = c("steelblue", "springgreen1", "springgreen2", "springgreen3", "springgreen4", "tomato1", "tomato2", "wheat3"),
  las=1,
  horizontal = TRUE
)

margines <- par(mar = c(4, 4, 4, 2) + 0.1)
hist(
  BOTH_data$price_earnings,
  xlab = "Price to profit",
  ylab = "Number of stocks",
  main = "Price-to-profit distribution",
  col = "lightgoldenrod3",
  breaks = 10
)

boxplot(
  BOTH_data$fund_return_2010,
  BOTH_data$fund_return_2011,
  BOTH_data$fund_return_2012,
  BOTH_data$fund_return_2013,
  BOTH_data$fund_return_2014,
  BOTH_data$fund_return_2015,
  BOTH_data$fund_return_2016,
  BOTH_data$fund_return_2017,
  BOTH_data$fund_return_2018,
  xlab = "Year",
  ylab = "Rate of return (%)",
  names = c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"),
  main = "Return rates in 2010-2018",
  col = "turquoise"
)

# New dataframe for bond rating weights
correlation_colors <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
bond_correlation <- data.frame(
  BOTH_data$WEIGHT_BOND_aaa,
  BOTH_data$WEIGHT_BOND_aa,
  BOTH_data$WEIGHT_BOND_a,
  BOTH_data$WEIGHT_BOND_bbb,
  BOTH_data$WEIGHT_BOND_bb,
  BOTH_data$WEIGHT_BOND_b,
  BOTH_data$WEIGHT_BOND_below_b,
  BOTH_data$WEIGHT_BOND_others
)
names(bond_correlation)[1] <- "AAA"
names(bond_correlation)[2] <- "AA"
names(bond_correlation)[3] <- "A"
names(bond_correlation)[4] <- "BBB"
names(bond_correlation)[5] <- "BB"
names(bond_correlation)[6] <- "B"
names(bond_correlation)[7] <- "Bellow B"
names(bond_correlation)[8] <- "Others"

corrplot(
  cor(bond_correlation),
  method ="color",
  order = "original",
  col = correlation_colors(200),
  type ="lower",
  addCoef.col = "black",
  tl.col ="black",
  tl.srt = 45,
  title = "Weight correlations of bond ratings throughout the portfolio",
  na.label = blank,
  sig.level = 0.05,
  insig = "blank",
  mar = c(0, 0, 2, 0),
  diag = FALSE
)

# New dataframe for stock industry weights
stock_correlation <- data.frame(
  BOTH_data$WEIGHT_STOCK_basic_materials,
  BOTH_data$WEIGHT_STOCK_consumer_cyclical,
  BOTH_data$WEIGHT_STOCK_financial_services,
  BOTH_data$WEIGHT_STOCK_real_estate,
  BOTH_data$WEIGHT_STOCK_consumer_defensive,
  BOTH_data$WEIGHT_STOCK_healthcare,
  BOTH_data$WEIGHT_STOCK_utilities,
  BOTH_data$WEIGHT_STOCK_communication_services,
  BOTH_data$WEIGHT_STOCK_energy,
  BOTH_data$WEIGHT_STOCK_industrials,
  BOTH_data$WEIGHT_STOCK_technology
)
names(stock_correlation)[1] <- "Basic materials"
names(stock_correlation)[2] <- "Consumer cyclical"
names(stock_correlation)[3] <- "Financial services"
names(stock_correlation)[4] <- "Realestate"
names(stock_correlation)[5] <- "Consumer defensive"
names(stock_correlation)[6] <- "Healthcare"
names(stock_correlation)[7] <- "Utilities"
names(stock_correlation)[8] <- "Communication services"
names(stock_correlation)[9] <- "Energy"
names(stock_correlation)[10] <- "Industrials"
names(stock_correlation)[11] <- "Technology"

corrplot(
  cor(stock_correlation),
  method ="color",
  order = "original",
  col = correlation_colors(200),
  type ="lower",
  addCoef.col = "black",
  tl.col = "black",
  tl.srt = 45,
  title = "Weight correlations of stock sectors across the entire portfolio",
  na.label = blank,
  sig.level = 0.05,
  insig = "blank",
  mar = c(0, 0, 2, 0),
  diag = FALSE
)

# New dataframe for combined all assets weights
combined_correlation <- data.frame(
  bond_correlation,
  stock_correlation,
  BOTH_data$WEIGHT_OTHER_assets
)
names(combined_correlation)[20] <- "Other assets"

corrplot(
  cor(combined_correlation),
  method = "color",
  order = "original",
  col = correlation_colors(200),
  type = "lower",
  addCoef.col = "black",
  tl.col = "black",
  tl.srt = 45,
  title = "Weight correlations of all types of assets in the entire portfolio",
  na.label = blank,
  sig.level = 0.05,
  insig = "blank",
  mar = c(0, 0, 2, 0),
  diag = FALSE
)

circular_values <- c(
  sum(BOTH_data$investment == "Growth" & BOTH_data$size == "Small"),
  sum(BOTH_data$investment == "Growth" & BOTH_data$size == "Medium"),
  sum(BOTH_data$investment == "Growth" & BOTH_data$size == "Large"),
  sum(BOTH_data$investment == "Value" & BOTH_data$size == "Small"),
  sum(BOTH_data$investment == "Value" & BOTH_data$size == "Medium"),
  sum(BOTH_data$investment == "Value" & BOTH_data$size == "Large"),
  sum(BOTH_data$investment == "Blend" & BOTH_data$size == "Small"),
  sum(BOTH_data$investment == "Blend" & BOTH_data$size == "Medium"),
  sum(BOTH_data$investment == "Blend" & BOTH_data$size == "Large")
)
circular_interest <- sprintf("%.2f%s", round(circular_values*100 / sum(circular_values), 2), "%")

circular_colors <- c(
  "palevioletred1", "palevioletred2", "palevioletred3",
  "palegreen1", "palegreen2", "palegreen3",
  "lightskyblue1", "lightskyblue2", "lightskyblue3"
)

circular_labels <- c(
  "Growth - Small",
  "Growth - Medium",
  "Growth - Large",
  "Value) - Small",
  "Value - Medium",
  "Value - Large",
  "Blend - Small",
  "Blend - Medium",
  "Blend) - Large"
)

pie(
  circular_values,
  labels = circular_interest,
  main = "Portfolios by investment strategies and the size of capitalization",
  col = circular_colors,
  clockwise=TRUE,
  radius=0.7,
  border="white",
  cex = 1
)
legend(
  "topright", 
  circular_labels,
  cex = 1, 
  bty = "n", 
  fill = circular_colors, 
  y.intersp = 1.6
)

# Advanced analysis and Predictions
predictions_2011 <- lm(
  BOTH_data$fund_return_2010 ~ 

    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

predictions_2012 <- lm(
  BOTH_data$fund_return_2011 ~ 
    BOTH_data$fund_return_2010 +
      
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

predictions_2013 <- lm(
  BOTH_data$fund_return_2012 ~ 
    BOTH_data$fund_return_2011 + 
    BOTH_data$fund_return_2010 +
      
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

predictions_2014 <- lm(
  BOTH_data$fund_return_2013 ~ 
    BOTH_data$fund_return_2012 + 
    BOTH_data$fund_return_2011 + 
    BOTH_data$fund_return_2010 +

    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

predictions_2015 <- lm(
  BOTH_data$fund_return_2014 ~ 
    BOTH_data$fund_return_2013 + 
    BOTH_data$fund_return_2012 + 
    BOTH_data$fund_return_2011 + 
    BOTH_data$fund_return_2010 +
    
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

predictions_2016 <- lm(
  BOTH_data$fund_return_2015 ~ 
    BOTH_data$fund_return_2014 + 
    BOTH_data$fund_return_2013 + 
    BOTH_data$fund_return_2012 + 
    BOTH_data$fund_return_2011 + 
    BOTH_data$fund_return_2010 +
    
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

predictions_2017 <- lm(
  BOTH_data$fund_return_2016 ~ 
    BOTH_data$fund_return_2015 + 
    BOTH_data$fund_return_2014 + 
    BOTH_data$fund_return_2013 + 
    BOTH_data$fund_return_2012 + 
    BOTH_data$fund_return_2011 + 
    BOTH_data$fund_return_2010 +
    
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

predictions_2018 <- lm(
  BOTH_data$fund_return_2017 ~ 
    BOTH_data$fund_return_2016 + 
    BOTH_data$fund_return_2015 + 
    BOTH_data$fund_return_2014 + 
    BOTH_data$fund_return_2013 + 
    BOTH_data$fund_return_2012 + 
    BOTH_data$fund_return_2011 + 
    BOTH_data$fund_return_2010 +
    
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

predictions_2019 <- lm(
  BOTH_data$fund_return_2018 ~ 
    BOTH_data$fund_return_2017 + 
    BOTH_data$fund_return_2016 + 
    BOTH_data$fund_return_2015 + 
    BOTH_data$fund_return_2014 + 
    BOTH_data$fund_return_2013 + 
    BOTH_data$fund_return_2012 + 
    BOTH_data$fund_return_2011 + 
    BOTH_data$fund_return_2010 +
        
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

BOTH_data <- cbind(BOTH_data, "predicted_return_2011" = predict(predictions_2011))
BOTH_data <- cbind(BOTH_data, "predicted_return_2012" = predict(predictions_2012))
BOTH_data <- cbind(BOTH_data, "predicted_return_2013" = predict(predictions_2013))
BOTH_data <- cbind(BOTH_data, "predicted_return_2014" = predict(predictions_2014))
BOTH_data <- cbind(BOTH_data, "predicted_return_2015" = predict(predictions_2015))
BOTH_data <- cbind(BOTH_data, "predicted_return_2016" = predict(predictions_2016))
BOTH_data <- cbind(BOTH_data, "predicted_return_2017" = predict(predictions_2017))
BOTH_data <- cbind(BOTH_data, "predicted_return_2018" = predict(predictions_2018))
BOTH_data <- cbind(BOTH_data, "predicted_return_2019" = predict(predictions_2019))

#TODO: More details in this new weights
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_OTHER_ASSETS" = BOTH_data$WEIGHT_OTHER_assets * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_basic_materials" = BOTH_data$WEIGHT_STOCK_basic_materials * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_consumer_cyclical" = BOTH_data$WEIGHT_STOCK_consumer_cyclical * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_financial_services" = BOTH_data$WEIGHT_STOCK_financial_services * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_real_estate" = BOTH_data$WEIGHT_STOCK_real_estate * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_consumer_defensive" = BOTH_data$WEIGHT_STOCK_consumer_defensive * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_healthcare" = BOTH_data$WEIGHT_STOCK_healthcare * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_utilities" = BOTH_data$WEIGHT_STOCK_utilities * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_communication_services" = BOTH_data$WEIGHT_STOCK_communication_services * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_energy" = BOTH_data$WEIGHT_STOCK_energy * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_industrials" = BOTH_data$WEIGHT_STOCK_industrials * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_STOCK_technology" = BOTH_data$WEIGHT_STOCK_technology * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_BOND_aaa" = BOTH_data$WEIGHT_BOND_aaa * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_BOND_aa" = BOTH_data$WEIGHT_BOND_aa * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_BOND_a" = BOTH_data$WEIGHT_BOND_a * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_BOND_bbb" = BOTH_data$WEIGHT_BOND_bbb * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_BOND_bb" = BOTH_data$WEIGHT_BOND_bb * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_BOND_b" = BOTH_data$WEIGHT_BOND_b * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_BOND_below_b" = BOTH_data$WEIGHT_BOND_below_b * BOTH_data$predicted_return_2019)
BOTH_data <- cbind(BOTH_data, "PREDICT_RETURN_BOND_others" = BOTH_data$WEIGHT_BOND_others * BOTH_data$predicted_return_2019)

# Separate data based on investment strategy
SET_BLEND_SMALL <- subset(BOTH_data, BOTH_data$investment == "Blend" & BOTH_data$size == "Small")
SET_BLEND_MEDIUM <- subset(BOTH_data, BOTH_data$investment == "Blend" & BOTH_data$size == "Medium")
SET_BLEND_LARGE <- subset(BOTH_data, BOTH_data$investment == "Blend" & BOTH_data$size == "Large")

SET_VALUE_SMALL <- subset(BOTH_data, BOTH_data$investment == "Value" & BOTH_data$size == "Small")
SET_VALUE_MEDIUM <- subset(BOTH_data, BOTH_data$investment == "Value" & BOTH_data$size == "Medium")
SET_VALUE_LARGE <- subset(BOTH_data, BOTH_data$investment == "Value" & BOTH_data$size == "Large")

SET_GROWTH_SMALL <- subset(BOTH_data, BOTH_data$investment == "Growth" & BOTH_data$size == "Small")
SET_GROWTH_MEDIUM <- subset(BOTH_data, BOTH_data$investment == "Growth" & BOTH_data$size == "Medium")
SET_GROWTH_LARGE <- subset(BOTH_data, BOTH_data$investment == "Growth" & BOTH_data$size == "Large")



# MODEL 01 - Stability - Modeling price stability over time in terms of evolution using linear log
model_log_lin_2011 <- lm(
  log(BOTH_data$predicted_return_2011) ~ 
    0 +
    BOTH_data$fund_return_2010 +
    
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

model_log_lin_2012 <- lm(
  log(BOTH_data$predicted_return_2012) ~ 
    0 +
    BOTH_data$fund_return_2011 +
    
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

model_log_lin_2013 <- lm(
  log(BOTH_data$predicted_return_2013) ~ 
    0 +
    BOTH_data$fund_return_2012 +
  
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

model_log_lin_2014 <- lm(
  log(BOTH_data$predicted_return_2014) ~ 
    0 +
    BOTH_data$fund_return_2013 +
  
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

model_log_lin_2015 <- lm(
  log(BOTH_data$predicted_return_2015) ~ 
    0 +
    BOTH_data$fund_return_2014 +
  
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

model_log_lin_2016 <- lm(
  log(BOTH_data$predicted_return_2016) ~ 
    0 +
    BOTH_data$fund_return_2015 +
  
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

model_log_lin_2017 <- lm(
  log(BOTH_data$predicted_return_2017) ~ 
    0 +
    BOTH_data$fund_return_2016 +
  
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

model_log_lin_2018 <- lm(
  log(BOTH_data$predicted_return_2018) ~ 
    0 +
    BOTH_data$fund_return_2017 +
    
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

model_log_lin_2019 <- lm(
  log(BOTH_data$predicted_return_2019) ~ 
    0 +
    BOTH_data$fund_return_2018 +
  
    BOTH_data$investment +
    BOTH_data$size +
    BOTH_data$WEIGHT_BOND_aaa +
    BOTH_data$WEIGHT_BOND_aa +
    BOTH_data$WEIGHT_BOND_a +
    BOTH_data$WEIGHT_BOND_bbb +
    BOTH_data$WEIGHT_BOND_bb +
    BOTH_data$WEIGHT_BOND_b +
    BOTH_data$WEIGHT_BOND_below_b +
    BOTH_data$WEIGHT_BOND_others +
    BOTH_data$WEIGHT_STOCK_basic_materials +
    BOTH_data$WEIGHT_STOCK_consumer_cyclical +
    BOTH_data$WEIGHT_STOCK_financial_services +
    BOTH_data$WEIGHT_STOCK_real_estate +
    BOTH_data$WEIGHT_STOCK_consumer_defensive +
    BOTH_data$WEIGHT_STOCK_healthcare +
    BOTH_data$WEIGHT_STOCK_utilities +
    BOTH_data$WEIGHT_STOCK_communication_services +
    BOTH_data$WEIGHT_STOCK_energy +
    BOTH_data$WEIGHT_STOCK_industrials +
    BOTH_data$WEIGHT_STOCK_technology +
    BOTH_data$WEIGHT_OTHER_assets
)

summarize_coefficients <- round(data.frame(
    model_log_lin_2011$coefficients,
    model_log_lin_2012$coefficients,
    model_log_lin_2013$coefficients,
    model_log_lin_2014$coefficients,
    model_log_lin_2015$coefficients,
    model_log_lin_2016$coefficients,
    model_log_lin_2017$coefficients,
    model_log_lin_2018$coefficients,
    model_log_lin_2019$coefficients
  ),  4
)

summarize_p_value <- round(data.frame(
  summary(model_log_lin_2011)$coefficients[, 4],
  summary(model_log_lin_2012)$coefficients[, 4],
  summary(model_log_lin_2013)$coefficients[, 4],
  summary(model_log_lin_2014)$coefficients[, 4],
  summary(model_log_lin_2015)$coefficients[, 4],
  summary(model_log_lin_2016)$coefficients[, 4],
  summary(model_log_lin_2017)$coefficients[, 4],
  summary(model_log_lin_2018)$coefficients[, 4],
  summary(model_log_lin_2019)$coefficients[, 4]), 4
)

summarize_std_error <- round(data.frame(
  summary(model_log_lin_2011)$coefficients[, 3],
  summary(model_log_lin_2012)$coefficients[, 3],
  summary(model_log_lin_2013)$coefficients[, 3],
  summary(model_log_lin_2014)$coefficients[, 3],
  summary(model_log_lin_2015)$coefficients[, 3],
  summary(model_log_lin_2016)$coefficients[, 3],
  summary(model_log_lin_2017)$coefficients[, 3],
  summary(model_log_lin_2018)$coefficients[, 3],
  summary(model_log_lin_2019)$coefficients[, 3]), 4
)

explanatory_lines <- c("Base year", "Strategy - Mixed", "Strategy - Growth", "Strategy - Value", "Capitalization - Medium", "Capitalization - Small", "Bonds - AAA", "Bonds- AA", "Bonds - A", "Bonds - BBB", "Bonds  - BB", "Bonds - B", "Bonds - below B", "Bonds - other", "Stocks - Basic materials", "Stocks - Consumer cyclical", "Stocks - Financial services", "Stocks - Realestate", "Stocks - Consumer defensive", "Stocks - Healthcare", "Stocks - Utilities", "Stocks - Communication services", "Stocks - Energy", "Stocks - Industrials", "Stocks - Technology", "Other - other")
explanatory_columns <- c("y ^2011", "y ^2012", "y ^2013", "y ^2014", "y ^2015", "y ^2016", "y ^2017", "y ^2018", "y ^2019")

rownames(summarize_coefficients) <- explanatory_lines
rownames(summarize_p_value)<- explanatory_lines
rownames(summarize_std_error) <- explanatory_lines

colnames(summarize_coefficients) <- explanatory_columns
colnames(summarize_p_value) <- explanatory_columns
colnames(summarize_std_error) <- explanatory_columns

write.table(summarize_coefficients, "Results_Coefficients.csv", sep = "|")
write.table(summarize_p_value, "Results_P_Value.csv", sep = "|")
write.table(summarize_std_error, "Results_Std_Error.csv", sep = "|")

# MODEL 02 - Prediction - modeling returns for 2019 based on the data from 2010-2018 - based on R-Square
r_squared <- data.frame(
  summary(predictions_2011)$r.squared,
  summary(predictions_2012)$r.squared,
  summary(predictions_2013)$r.squared,
  summary(predictions_2014)$r.squared,
  summary(predictions_2015)$r.squared,
  summary(predictions_2016)$r.squared,
  summary(predictions_2017)$r.squared,
  summary(predictions_2018)$r.squared,
  summary(predictions_2019)$r.squared
)
r_squared <- t(r_squared)
rownames(r_squared)<- c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019")
write.table(r_squared, "Results_R_Squared.csv", sep = "|")

# MODEL 03 - Optimization - modeling the optimal proportion of portfolio assets in terms of profit and risk
TS_SET_BLEND_SMALL <- ts(SET_BLEND_SMALL, frequency = 1, start = c(1970, 1))
TS_SET_BLEND_MEDIUM <- ts(SET_BLEND_MEDIUM, frequency = 1, start = c(1970, 1))
TS_SET_BLEND_LARGE <- ts(SET_BLEND_LARGE, frequency = 1, start = c(1970, 1))
TS_SET_GROWTH_SMALL <- ts(SET_GROWTH_SMALL, frequency = 1, start = c(1970, 1))
TS_SET_GROWTH_MEDIUM <- ts(SET_GROWTH_MEDIUM, frequency = 1, start = c(1970, 1))
TS_SET_GROWTH_LARGE <- ts(SET_GROWTH_LARGE, frequency = 1, start = c(1970, 1))
TS_SET_VALUE_SMALL <- ts(SET_VALUE_SMALL, frequency = 1, start = c(1970, 1))
TS_SET_VALUE_MEDIUM <- ts(SET_VALUE_MEDIUM, frequency = 1, start = c(1970, 1))
TS_SET_VALUE_LARGE <- ts(SET_VALUE_LARGE, frequency = 1, start = c(1970, 1))

# STEP 1- initialize parameterization
BLEND_returns_SMALL <- TS_SET_BLEND_SMALL[, 63:82]
BLEND_returns_MEDIUM <- TS_SET_BLEND_MEDIUM[, 63:82]
BLEND_returns_LARGE <- TS_SET_BLEND_LARGE[, 63:82]
GROWTH_returns_SMALL <- TS_SET_GROWTH_SMALL[, 63:82]
GROWTH_returns_MEDIUM <- TS_SET_GROWTH_MEDIUM[, 63:82]
GROWTH_returns_LARGE <- TS_SET_GROWTH_LARGE[, 63:82]
VALUE_returns_SMALL <- TS_SET_VALUE_SMALL[, 63:82]
VALUE_returns_MEDIUM <- TS_SET_VALUE_MEDIUM[, 63:82]
VALUE_returns_LARGE <- TS_SET_VALUE_LARGE[, 63:82]


assets_list <- c(
  "Other Assets",

  "Stocks - Basic materials", 
  "Stocks - Consumer cyclical", 
  "Stocks - Financial services", 
  "Stocks - Realestate", 
  "Stocks - Consumer defensive", 
  "Stocks - Healthcare", 
  "Stocks - Utilities", 
  "Stocks - Communication services", 
  "Stocks - Energy", 
  "Stocks - Industrials", 
  "Stocks - Technology",
  
  "Bonds - Class AAA",
  "Bonds - Class AA",
  "Bonds - Class A",
  "Bonds - Class BBB",
  "Bonds - Class BB",
  "Bonds - Class B",
  "Bonds - Class bellow B",
  "Bonds - other classes"
)

colnames(BLEND_returns_SMALL) <- assets_list
colnames(BLEND_returns_MEDIUM) <- assets_list
colnames(BLEND_returns_LARGE) <- assets_list
colnames(GROWTH_returns_SMALL) <- assets_list
colnames(GROWTH_returns_MEDIUM) <- assets_list
colnames(GROWTH_returns_LARGE) <- assets_list
colnames(VALUE_returns_SMALL) <- assets_list
colnames(VALUE_returns_MEDIUM) <- assets_list
colnames(VALUE_returns_LARGE) <- assets_list


# STEP 2 - Portfolio object
Specification <- portfolio.spec(assets = assets_list)

# STEP 3 - Adding restrictions and requirements to the portfolio (constraints) determining the sum of weights in the portfolio - in this case sum_wag = 1
Specification <- add.constraint(portfolio=Specification, type="leverage", min_sum=0.9999, max_sum=1.0001)

# Determining the sum of weights for the assets in the portfolio - in this case 0.00 <active_weight> 0.65
Specification <- add.constraint(portfolio=Specification, type="box", min=0.0000, max=0.6500)

# STEP 4 - Adding goals to portfolio (objectives) setting a goal to maximize average profit
CEL_Portfolio <- add.objective(portfolio=Specification, type='return', name='mean')

# Setting a risk minimization target
CEL_Portfolio <- add.objective(portfolio=CEL_Portfolio, type='risk', name='var')

# STEP 5 - Portfolio Optimization
# Portfolio - GROWTH Strategy
Portfolio_GROWTH_SMALL <- optimize.portfolio(R = GROWTH_returns_SMALL, portfolio = CEL_Portfolio, optimize_method = "ROI", trace=TRUE)
Portfolio_GROWTH_MEDIUM <- optimize.portfolio(R = GROWTH_returns_MEDIUM, portfolio = CEL_Portfolio, optimize_method = "ROI", trace=TRUE)
Portfolio_GROWTH_LARGE <- optimize.portfolio(R = GROWTH_returns_LARGE, portfolio = CEL_Portfolio, optimize_method = "ROI", trace=TRUE)

# # Portfolio - VALUE Strategy
Portfolio_VALUE_SMALL <- optimize.portfolio(R = VALUE_returns_SMALL, portfolio = CEL_Portfolio, optimize_method = "ROI", trace=TRUE)
Portfolio_VALUE_MEDIUM <- optimize.portfolio(R = VALUE_returns_MEDIUM, portfolio = CEL_Portfolio, optimize_method = "ROI", trace=TRUE)
Portfolio_VALUE_LARGE <- optimize.portfolio(R = VALUE_returns_LARGE, portfolio = CEL_Portfolio, optimize_method = "ROI", trace=TRUE)

# Portfolio - BLEND Strategy
Portfolio_BLEND_SMALL <- optimize.portfolio(R = BLEND_returns_SMALL, portfolio = CEL_Portfolio, optimize_method = "ROI", trace=TRUE)
Portfolio_BLEND_MEDIUM <- optimize.portfolio(R = BLEND_returns_MEDIUM, portfolio = CEL_Portfolio, optimize_method = "ROI", trace=TRUE)
Portfolio_BLEND_LARGE <- optimize.portfolio(R = BLEND_returns_LARGE, portfolio = CEL_Portfolio, optimize_method = "ROI", trace=TRUE)

# A tabular summary of the created portfolios with the "ROI" optimization method
Portfele_ROI_Tabela <- rbind(
  t(data.frame(Portfolio_GROWTH_SMALL[['weights']])),
  t(data.frame(Portfolio_GROWTH_MEDIUM[['weights']])),
  t(data.frame(Portfolio_GROWTH_LARGE[['weights']])),
  
  t(data.frame(Portfolio_VALUE_SMALL[['weights']])),
  t(data.frame(Portfolio_VALUE_MEDIUM[['weights']])),
  t(data.frame(Portfolio_VALUE_LARGE[['weights']])),
  
  t(data.frame(Portfolio_BLEND_SMALL[['weights']])),
  t(data.frame(Portfolio_BLEND_MEDIUM[['weights']])),
  t(data.frame(Portfolio_BLEND_LARGE[['weights']]))
)
Portfele_ROI_Tabela <- t(format(round(Portfele_ROI_Tabela, 4)))

colnames(Portfele_ROI_Tabela) <- c(
  "Strategy - GROWTH Capitalization - SMALL",
  "Strategy - GROWTH Capitalization - MEDIUM",
  "Strategy - GROWTH Capitalization - LARGE",
  
  "Strategy - VALUE Capitalization - SMALL",
  "Strategy - VALUE Capitalization - MEDIUM",
  "Strategy - VALUE Capitalization - LARGE",
  
  "Strategy - BLEND Capitalization - SMALL",
  "Strategy - BLEND Capitalization - MEDIUM",
  "Strategy - BLEND Capitalization - LARGE"
)
write.table(Portfele_ROI_Tabela, "ROI_Portfolio_Collection.csv", sep = "|")

# Descriptions and results
print(Portfolio_GROWTH_SMALL)
print(Portfolio_BLEND_MEDIUM)
print(Portfolio_VALUE_LARGE)
business_case_01 <- data.frame(Portfolio_GROWTH_SMALL[["weights"]])
business_case_02 <- data.frame(Portfolio_BLEND_MEDIUM[["weights"]])
business_case_03 <- data.frame(Portfolio_VALUE_LARGE[["weights"]])
business_case_01 <- subset(business_case_01, business_case_01$Portfolio_GROWTH_SMALL...weights...>0.01)
business_case_02 <- subset(business_case_02, business_case_02$Portfolio_BLEND_MEDIUM...weights...>0.01)
business_case_03 <- subset(business_case_03, business_case_03$Portfolio_VALUE_LARGE...weights...>0.01)

# Business Case 01 - Individual investor (strategy - GROWTH, capitalization - SMALL)
circular_interest_2 <- sprintf("%.2f%s", round(business_case_01$Portfolio_GROWTH_SMALL...weights...*100/sum(business_case_01$Portfolio_GROWTH_SMALL...weights...), 2), "%")
pie(
  business_case_01$Portfolio_GROWTH_SMALL...weights...,
  labels = circular_interest_2,
  main = "Optimization - growth strategy, small capitalization",
  space = 0,
  border = "white",
  clockwise = TRUE,
  col = c("darkslateblue", "yellow3")
)
legend("topright", rownames(business_case_01), cex = 1, bty = "n", fill = c("darkslateblue", "yellow3"))

# Business Case 02 - Institution (strategy - MIXED, capitalization - MEDIUM)
circular_interest_3 <- sprintf("%.2f%s", round(business_case_02$Portfolio_BLEND_MEDIUM...weights...*100 / sum(business_case_02$Portfolio_BLEND_MEDIUM...weights...), 2), "%")
pie(
  business_case_02$Portfolio_BLEND_MEDIUM...weights...,
  labels = circular_interest_3,
  main = "Optimization - mixed strategy, average capitalization",
  space = 0,
  border = "white",
  clockwise = TRUE,
  col = c("seagreen", "indianred")
)
legend("topright", rownames(business_case_02), cex = 1.5, bty = "n", fill = c("seagreen", "indianred"))

# Business Case 03 - Large corporation (strategy - VALUE, capitalization - LARGE)
circular_interest_4 <- sprintf("%.2f%s", round(business_case_03$Portfolio_VALUE_LARGE...weights...*100 / sum(business_case_03$Portfolio_VALUE_LARGE...weights...), 2), "%")
pie(
  business_case_03$Portfolio_VALUE_LARGE...weights...,
  labels = circular_interest_4,
  main = "Optimization - value strategy, large capitalization",
  space = 0,
  border = "white",
  clockwise = TRUE,
  col = c("peru", "royalblue")
)
legend("topright", rownames(business_case_03), cex = 1.5, bty = "n", fill = c("peru", "royalblue"))