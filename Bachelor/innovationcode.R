options(scipen = 999)
# library key packages
library(data.table)
library(magrittr)
library(knitr)
library(ggplot2)
library(corrplot)

#input data from datasets folder
#2021data and 2019 are in the datasets folder


file_path <- "/workspaces/codespaces-data-science/bachelor/extmidp21.csv"
data2021 <- fread(file_path)
str(data2021)

head(data2021)


#industry distribution of the sample
translation = c("Transport/Post", "Water/Disposal/Recycling", "Metal production/processing",
                "Furniture/Toys/Medical technology/Repair", "Business services",
                "Business consulting/Advertising", "Technical/R&D services",
                "Electrical industry", "Media services", "IT/Telecommunications",
                "Food/Beverages/Tobacco", "Mechanical engineering", "Energy/Mining/Petroleum",
                "Financial services", "Textile/Apparel/Leather", "Wholesale",
                "Chemical/Pharmaceutical","Wood/Paper", "Rubber/Plastic processing",
                "Vehicle manufacturing","Glass/Ceramics/Stoneware")

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



    ggplot(survey21, aes(x = pdpp)) +
  geom_bar(fill = "steelblue", stat = "count") +
  labs(title = "Product Innovation in the years 2018-2020",
       x = "Introduction of new or improved goods/services 2018 to 2020",
       y = "Number of firms in percent") +

#print the plot
print(ggplot(survey21, aes(x = pdpp)) +
  geom_bar(fill = "steelblue", stat = "count") +
  labs(title = "Product Innovation in the years 2018-2020",
       x = "Introduction of new or improved goods/services 2018 to 2020",
       y = "Number of firms in percent"))#
