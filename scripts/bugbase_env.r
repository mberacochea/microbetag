#!/usr/bin/env Rscript

my_env <- "/opt/external_tools/BugBase"


package_list <- c("optparse", 
  "reshape2", 
  "plyr", 
  "RColorBrewer", 
  "gridExtra",  
  "beeswarm", 
  "plyr",
  "RJSONIO",
  "Matrix",
  "labeling",
  "digest")

lib_location <- paste(my_env, "/R_lib", sep='/')

for(p in package_list){
  if(!suppressWarnings(suppressMessages(require(p, character.only = TRUE, 
      lib.loc=lib_location, 
      quietly = TRUE, 
      warn.conflicts = FALSE)))){
    install.packages(p, lib=lib_location, repos="http://cran.r-project.org")
    suppressWarnings(suppressMessages(library(p, character.only = TRUE, 
      lib.loc=lib_location, 
      quietly = TRUE, 
      warn.conflicts = FALSE)))
  }
}
