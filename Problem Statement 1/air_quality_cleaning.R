library(ggplot2)

file_name <- "PRSA_Data_Aotizhongxin_20130301-20170228.csv"

air_data <- tryCatch(
  {
    read.csv(file_name)
  },
  error = function(e)
  {
    stop("Unable to read the dataset.")
  }
)

head(air_data)

str(air_data)

dim(air_data)

any(is.na(air_data))

sum(is.na(air_data))


# Task 2: Understand NA, NULL and NaN

temperature <- c(28, 30, NA, 32)
missing_object <- NULL
undefined_value <- 0 / 0

cat("Temperature Vector:\n")
print(temperature)

cat("\nMissing Object:\n")
print(missing_object)

cat("\nUndefined Value:\n")
print(undefined_value)

cat("\nChecking NA:\n")
print(is.na(temperature))

cat("\nChecking NULL:\n")
print(is.null(missing_object))

cat("\nChecking NaN:\n")
print(is.nan(undefined_value))


# Task 3: Missing Value Summary

missing_summary <- function(data)
{
  selected_variables <- c("PM2.5", "PM10", "SO2", "NO2", "TEMP", "WSPM", "wd")
  
  summary_table <- data.frame(
    Variable = character(),
    Total_Records = integer(),
    Missing_Values = integer(),
    Missing_Percentage = numeric(),
    stringsAsFactors = FALSE
  )
  
  for(variable in selected_variables)
  {
    total_records <- nrow(data)
    missing_values <- sum(is.na(data[[variable]]))
    missing_percentage <- (missing_values / total_records) * 100
    
    summary_table <- rbind(summary_table,
                           data.frame(
                             Variable = variable,
                             Total_Records = total_records,
                             Missing_Values = missing_values,
                             Missing_Percentage = round(missing_percentage,2)
                           ))
    
    if(missing_percentage > 20)
    {
      warning(paste(variable,
                    "contains more than 20% missing values"))
    }
  }
  
  return(summary_table)
}

missing_table <- missing_summary(air_data)

print(missing_table)


# Task 4: Identify Invalid Numerical Results

air_data$pollution_ratio <- air_data$PM2.5 / air_data$PM10

cat("Number of NA values:",
    sum(is.na(air_data$pollution_ratio)), "\n")

cat("Number of NaN values:",
    sum(is.nan(air_data$pollution_ratio)), "\n")

cat("Number of Infinite values:",
    sum(is.infinite(air_data$pollution_ratio)), "\n")

air_data$pollution_ratio[
  is.nan(air_data$pollution_ratio) |
    is.infinite(air_data$pollution_ratio)
] <- NA

cat("\nAfter Replacement\n")

cat("NA values:",
    sum(is.na(air_data$pollution_ratio)), "\n")

cat("NaN values:",
    sum(is.nan(air_data$pollution_ratio)), "\n")

cat("Infinite values:",
    sum(is.infinite(air_data$pollution_ratio)), "\n")


# Task 5: Handle Missing Numerical Values Using a Loop

numeric_variables <- c("PM2.5", "PM10", "SO2", "NO2", "TEMP", "WSPM")

for(variable in numeric_variables)
{
  if(variable %in% names(air_data))
  {
    missing_before <- sum(is.na(air_data[[variable]]))
    
    median_value <- median(air_data[[variable]], na.rm = TRUE)
    
    air_data[[variable]][is.na(air_data[[variable]])] <- median_value
    
    missing_after <- sum(is.na(air_data[[variable]]))
    
    cat("Variable:", variable, "\n")
    cat("Missing Before:", missing_before, "\n")
    cat("Median Used:", median_value, "\n")
    cat("Missing After:", missing_after, "\n")
  }
  else
  {
    cat("Variable", variable, "does not exist.\n")
  }
}


# Task 6: Handle Missing Categorical Values

calculate_mode <- function(x)
{
  unique_values <- unique(x)
  
  unique_values <- unique_values[!is.na(unique_values)]
  
  mode_value <- unique_values[
    which.max(tabulate(match(x, unique_values)))
  ]
  
  return(mode_value)
}

missing_before <- sum(is.na(air_data$wd))

mode_wd <- calculate_mode(air_data$wd)

air_data$wd[is.na(air_data$wd)] <- mode_wd

missing_after <- sum(is.na(air_data$wd))

cat("\nMode of wd:", mode_wd, "\n")
cat("Missing Before:", missing_before, "\n")
cat("Missing After:", missing_after, "\n")


# Task 7: Implement Error Handling

clean_variable <- function(data, variable_name)
{
  tryCatch(
    {
      if(!(variable_name %in% names(data)))
      {
        stop("Variable does not exist.")
      }
      
      if(!is.numeric(data[[variable_name]]))
      {
        stop("Variable is not numerical.")
      }
      
      if(all(is.na(data[[variable_name]])))
      {
        stop("Variable contains only missing values.")
      }
      
      median_value <- median(data[[variable_name]], na.rm = TRUE)
      
      if(is.na(median_value))
      {
        stop("Median cannot be calculated.")
      }
      
      data[[variable_name]][is.na(data[[variable_name]])] <- median_value
      
      cat(variable_name, "cleaned successfully.\n")
      
      return(data[[variable_name]])
    },
    
    error = function(e)
    {
      cat("Error:", e$message, "\n")
      return(NULL)
    })
}


# Task 8: Compare Missing Values Before and After Cleaning

comparison_table <- data.frame(
  
  Variable = c("PM2.5", "PM10", "SO2", "NO2", "TEMP", "WSPM", "wd"),
  
  Missing_Before = c(925, 718, 935, 1023, 20, 14, 81),
  
  Missing_After = c(
    sum(is.na(air_data$PM2.5)),
    sum(is.na(air_data$PM10)),
    sum(is.na(air_data$SO2)),
    sum(is.na(air_data$NO2)),
    sum(is.na(air_data$TEMP)),
    sum(is.na(air_data$WSPM)),
    sum(is.na(air_data$wd))
  )
)

comparison_table$Values_Replaced <-
  comparison_table$Missing_Before -
  comparison_table$Missing_After

print(comparison_table)


# Task 9: Generate Visualization

before <- c(925, 718, 935, 1023, 20, 14, 81)
after <- c(
  sum(is.na(air_data$PM2.5)),
  sum(is.na(air_data$PM10)),
  sum(is.na(air_data$SO2)),
  sum(is.na(air_data$NO2)),
  sum(is.na(air_data$TEMP)),
  sum(is.na(air_data$WSPM)),
  sum(is.na(air_data$wd))
)

missing_data <- data.frame(
  Variable = rep(c("PM2.5", "PM10", "SO2", "NO2", "TEMP", "WSPM", "wd"), 2),
  Missing = c(before, after),
  Status = rep(c("Before Cleaning", "After Cleaning"), each = 7)
)

ggplot(missing_data,
       aes(x = Variable,
           y = Missing,
           fill = Status)) +
  geom_bar(stat = "identity",
           position = "dodge") +
  labs(
    title = "Missing Values Before and After Cleaning",
    x = "Variables",
    y = "Number of Missing Values"
  ) +
  theme_minimal()


# Task 10: Export the Cleaned Dataset

write.csv(
  air_data,
  "cleaned_air_quality_data.csv",
  row.names = FALSE
)

cat("Cleaned dataset exported successfully.\n")