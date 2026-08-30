# Social Network Analysis with R

## Overview

This project implements **Social Network Analysis (SNA)** using R. The objective is to represent relationships between entities as a network, analyze its structure, identify important or influential nodes, and visualize the resulting social network.

The **Zachary Karate Club** network is used as the dataset. The network contains relationships between members of a karate club and is suitable for demonstrating different network-analysis techniques.

## Objectives

* Represent entities as nodes and relationships as edges.
* Construct and analyze a social network using R.
* Calculate important network characteristics.
* Measure node importance using different centrality measures.
* Identify highly connected and influential nodes.
* Detect communities within the network.
* Visualize the network structure.
* Interpret the obtained results.

## Dataset

The project uses the **Zachary Karate Club** network available through the `igraph` R package.

The network contains:

* **34 nodes**
* **78 edges**
* **Network density:** 0.139
* **Connected components:** 1

Each node represents a member of the karate club, while each edge represents a relationship between two members.

## Technologies Used

* **R**
* **RStudio / Google Colab**
* **igraph**
* **ggraph**
* **ggplot2**

> The final network visualizations are implemented using `igraph`.

## Analysis Performed

### 1. Network Construction

The Zachary Karate Club network is loaded using:

```r
karate <- make_graph("Zachary")
```

The network is represented as a graph consisting of nodes and edges.

### 2. Basic Network Analysis

The following characteristics are calculated:

* Number of nodes
* Number of edges
* Network density
* Number of connected components
* Network diameter
* Average path length
* Global clustering coefficient

### 3. Degree Centrality

Degree centrality measures the number of direct connections associated with each node.

In this analysis, **Node 34** has the highest degree with **17 connections**, followed by Node 1 with 16 connections and Node 33 with 12 connections.

### 4. Betweenness Centrality

Betweenness centrality identifies nodes that frequently occur on shortest paths between other nodes.

**Node 1** has the highest betweenness centrality, with a value of approximately **0.438**, indicating that it plays an important bridging role within the network.

### 5. Closeness Centrality

Closeness centrality measures how close a node is to the other nodes in the network.

**Node 1** has the highest closeness centrality at approximately **0.569**, followed by Node 3 and Node 34.

### 6. Eigenvector Centrality

Eigenvector centrality considers both the number of connections and the importance of connected neighbors.

**Node 34** has the highest eigenvector centrality with a value of **1.000**, followed by Node 1 with approximately **0.952**.

### 7. Community Detection

The Louvain community-detection method is used to identify groups of closely connected nodes within the network.

### 8. Network Visualization

The network is visualized using `igraph`. Node size can be based on degree centrality so that highly connected nodes are visually emphasized.

## Key Findings

The analysis shows that different centrality measures identify node importance from different perspectives.

* **Node 34** is the most highly connected node based on degree centrality.
* **Node 34** also has the highest eigenvector centrality, indicating strong connections to influential nodes.
* **Node 1** has the highest betweenness centrality, making it an important bridge within the network.
* **Node 1** also has the highest closeness centrality, indicating that it is relatively close to other members.
* The network consists of a single connected component, meaning all members are connected directly or indirectly.

## Interpretation

The results demonstrate that there is no single definition of an "important" node in a social network.

Node 34 is particularly important because it has the largest number of direct connections and the highest eigenvector centrality. On the other hand, Node 1 is strategically important because of its high betweenness and closeness centrality.

Therefore, Node 34 can be viewed as a highly connected and influential node, while Node 1 can be viewed as an important connector and information-flow node.

## Project Structure

```text
Social-Network-Analysis-R/
│
├── ProgramR_PBL5.ipynb
├── README.md
└── outputs/
    ├── network_visualization.png
    ├── community_visualization.png
    └── centrality_results.png
```

## How to Run

### Using Google Colab

1. Open `ProgramR_PBL5.ipynb` in Google Colab.
2. Select the **R** runtime.
3. Run the cells sequentially.
4. Install the required R packages when prompted.
5. Execute the network construction and analysis cells.
6. View the generated network visualizations and centrality results.

### Using RStudio

1. Install R and RStudio.
2. Install the required packages:

```r
install.packages("igraph")
install.packages("ggraph")
install.packages("ggplot2")
```

3. Open the R notebook/script.
4. Load the required libraries.
5. Execute the cells sequentially.
6. Examine the generated results and visualizations.

## Conclusion

This project successfully demonstrates Social Network Analysis using R. The network was constructed using nodes and edges, and several network measures were calculated to understand its structure.

Degree, betweenness, closeness, and eigenvector centrality were used to identify different types of important nodes. Community detection and network visualization provided additional insight into the relationships and structure of the network.

The experiment demonstrates how R can be used to analyze complex relationships and identify influential entities in social and other real-world networks.

## Learning Outcomes

Through this project, the following skills were developed:

* Network data preparation and representation
* Graph construction using R
* Social Network Analysis
* Centrality analysis
* Community detection
* Network visualization
* Interpretation of network measures
* End-to-end implementation of a network-analysis workflow

## Reference

The laboratory problem was based on the prescribed **Social Network Analysis with R** tutorial and requires students to construct, analyze, visualize, and interpret a social network using R.
