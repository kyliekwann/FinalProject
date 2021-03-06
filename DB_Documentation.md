# AnalyzeUP Database Documentation

## 1. Database Set Up
For the database setting up section, we use Google Colaboratory (Links to an external site.) (Colab), which are Google-hosted cloud-based notebooks to remotely work together and share our work with others.  

Some setup for the database is required and completed as the images to
install packages for libraries, e.g. PySpark. Here we also download the Postgress driver which allows Spark to interact with Postgres.

![PySpark_1](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/PySpark_setup_1.png)

![PySpark_2](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/PySpark_setup_2.png)

## 2. Clound Storage
Amazon Web Services (AWS) is the largest cloud provider in the market. The Cloud services in free tier allows us to host the database for AnalyzeUP project. We work with a Postgres database and host it on AWS.


## 3. Connection among Postgres, AWS, Colab and Jupyter Notebook
    
- Connect pgAdmin to RDS Instance

![Conn_AWS_postgres](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/Conn_AWS_postgres.png)


- Test with Create and Read Tables

![createdTables_in_PySpark](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/createdTables_in_postgres.png)

![Test_CRUD](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/Test_CRUD.png)

- SQLAlchemy is also used to connect to the database

## 4. Model Connection to the Database

![Conn_model_write](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/Conn_model_write.png)

![Conn_model_read](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/Conn_model_read.png)


## 5. First Data Screening/Cleaning and Trouble-shooting
We received the original dataset "Charity_Navigator_US_States_and_Territories.csv" as our first data input. It's uploaded in our cloud storage (AWS S3 bucket) and read in dataframe using PySpark including 3,463 rows. The data is manipulated and selected with the insterested columns only, and saved directly into AnalyzeUp database successfully.
![read_s3_url_in_pyspark](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/read_s3_url_in_pyspark.png)

In order to make the following analysis more easily and productively, it needs to be read in other library also. While, we failed to read it directly in Pandas.
![read_ori_csv_in_Pandas_error](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/read_ori_csv_in_Pandas_error.png)

To continue read it in Pandas it has to skipping so-called "bad lines". However, there're 2,520 lines only reading into the dataframe.
![read_ori_url_in_Pandas_skip_2520](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/read_ori_url_in_Pandas_skip_2520.png)

The touble comes like how "bad" are the 943 rows of data? Are they really bad? We then come back to the original dataframe in PySpark, which consists of all 3,463 rows. Some dirty but helpful work as manual checking helps figure out the problem. There're multiple lines containing unexpected strings in the column "orgID" and others. To fix this, we remove all unexpected rows and transform column "orgID" to integer type. The cleaned dataframe with 3,354 rows are created and saved to AnalyzeUP database in Postgres and S3 bucket.

![cleandata_storage](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/cleandata_storage.png)

![Read_csv_in_Pandas_3354](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/Read_csv_in_Pandas_3354.png)

The trouble-shooting shows that Pandas may miss some data, which should be still useful, when applying "skiping function". Therefore, we need to compare the size of data read from different libraries with the original one prior to deciding the data cleaning method to keep as much data as possible.

By here, the database is ready to talk to Colab and Jupyter Notebook.


## 6. Read and Write Data to Database

We have different data sources to extract the charity information to create specific tables in the database.
- Table from comprehensive data
The comprehensive dataset has been stored in AWS S3 bucket and read into Colab and Jupyter Notebook in PySpark, as well as Pandas.
![Read_Comp_Table](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/Read_Comp_Table.png)

- Table from API
The provided API is used to extract json data. Selected information from the json data is transformed into dataframe saving into the database.
![API_Table.png](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/API_Table.png)

- Table "name_comp" for charity name and cause

- Table "expenses_comp" for the total expenses of charities

- Table "assets_comp" for the total assets of charities

- Table "state_comp" for the location state of charities

- Working table
Using join operation in PostgreSQL, we created specific working table depending on analysis purposes, and saved into database. The subject working table is ready to read into file and to use for further analysis.

## 7. Read into Jupyter Notebook
After connecting to the database, Jupyter Notebook is used to read the working table and transformed the information into dataframe for modeling purpose.
![working_table](https://github.com/kyliekwann/FinalProject/blob/hankai26/Image/working_table.png)





