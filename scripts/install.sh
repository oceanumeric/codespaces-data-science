#!/bin/bash

# update and upgrade
sudo apt-get update -y

# install R
sudo apt-get install r-base -y

# install python requirements
python3 -m pip install numpy==1.24.2
python3 -m pip install pandas==1.5.3
python3 -m pip install matplotlib==3.7.0
# install jupyter notebook 
python3 -m pip install jupyterlab

# install R requirements
Rscript install.R
