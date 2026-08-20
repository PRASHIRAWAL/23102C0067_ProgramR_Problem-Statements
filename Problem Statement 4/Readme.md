# Car vs Plane Image Classification using R

## 1. Project Objective

The objective of this project is to develop a simple image classification model using R to classify images into two categories: **Car** and **Plane**.

The project demonstrates image preprocessing, dataset preparation, neural network development, model training, and prediction using R.

---

## 2. Problem Description

Image classification is the process of assigning an image to a predefined category.

In this project, a neural network is trained to distinguish between images of cars and planes. Each image is assigned a numerical label:

* **0 → Plane**
* **1 → Car**

The images are preprocessed and resized before being provided to the neural network for classification.

---

## 3. Dataset Information

The dataset consists of **12 images** belonging to two classes:

| Class     | Number of Images | Label |
| --------- | ---------------: | ----: |
| Car       |                6 |     1 |
| Plane     |                6 |     0 |
| **Total** |           **12** |       |

### Training Dataset

* 5 car images
* 5 plane images
* Total: 10 images

### Testing Dataset

* 1 car image
* 1 plane image
* Total: 2 images

The images used in the project are stored in the `images/` directory.

---

## 4. R Packages/Libraries Used

### EBImage

`EBImage` was used for image processing and image manipulation.

Major operations include:

* Reading images
* Resizing images
* Displaying images
* Preparing image data

### Keras3

`keras3` was used to create and train the neural network model.

Major operations include:

* Creating the neural network
* Compiling the model
* Training the model
* Making predictions
* Evaluating model performance

### TensorFlow

TensorFlow was used as the backend for the Keras model.

---

## 5. Major Operations Performed

The project was implemented through the following stages:

1. Loaded the required R packages.
2. Set the working directory.
3. Loaded the car and plane images.
4. Resized all images to **28 × 28 pixels**.
5. Reshaped the image data for model input.
6. Divided the images into training and testing datasets.
7. Assigned labels:

   * `0` for Plane
   * `1` for Car
8. Converted the labels into categorical format.
9. Created a neural network using Keras.
10. Compiled the model using categorical cross-entropy loss and RMSprop optimizer.
11. Trained the model for 30 epochs.
12. Evaluated the model on training data.
13. Evaluated the model on test data.
14. Generated predictions.
15. Compared predicted and actual classes.
16. Calculated classification accuracy.
17. Plotted the training history.

---

## 6. Model Architecture

The neural network consists of the following layers:

| Layer  | Units | Activation |
| ------ | ----: | ---------- |
| Input  |  2352 | -          |
| Dense  |   256 | ReLU       |
| Dense  |   128 | ReLU       |
| Output |     2 | Softmax    |

The input size is:

**28 × 28 × 3 = 2352**

because the images are RGB images.

The output layer contains two neurons corresponding to the two classes.

---

## 7. Model Compilation

The model was compiled using:

* **Loss function:** Categorical Cross-Entropy
* **Optimizer:** RMSprop
* **Metric:** Accuracy

---

## 8. Model Training

The model was trained using the training dataset for **30 epochs**.

A validation split was used during training to monitor model performance.

The training history was plotted to observe changes in loss and accuracy during training.

---

## 9. Results and Output

The trained model was evaluated using both training and test data.

The final predictions were compared with the actual labels to determine whether each image was correctly classified as a car or plane.

Example output format:

| Image      | Predicted | Actual |
| ---------- | --------- | ------ |
| car6.jpg   | Car       | Car    |
| plane6.jpg | Plane     | Plane  |

The final accuracy and model evaluation values are obtained directly from the Keras evaluation output.

> **Note:** The dataset contains only 12 images, so the experiment demonstrates the image-classification workflow rather than providing a statistically reliable real-world classifier.

---

## 10. Screenshots

Screenshots of important outputs can be added to the `screenshots/` directory.

### Model Summary

![Model Summary](screenshots/model_summary.png)

### Training History

![Training History](screenshots/training_plot.png)

### Prediction Results

![Prediction Results](screenshots/prediction_result.png)

---

## 11. How to Execute the Project

### Requirements

* R
* RStudio or Google Colab with R runtime
* EBImage
* Keras3
* TensorFlow

### Install Required Packages

```r
install.packages("keras3")
install.packages("BiocManager")

BiocManager::install(
  "EBImage",
  ask = FALSE,
  update = FALSE
)
```

### Load Libraries

```r
library(EBImage)
library(keras3)
```

### Run the Project

1. Download or clone this repository.
2. Place the images inside the `images/` directory.
3. Open `car_plane_classification.R`.
4. Set the working directory to the project location.
5. Run the code sequentially.
6. The model will preprocess the images, train the neural network, evaluate the model, and generate predictions.

---

## 12. Git Version Control

Git was used throughout the development of the project.

Major development stages were committed separately, including:

* Project initialization
* Dataset addition
* Image preprocessing
* Dataset preparation
* Model implementation
* Model training and evaluation
* Final documentation

This demonstrates the use of meaningful Git commits instead of uploading the complete project in a single commit.

---

## 13. Conclusion

The project successfully demonstrated binary image classification using R, EBImage, Keras3, and TensorFlow. The images were processed, resized, labelled, and used to train a neural network capable of distinguishing between cars and planes. The model was evaluated using test data and predictions were compared with the actual classes.

The experiment provides a basic understanding of image preprocessing, neural network construction, model training, and image classification using R.

