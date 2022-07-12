# [Click My Web](https://hankai26.github.io/AnalyzeUP_UI/)
![image](https://user-images.githubusercontent.com/99574730/174512227-0ebd47b8-fe8b-48bd-9b78-500b7ed4847b.png)


**Background**  

Charitable giving is propelled by personal decisions laden with emotions, noble ideals and important goals. Akin to technology, charitable giving has evolved from just writing and sending checks to the donor being more actively engaged with the causes they support and the efficacy of charitable entities who supply support to said causes. The AnalyzeUp team will present a non-profit efficacy giving tool using IRS 990 data donated from Charity Navigator (https://www.charitynavigator.org/) a research think-tank that collects data on charities based in the US through IRS 990 tax forms and self-reported data. Therefore, the data supplied to AnalyzeUp is more current then web scraping or other charitable data sources. 

**Mission**

AnalyzeUp is motivated through the expectation of helping not only philanthropic end-users align their areas of philanthropic interest with efficacy, but also help the nonprofit sector. It is our thoughts that philanthropy acts as an epoxy that helps fill the chasms of need when governmental funding programs fail to. Philanthropy, on every level, not only safeguards a society, but ensures a society’s ability to flourish. 


**Key Questions**
1) What financial features should be evaluated a US charity's support efficacy?
2) How to classify a US charity's efficacy using  machine learning model?
3) What is the appropriate classification machine learning model to utilize to classify a charity's efficacy? 

## Communication Protocol
Refer to [AnalyzeUP Database Documentation](https://github.com/kyliekwann/FinalProject/blob/hankai26/DB_Documentation.md).
The AnalyzeUP database in PostgreSQL is connected to AWS and colab, as well as Jupyter Notebook using PySpark and SQLAlchemy. The [connection files](https://github.com/kyliekwann/FinalProject/blob/hankai26/AnalyzeUP_connect_db.ipynb) are saved in Colab.


## Project Outline

### - Data Extraction and Examination for Original Dataset.
The original comprehensive dataset has been stored in AWS S3 bucket and read into Colab and Jupyter Notebook in PySpark, as well as Pandas (as in Database documentation Section 6). 
![image](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/Read_Comp_Table.png)
Based on the given data and project goals, we stored the tables on the list below into database.
    
    1. Comprehensive table.

    2. API extracting data table.

    3. Table "name_comp" for charity name and cause.

    4. Table "expenses_comp" for the total expenses of charities.

    5. Table "assets_comp" for the total assets of charities.

    6. Table "state_comp" for the location state of charities.

    7. Table "info_comp" for other background information of charities, which is ready for UI content.
    
    8. Working table Using join operation in PostgreSQL, which is ready for reading and analysis in the following modeling process as in the figure below.
![image](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/working_table.png)  






### - Creating Entity Relationship (ER) Diagram to illustrates how “entities”, objects or concepts relate to each other factor within the data.
The ERD is created to show the data which is coming into the model.
![image](https://github.com/kyliekwann/FinalProject/blob/hankai26/DB_ERD.png)






### - Data Cleaning, Transformation and Preprocessing
Trouble-shooting is applied in examining original dataset to extract data using different libraries to compare the reading data size (as in Database documentation Section 5). Proper data cleaning and formatting are both needed to prepare tables for modeling purpose. One example is the Table "expenses_comp". Similar transformations are also necessary to prepare other tables.

![image](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/data_formatting1.png)
![image](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/data_formatting2.png)

### - Model Selection and Evaluation
After researching the best machine learning models available, the AnalyzeUp group decided to pursue an unsupervised model. After performing analysis using K-means clustering and Hierarchical clustering models, we decided that K-means was the ideal model as it not only produced a modeling accuracy of 90% but also because K-means modeling has use-cases of customer segmentation and recommendation systems which aligns with the scope and goal of our project. 

* Elbow curve shows the best value for k is k=4:
![elbow_curve_readme](https://github.com/kyliekwann/FinalProject/blob/main/Image/elbow_curve_readme.png?raw=true)

* 3D visualization of clustered classes:
![3D_clusters_readme](https://github.com/kyliekwann/FinalProject/blob/main/Image/3D_clusters_readme.png?raw=true)

* Using Silhouette Coefficient to evaluate the accuracy of the K-means model the results were
![Model_evaluation_SC](https://github.com/kyliekwann/FinalProject/blob/main/Image/Model_evaluation_SC.png?raw=true).






### - Model Saving and Loading
We use the pickle operation to serialize our machine learning algorithms and save the serialized format to a file. We're then ready to load this file when necessary to deserialize the model and use it to make new predictions.

    1. Save the model   
![pickle_save](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/pickle_save.png?raw=true)

    2. Load the model   
![pickle_save](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/pickle_load.png?raw=true)






**PRESENTATION**
The presentation can be found here: 
* https://docs.google.com/presentation/d/1UN8B0lSqF8CpbT0Fve6pnVvGJYs7ztdWuVYFFk4ba84/edit#slide=id.g13a303464a2_0_0
* https://docs.google.com/presentation/d/1UhdQw5l7eZLJNB4IM8grIsSR4T-ttT4bxXvSkt_9Oas/edit#slide=id.p

