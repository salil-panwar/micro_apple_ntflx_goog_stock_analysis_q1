install.packages('tidyverse')
library('tidyverse')
library(ggplot2)
install.packages("skimr")
install.packages("janitor")
library(tidyverse)
library(skimr)
library(janitor)
# install special package for excel sheets
install.packages("readxl")
library(readxl)
# Verify file location
    file.exists("C:/Users/hunte/Documents/stocks.xlsx")
# Load data into a sample dataset.
stocks_data<- read_excel("C:/Users/hunte/Documents/stocks.xlsx", sheet="stocks")
View(stocks_data)

#Plotting Graphs

ggplot(data=stocks_data) + geom_line(mapping = aes(x= trade_date, y= closing_price,
color = Ticker))

ggplot(data=stocks_data) + geom_line(mapping = aes(x= trade_date, y= daily_traded_value,
color = Ticker))

#Using Pivot file data as new dataset

pivotfile_data<- read_excel("C:/Users/hunte/Documents/stocks.xlsx", sheet="pivot_table_stocks")
View(pivotfile_data)


pivotfile_data2<- pivotfile_data[-5, ]

View(pivotfile_data2)

#Plotting Average Daily Return Percentage

ggplot(data = pivotfile_data2, aes(x = ticker, y = `average_daily_ returns_pc`, fill = ticker)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Daily Returns Percentage by Stock",
       x = "Stock Ticker",
       y = "Average Daily Returns (%)") +
  theme_minimal() +
  theme(legend.position = "none")

# Plotting Cummilative Monthly Growth Rate

ggplot(data= pivotfile_data2, aes(x= ticker, y= cmgr , fill = ticker)) + 
geom_bar(stat = "identity") + labs(title= 'Cummilative Monthly Growth Rate By Stock',
x= 'Stock Ticker', y = 'Cummilative Monthly Growth Rate (%)')

# Plotting Average Volume Of Trade Per Stock Q1

ggplot(data= pivotfile_data2, aes(x= ticker, y=average_trade_volume, fill= ticker)) +
geom_bar(stat="identity") + labs(title= 'Average Volume Of Trade Per Stock',
x= 'Stock Ticker', y= 'Average Trade Volume For Q1')

# Using pivot_table2 as anew dataset for plotting

pivot_table_2 <- read_excel("C:/Users/hunte/Documents/stocks.xlsx", sheet="pivot_table2")
view(pivot_table_2)

pivot_table_2_clean <- pivot_table_2[-5, ]
view(pivot_table_2_clean)

# Plotting Grand Total Of Daily Traded Value Per Stock For Q1


ggplot(data = pivot_table_2_clean, aes(x = `Row Labels`, y = `Sum of daily_traded_value`, fill = `Row Labels`)) +
  geom_bar(stat = "identity") +
  labs(title = "Grand Total Of Daily Traded Value Per Stock For Q1",
       x = "Stock Ticker",
       y = "Daily Traded Value")





