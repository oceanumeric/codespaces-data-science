
options(scipen = 999)


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

#translate industry names 
translation = c("Transport/Post", "Water/Disposal/Recycling", "Metal production/processing",
                "Furniture/Toys/Medical technology/Repair", "Business services",
                "Business consulting/Advertising", "Technical/R&D services",
                "Electrical industry", "Media services", "IT/Telecommunications",
                "Food/Beverages/Tobacco", "Mechanical engineering", "Energy/Mining/Petroleum",
                "Financial services", "Textile/Apparel/Leather", "Wholesale", "Chemical/Pharmaceutical",
                "Wood/Paper", "Rubber/Plastic processing", "Vehicle manufacturing",
                "Glass/Ceramics/Stoneware")

#dependent variable
#summarize pdpp
#filter out pdpp = ""
survey21 <- survey21[!survey21$pdpp == "", ]


summary_pdpp <- table(survey21$pdpp)
print(summary_pdpp)
#create table
table_pdpp <- data.frame(summary_pdpp)
#show how many firms introduced new products
table_pdpp$percentage <- table_pdpp$Freq/sum(table_pdpp$Freq)
#show table
print(table_pdpp)

#title: Product Innovation in the years 2018-2020
#number of frims in percent (y-axis)
#make the columns thin 
#put the percentage of the firms on top of the columns
#generate the code:
ggplot(survey21, aes(x = pdpp)) +
  geom_bar(fill = "#1f0467", stat = "count", width = 0.5) +
  labs(title = "Product Innovation in the years 2018-2020",
       x = "Introduction of new or improved goods/services 2018 to 2020",
       y = "Number of firms") +
  theme(panel.grid.major.x = element_blank(),
        axis.text.x = element_text(size = 8)) +
  geom_text(stat = "count", aes(label = scales::percent(..count../sum(..count..))),
            vjust = -0.5)


#i want to see which industries introduced the most new products
#the variable of industry is called branche
#make it horizontal
#generate the code:
ggplot(survey21, aes(x = branche, fill = pdpp)) +
  geom_bar(position = "fill") +
  labs(title = "Product Innovation in the years 2018-2020",
       x = "Industry",
       y = "Share of firms in percent") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("#1f0467", "#ffffff")) +
  guides(fill = guide_legend(title = "New or improved goods/services")) +
  coord_flip()
  #put "ja" on the left side
     #generate the code:




#rename pdpp to Product Innovation

# independent variables 
# 9.1  co-operation with other enterprises or organizations:
 # on R&D -> koopfue 
 # on business activities -> koopso
 # on other Innovation activities -> koopiaso

# 9.2  co-operation with other enterprises or organizations:
#	other enterprises within enterprise group -> kod1(Inland), koa1(Ausland)  
#	Suppliers -> kod4(Inland), koa4 (ausland)
#	Consultants -> kod6 (Inland), koa6 (ausland)
#	Competitors -> kod5, koa5
#    Universitäten -> kod7, koa7

summary_kod4 <- table(survey21$kod4)
print(summary_kod4)




survey21 %>%
    # check which industry introduces the most new products
    .[, lapply(.SD, function(x) sum(x == "ja") / length(x)),
                by = branche, .SDcols = c("pdpp", "pddl")] %>%
    melt(id.vars = "branche") %>%
    ggplot(aes(x = branche, y = variable, fill = value)) +
    geom_tile() +
    coord_flip() +
    labs(x = "Industry", y = "New Products or Services", title = "Share of 'ja'") +
    theme_bw() +
    scale_fill_gradient(low = "white", high = "#102aad", na.value = "grey90",
                            guide = "colorbar") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))