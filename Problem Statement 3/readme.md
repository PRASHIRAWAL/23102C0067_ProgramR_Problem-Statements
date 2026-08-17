# Multi-Source Retail Sales Data Integration and Analysis

## 📌 Overview

This project implements an **R-based retail analytics solution** for importing, cleaning, integrating, and analyzing data stored across multiple sources.

The project uses the **UCI Online Retail Dataset** and organizes the data into three different formats:

* CSV – Transaction data
* JSON – Product data
* Excel – Customer data

The cleaned and integrated dataset is finally stored in a **SQLite database** for further analysis using SQL.

## 🎯 Objective

The main objective is to develop an R-based solution that can:

1. Import data from CSV, JSON, and Excel files.
2. Clean and preprocess the datasets.
3. Integrate the multiple data sources using `dplyr` joins.
4. Calculate sales revenue and perform business analysis.
5. Classify customers based on their purchase value.
6. Store the final integrated dataset in SQLite.
7. Execute SQL queries from R.
8. Generate meaningful business insights.

## 📊 Dataset

The project uses the **UCI Online Retail Dataset**, which contains transaction-level retail sales information.

The data is organized into:

### `transactions.csv`

Contains:

* `InvoiceNo`
* `StockCode`
* `CustomerID`
* `Quantity`
* `InvoiceDate`

### `products.json`

Contains:

* `StockCode`
* `Description`
* `UnitPrice`

### `customers.xlsx`

Contains:

* `CustomerID`
* `Country`

## 🔄 Project Workflow

```text
UCI Online Retail Dataset
          │
          ▼
   Data Preparation
          │
          ├── transactions.csv
          ├── products.json
          └── customers.xlsx
          │
          ▼
    Import using R
          │
          ▼
   Data Cleaning
          │
          ├── Missing Values
          ├── Duplicate Records
          ├── Invalid Quantities
          └── Invalid Prices
          │
          ▼
    Data Integration
          │
          ▼
   Revenue Calculation
   Revenue = Quantity × UnitPrice
          │
          ▼
     Data Analysis
          │
          ├── Total Revenue
          ├── Top 5 Products
          ├── Top 5 Countries
          ├── Top 5 Customers
          └── Customer Segmentation
          │
          ▼
      SQLite Database
          │
          ▼
      SQL Queries
          │
          ▼
    Business Insights
```

## 🛠️ Technologies Used

* **R**
* **Google Colab**
* **RStudio-compatible R packages**
* **dplyr**
* **tidyverse**
* **readxl**
* **jsonlite**
* **DBI**
* **RSQLite**
* **SQLite**
* **SQL**

## 🧹 Data Cleaning

The following preprocessing operations are performed:

* Missing values are identified and handled.
* Duplicate records are removed.
* Transactions with invalid or zero quantities are removed.
* Products with invalid or zero unit prices are removed.
* Records without `CustomerID` are removed where required for customer analysis.
* Revenue is calculated using:

```text
Revenue = Quantity × UnitPrice
```

These cleaning decisions ensure that the resulting dataset is suitable for sales and customer-level analysis.

## 🔗 Data Integration

The three datasets are integrated using `left_join()` from the **dplyr** package.

The joins are performed using:

```text
StockCode
CustomerID
```

A left join is used so that valid transaction records are retained while corresponding product and customer information is added wherever a matching record exists.

Unmatched records are also checked after integration.

## 📈 Analysis Performed

### 1. Total Sales Revenue

The total revenue generated from valid transactions is calculated.

### 2. Top 5 Products

Products are ranked according to their total generated revenue.

### 3. Top 5 Countries

Countries are ranked according to their total sales revenue.

### 4. Top 5 Customers

Customers are ranked according to their total purchase value.

### 5. Customer Value Classification

Customers are classified using `case_when()` into four categories:

* **Low Value**
* **Medium Value**
* **High Value**
* **Premium**

The thresholds are determined using customer purchase-value quartiles.

### 6. Market Performance

Countries are analyzed to identify:

* A high-performing market
* An underperforming market

The comparison is based on total revenue.

## 🗄️ SQLite Database

The final cleaned and integrated dataset is stored in:

```text
retail_sales.db
```

The database contains a table named:

```text
retail_sales
```

SQL queries are executed from R to retrieve business information.

Example queries include:

```sql
SELECT
    CustomerID,
    SUM(Revenue) AS Total_Revenue
FROM retail_sales
GROUP BY CustomerID
ORDER BY Total_Revenue DESC
LIMIT 5;
```

and:

```sql
SELECT
    Country,
    SUM(Revenue) AS Total_Revenue
FROM retail_sales
GROUP BY Country
ORDER BY Total_Revenue DESC;
```

## 📁 Project Structure

```text
Multi-Source-Retail-Sales-Analysis/
│
├── README.md
├── Lab_3_Retail_Sales_Analysis.ipynb
│
├── transactions.csv
├── products.json
├── customers.xlsx
│
├── retail_sales.db
│
└── Online Retail.xlsx
```

## ▶️ How to Run

### Option 1: Google Colab

1. Open the R notebook in Google Colab.
2. Select an **R runtime**.
3. Run the package installation and library cells.
4. Upload/download the required dataset files.
5. Run the notebook cells sequentially.
6. The analysis results and business insights will be displayed in the notebook.
7. The SQLite database will be generated as `retail_sales.db`.

### Option 2: Local R Environment

Install the required R packages:

```r
install.packages(c(
  "tidyverse",
  "readxl",
  "jsonlite",
  "RSQLite",
  "DBI"
))
```

Then run the notebook/script in an R environment.

## 📦 Expected Outputs

After successful execution, the project produces:

* Cleaned transaction data
* Integrated retail dataset
* Total sales revenue
* Top 5 products
* Top 5 countries
* Top 5 customers
* Customer value categories
* Market performance analysis
* SQLite database
* SQL query results
* Three business insights

## 💡 Business Insights

The analysis is used to identify:

1. The major markets contributing to overall revenue.
2. The products generating the highest revenue.
3. High-value and premium customers who contribute significantly to sales.

The exact insights and numerical values are generated from the results obtained while running the notebook.

## 📚 Skills Demonstrated

* CSV data import
* JSON data import
* Excel data import
* Data cleaning and preprocessing
* Missing-value handling
* Duplicate removal
* `dplyr` data manipulation
* `left_join()`
* `group_by()`
* `summarise()`
* `case_when()`
* Business analytics
* SQLite database connectivity
* SQL querying
* Data integration
* Business interpretation

## 📌 Conclusion

This project demonstrates how heterogeneous retail datasets can be imported, cleaned, integrated, analyzed, and stored in a relational database using **R and SQL**.

The workflow provides a consolidated view of retail sales performance and customer value while demonstrating practical data integration and business analytics techniques.

## 👩‍💻 Author

**Prashi Rawal**

Computer Engineering Student

