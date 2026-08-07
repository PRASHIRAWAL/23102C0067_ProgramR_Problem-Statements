# LAB 4 : ADVANCED MISSING DATA HANDLING
# Dataset : UCI Adult Dataset

# Install packages (Run once)
install.packages("naniar")
install.packages("skimr")

library(naniar)
library(skimr)

# Step 1 : Load Dataset

col_names <- c(
  "age","workclass","fnlwgt","education","education_num",
  "marital_status","occupation","relationship","race",
  "sex","capital_gain","capital_loss","hours_per_week",
  "native_country","income"
)

adult <- read.csv(
  "adult.data",
  header = FALSE,
  col.names = col_names,
  strip.white = TRUE,
  na.strings = "?"
)

str(adult)



# Step 2 : Introduce Missing / Invalid Values

set.seed(123)

adult$age[c(5,20)] <- NA
adult$capital_gain[c(8,15)] <- NaN
adult$workclass[c(12,18)] <- ""
adult$age[c(30,45)] <- 999

# Demonstrate NULL
temp <- NULL

# Save original dataset
adult_before <- adult



# Step 3 : Detect Missing Values

cat("========== BEFORE CLEANING ==========\n\n")

cat("NA Values\n")
print(colSums(is.na(adult_before)))

cat("\nNaN Values\n")
print(sapply(adult_before, function(x)
{
  if(is.numeric(x))
    sum(is.nan(x))
  else
    0
}))

cat("\nNULL Object\n")
print(is.null(temp))

cat("\nBlank Strings\n")
print(sapply(adult_before, function(x)
{
  if(is.character(x))
    sum(x == "", na.rm = TRUE)
  else
    0
}))

cat("\nImpossible Age Values\n")
print(sum(adult_before$age == 999, na.rm = TRUE))

cat("\nVariable-wise Missing Summary\n")
print(miss_var_summary(adult_before))

# Missingness visualization
vis_miss(adult_before)



# Step 4 : Cleaning

adult <- adult_before

# Convert impossible age values to NA
adult$age[adult$age == 999] <- NA

# Replace blank strings
character_columns <- names(adult)[sapply(adult, is.character)]

for(col in character_columns)
{
  adult[[col]][adult[[col]] == ""] <- "Unknown"
}

# Remove rows containing NaN
numeric_columns <- names(adult)[sapply(adult, is.numeric)]

for(col in numeric_columns)
{
  adult <- adult[!is.nan(adult[[col]]), ]
}



# Step 5 : Median Imputation Function

median_impute <- function(x)
{
  median_value <- median(x, na.rm = TRUE)
  
  x[is.na(x)] <- median_value
  
  return(x)
}

# Apply to all numeric columns
numeric_columns <- names(adult)[sapply(adult, is.numeric)]

for(col in numeric_columns)
{
  adult[[col]] <- median_impute(adult[[col]])
}



# Step 6 : Complete Cases

complete_rows <- complete.cases(adult)

cat("\nComplete Rows :", sum(complete_rows), "\n")
cat("Incomplete Rows :", sum(!complete_rows), "\n")



# Step 7 : Missingness After Cleaning

cat("\n========== AFTER CLEANING ==========\n\n")

cat("NA Values\n")
print(colSums(is.na(adult)))

cat("\nMissing Summary\n")
print(miss_var_summary(adult))

vis_miss(adult)



# Step 8 : Validation

cat("\nValidation Results\n")

cat("Impossible Age Values Remaining :",
    sum(adult$age == 999), "\n")

cat("Missing Age Values :",
    sum(is.na(adult$age)), "\n")

cat("Blank Workclass Values :",
    sum(adult$workclass == ""), "\n")

cat("Complete Cases :",
    sum(complete.cases(adult)), "\n")

cat("Incomplete Cases :",
    sum(!complete.cases(adult)), "\n")

# Comprehensive summary
skim(adult)



# Step 9 : Save Cleaned Dataset

write.csv(
  adult,
  "cleaned_adult_data.csv",
  row.names = FALSE
)

cat("\nCleaning Completed Successfully!\n")

