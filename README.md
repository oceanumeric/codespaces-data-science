# codespaces-data-science


This is a Github Codespaces template for data science

The development environment setup is configured in the `.devcontainer` folder. The workspace setup is configured in the `.vscode` folder.

__Do not change the `.devcontainer`  and `scripts` folder__ unless you know what you are doing. This folder is used by Github Codespaces to setup the development environment.


## Install R packages

Once you started your codespace, you can install R packages by running the following command in the R console.

Open your __terminal__, copy and paste the following command into your terminal and __press Enter__: 

```bash
sudo Rscript scripts/install.R
````


## Install Python packages

Python packages has been installed during the setup of the development environment. 

For packages are installed:

- numpy
- pandas
- matplotlib
- jupyterlab


You can install additional packages by running the following command in the terminal.

```bash
pip install <package-name>
```
