#!/bin/bash

# update and upgrade
sudo apt-get update
sudo apt-get upgrade -y

# install R
sudo apt-get install r-base -y

# install python requirements
python3 -m pip install numpy==1.24.2
python3 -m pip install pandas==1.5.3
python3 -m pip install matplotlib==3.7.0

# Install R packages
Rscript -e "install.packages('data.table')"
Rscript -e "install.packages('dplyr')"
Rscript -e "install.packages('ggplot2')"
Rscript -e "install.packages('knitr')"
Rscript -e "install.packages('lubridate')"
Rscript -e "install.packages('magrittr')"