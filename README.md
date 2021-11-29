# reticulate_on_singularity

This repo shows how to work with the R package `reticulate` 
to run a Python script on Singularity.

## Steps

 1. The [Singularity](Singularity) `%post` section contains the build
 2. The [Singularity](Singularity) `%test` section contains the test
 3. The [.github/workflows/build_sandbox.yaml](.github/workflows/build_sandbox.yaml)
   and [.github/workflows/build_singularity.yaml](.github/workflows/build_singularity.yaml)
   show the final usage


## 1. The [Singularity](Singularity) `%post` section contains the build

Install apt:

```
sed -i 's/$/ universe/' /etc/apt/sources.list
apt-get -y update
```

Install Python3:

```
apt-get -y install python3 wget
apt-get -y clean
```

Install Minoconda:

```
# 'ormr' needs this
wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p miniconda
export PATH=/miniconda/bin:$PATH
rm Miniconda3-latest-Linux-x86_64.sh
conda update conda
```

Install reticulate:

```
Rscript -e 'install.packages("reticulate")'
```

Show that only a `miniconda` environment is installed:

```
Rscript -e 'reticulate::conda_list()'
```

```
+ Rscript -e reticulate::conda_list()
       name                python
1 miniconda /miniconda/bin/python
```

Installing Conda:

```
Rscript -e 'reticulate::conda_create(envname = "/opt/ormr")'
Rscript -e 'reticulate::conda_list()'

```
+ Rscript -e reticulate::conda_list()
       name                python
1 miniconda /miniconda/bin/python
2      ormr  /opt/ormr/bin/python
```

Rscript -e 'reticulate::use_condaenv(condaenv = "/opt/ormr")'
Rscript -e 'reticulate::use_python(python = reticulate:::python_binary_path("/opt/ormr"), required = TRUE)'
Rscript -e 'reticulate:::conda_list_packages(envname = "/opt/ormr")'
Rscript -e 'reticulate::conda_install(packages = "scipy", envname = "/opt/ormr")'
```


