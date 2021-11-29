library(reticulate)

# From https://github.com/rstudio/reticulate/issues/1044#issuecomment-896248800
Sys.setenv(PYTHONUSERBASE = "/opt/ormr/bin/python")
Sys.setenv(PYTHONPATH = "/opt/ormr/bin")
reticulate::use_condaenv(condaenv = "/opt/ormr")
reticulate::use_python(python = reticulate:::python_binary_path("/opt/ormr"), required = TRUE)

list.files()
reticulate::py_run_file(file = "scripts/scipy_example.py")
