Bootstrap: library
From: richelbilderbeek/default/plinkr:0.17.2.1

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get -y update
    apt-get -y install python3 wget
    apt-get -y clean

    # 'ormr' needs this
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -b -p miniconda
    export PATH=/miniconda/bin:$PATH
    rm Miniconda3-latest-Linux-x86_64.sh
    conda update conda

    Rscript -e 'install.packages("reticulate")'
    Rscript -e 'reticulate::conda_list()'
    Rscript -e 'reticulate::conda_create(envname = "/opt/ormr")'
    Rscript -e 'reticulate::conda_list()'
    Rscript -e 'reticulate::use_condaenv(condaenv = "/opt/ormr")'
    Rscript -e 'reticulate::use_python(python = reticulate:::python_binary_path("/opt/ormr"), required = TRUE)'
    Rscript -e 'reticulate:::conda_list_packages(envname = "/opt/ormr")'
    Rscript -e 'reticulate::conda_install(packages = "scipy", envname = "/opt/ormr")'

%runscript
exec R --vanilla --silent --no-echo "$@"

%test
    echo "**************"
    echo "Show me '/opt'"
    echo "**************"
    ls /opt
    echo "*******************"
    echo "Show me '/opt/ormr'"
    echo "*******************"
    ls /opt/ormr
    echo "****************************"
    echo "Run 'reticulate::use_condaenv'"
    echo "****************************"
    Rscript -e 'reticulate::use_condaenv(condaenv = "/opt/ormr")'
    echo "*************"
    echo "List packages"
    echo "*************"
    Rscript -e 'reticulate:::conda_list_packages(envname = "/opt/ormr")'
    echo "*************"
    echo "List packages after activating condaenv"
    echo "*************"
    Rscript -e 'reticulate::use_condaenv(condaenv = "/opt/ormr"); reticulate:::conda_list_packages(envname = "/opt/ormr")'

%help

This container has the R package ormr installed.

To make the container run a script called, e.g. `script.R`, do:

```
cat script.R | ./ormr.sif
```

Within the script, set `ormr_folder_name` to `"/opt/ormr"`, for example:

```
library(ormr)
ormr_report(ormr_folder_name = "/opt/ormr")
```

%labels

    AUTHOR Richel J.C. Bilderbeek

    NAME reticulate_on_singularity

    DESCRIPTION Use reticulate on Singularity

    USAGE simply run the container

    URL https://github.com/richelbilderbeek/reticulate_on_singularity

    VERSION 0.1.0

