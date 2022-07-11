# AnalyzeUP K-means Model Documentation

## Description of Preliminary Data Preprocessing
Although preprocessing started when tables were created and cleaned in PgAdmin, further preprocessing need to be performed using pandas in jupyter notebook to ensure that the data from the tables being read into jupyter notebook not only had the correct datatypes for the machine learning model, but also that it was void of null values and possible duplicate entries:
![Preprocessing_checking_db_tables](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_checking_db_tables.png?raw=true)
![Preprocessing_dropna.png](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_dropna.png?raw=true)

Once it was determined that the table data datatypes were compatible with the K-means clustering model and was void from any null values or duplicate entries a charity_name dataframe was created to be reindexed on the modeled dataframe post-modeling: 
![Preprocessing_charity_name_df](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_charity_name_df.png?raw=true)
Additionally, text features in the ‘Cause’ column were converted to variables using get-dummies() and the data was scaled using StandardScaler().
![Preprocessing_get_dummies](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_get_dummies.png?raw=true)
![Preprocessing_standardize](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_standardize.png?raw=true)

## Description of Preliminary Feature Engineering, Feature Selection and Decision Process.
### Feature Engineering
First the data dimensions were reduced using Principal Component Analysis (PCA). Then a dataframe was created with three principal components. This was performed to better visualize 3D patterns in the data.
![Preprocessing_PCA](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_PCA.png?raw=true)

Next the best value for k was determined by using the Elbow Curve.

![Model_evaluation_elbow](https://github.com/kyliekwann/FinalProject/blob/main/Image/Model_evaluation_elbow.png?raw=true)

After finding that k=4 the K-means model was initialized, fitted, saved for future use and the clusters were able to be predicted. Subsequently, a new clustered dataframe was created to include the clusters and charity features. 
![k4_and_class](https://github.com/kyliekwann/FinalProject/blob/main/Image/k4_and_class.png?raw=true)
Finally, visualizations of the predicted results were plotted in 3D and 2D scatterplots to better evaluate the clustering.  
![Visualizing_prediction_results](https://github.com/kyliekwann/FinalProject/blob/main/Image/Visualizing_prediction_results.png?raw=true)
![rated_charities_and_class_df](https://github.com/kyliekwann/FinalProject/blob/main/Image/rated_charities_and_class_df.png?raw=true)
![Scatter_plot_w_rated_charties](https://github.com/kyliekwann/FinalProject/blob/main/Image/Scatter_plot_w_rated_charties.png?raw=true)

### Feature Selection
The features that were selected for modeling are the data in the total_expenses and total_net_assets columns.
![Preprocessing_get_dummies](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_get_dummies.png?raw=true)

### Decision Process
The decision to use total_expenses and total_net_assets as our model features was because they exemplify the indicators of a charity’s overall efficacy because of the following:
* total_expenses reflects the total functional expenses, computed as the sum of program expenses, administrative expenses and fundraising expenses, as reported on the income statement (IRS 990) 
* total_net_assets are the difference between assets and liabilities, as reported on the organization's financial statement (IRS 990) Although charities do not exist to make money, they do work to build and maintain reasonable reserves of net assets. Growing its net assets helps a charity outpace inflation and sustain future program activities

## Description of How the Data was Split into Training and Testing Sets
After researching how to split and train clustered data into testing sets of a K-means clustering model the best approach found was to use a K-Nearest Neighbors (KNN) algorithm. We were able to to run our modeled data from our K-means model in KNN to produce a confusion matrix and classification_report. 
The literature (https://stackoverflow.com/a/37845595), (https://becominghuman.ai/comprehending-k-means-and-knn-algorithms-c791be90883d)and (https://www.freecodecamp.org/news/how-to-build-and-train-k-nearest-neighbors-ml-models-in-python/), additionally suggests that future data can be rated with KNN. 

![]()
![]()
![]()
![]()
![]()

## Explanation of Model Choice Including Limitations and Benefits
After researching the best machine learning models available, the AnalyzeUP group decided to pursue an Unsupervised model. After performing analysis using Kmeans clustering and Hierarchical clustering models, we decided that Kmeans was the ideal model as it not only produced a modeling accuracy of 90% but also because Kmeans modeling has use-cases of customer segmentation and recommendation systems which aligns with the scope and goal of our project.
### Model Limitations
1. Requires the expected number of clusters before modeling 
2. Tends to have troubles with varying cluster sizes and densities

### Model Benefits 
1. Is scalable to large datasets 
2. Is simple to interpret 
3. Results in tight clusters