library(reticulate)

# From https://github.com/rstudio/reticulate/issues/1044#issuecomment-896248800
Sys.setenv(PYTHONUSERBASE = "/opt/ormr/bin/python")
Sys.setenv(PYTHONPATH = "/opt/ormr/bin")
reticulate::use_condaenv(condaenv = "/opt/ormr")
reticulate::use_python(python = reticulate:::python_binary_path("/opt/ormr"), required = TRUE)

list.files(recursive = TRUE)

all_files <- list.files(recursive = TRUE, full.names = TRUE)

python_filename <- stringr::str_subset(
  string = all_files,
  pattern = "scipy_example.py"
)
testthat::expect_equal(length(python_filename), 1)

reticulate::py_run_file(file = python_filename)
