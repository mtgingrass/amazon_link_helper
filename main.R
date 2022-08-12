# This is a crude way to replace text with affiliate links
# This is a work in progress

library(readxl)
library(stringr)
library(readr)
library(here)
library(officer)

affiliate_path_name <- paste0("/Users/markgingrass/Library",
                              "/CloudStorage/OneDrive-Personal",
                              "/Documents/Amazon Affiliate Links.xlsx")

affiliate_file <- data.frame(read_excel(affiliate_path_name))
clean_file_name <- file.choose()

test_string <- read_docx(clean_file_name)
test_string <- sapply(docx_summary(test_string)[4], as.character)

for(x in 1:nrow(affiliate_file))
  test_string <- str_replace_all(test_string, 
                                 affiliate_file$Text[x],
                                 affiliate_file$Replacement_Code[x])
test_string

cat(test_string, file="test.rmd")            
