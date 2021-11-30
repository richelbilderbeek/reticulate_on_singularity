library(reticulate)

reticulate::use_condaenv(condaenv = "/opt/ormr")
reticulate::use_python(python = reticulate:::python_binary_path("/opt/ormr"), required = TRUE)

download.file(
  url = "https://raw.githubusercontent.com/richelbilderbeek/reticulate_on_singularity/master/scripts/scipy_example.py",
  destfile = "scipy_example.py"  
)

message("Files in local folder: ")
list.files()
message("Files in 'scripts' folder: ")
list.files(path = "scripts", full = TRUE, recursive = TRUE)

all_files <- list.files(recursive = TRUE, full.names = TRUE)
message("all_files: ")
message(all_files)

python_filename <- stringr::str_subset(
  string = all_files,
  pattern = "scipy_example.py"
)
testthat::expect_equal(length(python_filename), 1)

reticulate::py_run_file(file = python_filename)
