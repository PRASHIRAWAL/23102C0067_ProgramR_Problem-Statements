# LAB 3 : CONTROL FLOW FOR DATA CLEANING

# Load dataset
heart <- read.csv("heart_disease_uci.csv")

# View structure
str(heart)

# Step 1 : Introduce Invalid Values

set.seed(123)

# Negative BP values
heart$trestbps[c(5, 20)] <- c(-120, -95)

# Missing values
heart$trestbps[c(10, 35)] <- NA

# Extreme BP values (>300)
heart$trestbps[c(50, 75)] <- c(320, 450)

# Zero value for ratio calculation
heart$trestbps[100] <- 0



# Step 2 : BP Cleaning Function

clean_bp <- function(bp)
{
  if(is.na(bp))
  {
    return(NA)
  }
  else if(bp < 0)
  {
    return(NA)
  }
  else if(bp > 250)
  {
    return(250)
  }
  else
  {
    return(bp)
  }
}

# Apply function
heart$BP_Clean <- sapply(heart$trestbps, clean_bp)



# Step 3 : Error Handling using tryCatch()

safe_mean <- function(x)
{
  tryCatch(
    {
      mean(x, na.rm = TRUE)
    },
    warning = function(w)
    {
      print(paste("Warning:", w$message))
      return(NA)
    },
    error = function(e)
    {
      print(paste("Error:", e$message))
      return(NA)
    })
}

mean_bp <- safe_mean(heart$BP_Clean)

print(mean_bp)



# Cholesterol / BP Ratio

safe_ratio <- function(chol, bp)
{
  tryCatch(
    {
      if(is.na(bp) || bp == 0 || is.na(chol))
      {
        return(NA)
      }
      
      return(chol / bp)
    },
    error = function(e)
    {
      return(NA)
    })
}

heart$Chol_BP_Ratio <-
  mapply(safe_ratio,
         heart$chol,
         heart$BP_Clean)



# Step 4 : Loop Based Cleaning

bp_loop <- heart$trestbps

loop_time <-
  system.time({
    
    for(i in 1:length(bp_loop))
    {
      if(is.na(bp_loop[i]))
      {
        next
      }
      
      if(bp_loop[i] < 0)
      {
        bp_loop[i] <- NA
      }
      else if(bp_loop[i] > 250)
      {
        bp_loop[i] <- 250
      }
    }
    
  })



# Step 5 : Vectorized Cleaning

bp_vector <- heart$trestbps

vector_time <-
  system.time({
    
    bp_vector[bp_vector < 0] <- NA
    bp_vector[bp_vector > 250] <- 250
    
  })



# Step 6 : Compare Execution Time

print(loop_time)
print(vector_time)



# Step 7 : Validate Cleaned Data

cat("\nMissing Values :",
    sum(is.na(bp_vector)))

cat("\nMinimum BP :",
    min(bp_vector, na.rm = TRUE))

cat("\nMaximum BP :",
    max(bp_vector, na.rm = TRUE))

cat("\nMean BP :",
    mean(bp_vector, na.rm = TRUE))

cat("\nMedian BP :",
    median(bp_vector, na.rm = TRUE))

cat("\nNegative Values Remaining :",
    sum(bp_vector < 0, na.rm = TRUE))

cat("\nValues >250 Remaining :",
    sum(bp_vector > 250, na.rm = TRUE))



# Step 8 : Save Cleaned Dataset

heart$trestbps <- bp_vector

write.csv(
  heart,
  "cleaned_heart_data.csv",
  row.names = FALSE
)

cat("\nCleaning Completed Successfully!\n")