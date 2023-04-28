# codespaces-data-science


This is a Github Codespaces template for data science

The development environment setup is configured in the `.devcontainer` folder. The workspace setup is configured in the `.vscode` folder.

__Do not change the `.devcontainer`  and `scripts` folder__ unless you know what you are doing. This folder is used by Github Codespaces to setup the development environment.


## Install R packages

Once you started your codespace, you can install R packages by running the following command in the R console.

First in your __terminal__:

```bash
R
```

Then in the __R console__:

```R
install.packages("data.table")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("knitr")
install.packages("magrittr")
```

When it asks you whether you want to install the packages in a personal library, type `y` and press enter.
