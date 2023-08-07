# library(data.table)

# #Read in the date 
# file_path <- "/workspaces/codespaces-data-science/datasets/2021data.csv"
# data2021 <- fread(file_path, fill = TRUE)
# str(data2021)



library(data.table)
library(magrittr)
library(knitr)
library(ggplot2)
library(corrplot)

#Read data
file_path <- "/workspaces/codespaces-data-science/bachelor/extmidp21.csv"
survey21 <- fread(file_path)
#dataset is loaded as 'survey2021'
str(survey21)


#dependent variable
#summarize pdpp
summary_pdpp <- table(survey21$pdpp)
print(summary_pdpp)
#create table
table_pdpp <- data.frame(summary_pdpp)
#show how many firms introduced new products
table_pdpp$percentage <- table_pdpp$Freq/sum(table_pdpp$Freq)
#show table
print(table_pdpp)
#create png image of table
png("table_pdpp.png", width = 600, height = 400)
print(kable(table_pdpp, caption = "Summary of pdpp"))


# Create the bar plot with custom titles
ggplot(survey21, aes(x = pdpp)) +
  geom_bar(fill = "steelblue", stat = "count") +
  labs(title = "Product Innovation in the years 2018-2020",
       x = "Introduction of new or improved goods/services 2018 to 2020",
       y = "Number of firms")







# set graph size
options(repr.plot.width = 8, repr.plot.height = 5)
data2021 %>%
    # select the column branche
    .[, .(branche)] %>%
    # summarize the frequency of each category
    table() %>%
    as.data.table() %>%
    .[order(-N)] %>%
    # add translation of branche
    .[, industry := translation] %>%
    # plot the bar chart
    ggplot(aes(x = reorder(industry, N), y = N)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    labs(x = "Industry", y = "Frequency", title = "Industry of the firms") +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5)) + 
    theme(axis.text.y = element_text(size = 8))

    # bran_4 - big category of industry
data2021 %>%
    .[, .(bran_4)] %>%
    table() %>%
    as.data.table()

    data2021 %>%
    .[, .(branche, bges)] %>%
    # boxplot across groups
    ggplot(aes(x = branche, y = bges)) +
    geom_boxplot() +
    coord_flip() +
    labs(x = "Industry", y = "BGEs", title = "BGEs across industries") +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5)) +
    theme(axis.text.y = element_text(size = 8))

    #linear regression
    data2021 %>%
    #give me the code for a linear regression between pd and koopfue
    lm(pd ~ koopfue, data = .) %>%


# Create a data frame from the vectors
data <- data.frame(x, y)

# Fit the linear regression model
amodel <- lm(pd ~ koopfue + koopiaso + koopso, data = data2021 )

# Print the model summary
summary(amodel)
