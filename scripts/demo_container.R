library(reticulate)
reticulate::use_condaenv(condaenv = "/opt/ormr")
reticulate::use_python(python = reticulate:::python_binary_path("/opt/ormr"), required = TRUE)
reticulate::py_run_file(file = "scripts/scipy_example.py")