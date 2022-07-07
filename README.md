# [Click My Web](https://hankai26.github.io/AnalyzeUP_UI/)
![image](https://user-images.githubusercontent.com/99574730/174512227-0ebd47b8-fe8b-48bd-9b78-500b7ed4847b.png)


**Background**  

Charitable giving is propelled by personal decisions laden with emotions, noble ideals and important goals. Akin to tecnology, charitable giving has evolved from just writing and sending checks to the donor being more activly engaged with the causes they support and the efficacy of charitable entities who supply support to said causes.The AnalyzeUp team will present a non-profit efficacy giving tool using IRS 990 data donated from Charity Navigator (https://www.charitynavigator.org/) a research think-tank that collects data on charities based in the US through IRS 990 tax forms and self-reported data. Therefore, the data supplied to AnalyzeUp is more current then webscraping or other charitable data sources. 

**Mission**

AnalyzeUp is motivated through the expectation of helping not only philanthropic end-users align their areas of philanthropic interest with efficacy, but also help the nonprofit sector. It is our thoughts that philanthropy acts as an epoxy that helps fill the chasms of need when governmental funding programs fail to. Philanthropy, on every level, not only safeguards a society, but ensures a society’s ability to flourish. 


**Key Questions**
1) What requirements must be considered to create a model that can rate charities?
2) How much financial support is given within each community (impact heatmap) and by cause?

## Communication Protocol
Refer to [AnalyzeUP Database Documentation](https://hankai26.github.io/AnalyzeUP_UI/).
The AnalyzeUP database in PostgreSQL is connected to AWS and colab, as well as Jupyter Notebook using PySpark and SQLAlchemy.

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

    7. Working table Using join operation in PostgreSQL, which is ready for reading and analysis in the following modeling process as in the figure below.
![image](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/working_table.png)  

    6. Table "info_comp" for other background information of charities, which is ready for UI content.




### - Creating Entity Relationship (ER) Diagram to illustrates how “entities”, objects or concepts relate to each other factor within the data.
The ERD is created to show the data which's coming into the model.
![image](https://github.com/kyliekwann/FinalProject/blob/hankai26/DB_ERD.png)




### - Data Cleaning, Transformation and Prepocessing
Trouble-shooting is applied in examining original dataset to extract data using different libraries to compare the reading data size (as in Database documentation Section 5). Proper data cleaning and formatting are both needed to prepare tables for modeling purpose. One example is the Table "expenses_comp". Similar transformation is also necessary to prepre other tables.
![image](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/data_formatting1.png)
![image](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/data_formatting2.png)

For preprossessing of the model the below measures were taken on the tables read in to jupyter notebook from the database:
* As a best practice the datatypes, null values and possible duplicate entries were evaluated on the table data to ensure the data was cleaned. 
![Preprocessing_checking_db_tables](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_checking_db_tables.png?raw=true)
![Preprocessing_dropna.png](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_dropna.png?raw=true)
![Preprocessing_nullvalues_duplicates](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_nullvalues_duplicates.png?raw=true)

* Then the charity_name dataframe was created to be reindexed on the modeled dataframe. 
![Preprocessing_charity_name_df](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_charity_name_df.png?raw=true)

* Text features were converted to variables using get-dummies() and the data was scaled using StandardScaler().
![Preprocessing_get_dummies](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_get_dummies.png?raw=true)
![Preprocessing_standardize](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_standardize.png?raw=true)

* Finally the data dimensions were reduced using PCA.
![Preprocessing_PCA](https://github.com/kyliekwann/FinalProject/blob/main/Image/Preprocessing_PCA.png?raw=true)




### - Model Selection and Evaluation
After researching the best machine learning models available, the AnalyzeUp group decided to pursue an unsupervised model. After performing analysis using Kmeans clustering and Hierarchical clustering models, we decided that Kmeans was the ideal model as it not only produced a modeling accuracy of 90% but also because Kmeans modeling has use-cases of customer segmentation and recommendation systems which aligns with the scope and goal of our project. 
![Model_evaluation_elbow.png](https://github.com/kyliekwann/FinalProject/blob/main/Image/Model_evaluation_elbow.png?raw=true)
![Visualizing_prediction_results](https://github.com/kyliekwann/FinalProject/blob/main/Image/Visualizing_prediction_results.png?raw=true)
![Model_evaluation_SC](https://github.com/kyliekwann/FinalProject/blob/main/Image/Model_evaluation_SC.png?raw=true)




### - Model Saving and Loading
We use the pickle operation to serialize our machine learning algorithms and save the serialized format to a file. We're then ready to load this file when necessary to deserialize the model and use it to make new predictions.
![pickle_save](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/pickle_save.png?raw=true)
![pickle_save](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/pickle_load.png?raw=true)




**PRESENTATION & DASHBOARD**
The presentation and dashboard can be found here: 
* https://docs.google.com/presentation/d/1UN8B0lSqF8CpbT0Fve6pnVvGJYs7ztdWuVYFFk4ba84/edit#slide=id.g13a303464a2_0_0
* https://docs.google.com/presentation/d/1UhdQw5l7eZLJNB4IM8grIsSR4T-ttT4bxXvSkt_9Oas/edit#slide=id.p
