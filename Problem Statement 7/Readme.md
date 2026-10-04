# Customer Segmentation and Predictive Analytics Using Machine Learning

## Overview

This R Programming laboratory experiment focuses on analyzing customer purchasing behavior using the **UCI Online Retail Dataset**. The objective is to identify meaningful customer segments using unsupervised learning techniques and predict whether a customer belongs to a high-value customer segment using supervised machine learning.

The experiment covers data preprocessing, feature engineering, clustering, dimensionality reduction, classification, model evaluation, visualization, and customer-specific marketing recommendations.

## Problem Statement

An e-commerce company wants to better understand its customers and improve its marketing decisions. Historical online retail transaction data is used to construct customer-level features and identify meaningful customer segments.

The experiment performs customer segmentation using **K-Means and Hierarchical Clustering** and identifies a high-value customer segment. **Random Forest and Support Vector Machine (SVM)** models are then developed to predict whether a customer belongs to the high-value segment.

## Dataset

The experiment uses the **UCI Online Retail Dataset**.

The dataset contains approximately **541,909 online retail transactions** with attributes such as:

- Invoice Number
- Stock Code
- Product Description
- Quantity
- Invoice Date
- Unit Price
- Customer ID
- Country

## Objectives

- Preprocess the online retail transaction data.
- Handle missing values, duplicate records, cancellations, and invalid transactions.
- Create customer-level features using RFM analysis.
- Perform outlier treatment and feature scaling.
- Determine the optimal number of clusters using the Elbow Method.
- Perform customer segmentation using K-Means clustering.
- Perform Hierarchical Clustering and visualize the dendrogram.
- Compare clustering methods using the Silhouette Score.
- Apply PCA for dimensionality reduction and visualization.
- Profile and interpret the identified customer segments.
- Identify a high-value customer segment.
- Build Random Forest and SVM models to predict high-value customers.
- Evaluate classification models using Accuracy, Precision, Recall, F1-Score, and ROC-AUC.
- Analyze the feature importance of the Random Forest model.
- Create an interactive 3D visualization of customer clusters using Plotly.
- Develop targeted marketing recommendations for different customer segments.

## Technologies Used

- R
- Google Colab
- RStudio-compatible R code
- UCI Online Retail Dataset

## R Packages Used

```r
readxl
dplyr
ggplot2
cluster
factoextra
randomForest
e1071
pROC
plotly
tidyr
scales
