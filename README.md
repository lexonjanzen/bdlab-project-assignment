# bdlab-project-assignment
Our project assignment for Big Data Lab

# Proposal #

Alexander Janzen
s9346817@stud.uni-frankfurt.de

Matthias Kühnel
s4259738-stud.uni-frankfurt.de

# Abstract #

# Motivation and Goal #

We are interested in maximizing the taxi driver’s profit by analyzing the payment types for each trip. We think that customers who pay with credit cards are more valuable than other types of payments since not everbody is owning his or her own credit card. Besides, credit card owners can definitely pay the hole trip even if they will have to take on debts. In our opinion, we see there a possible factor to maximize the profit for taxi drivers. Thus, we want to combine this analytics with the amount of tips to show areas which are more valuable due to higher tips.
To solve this problem, we need data about which customer paid with credit card (or not) and how high the tip was when paying. Based on historical taxi data, our goal is to show the taxi drivers a map containing the clustered classifications of the average payments made in blog areas from the New York map including the tips. A blog area means a square on a classic map.

# Implementation requirements #

As a input, we’re planning toi use the taxi trip records from the NYC Taxi and Limousine Commision,  which provides data from 2 lines (green and yellow) every month of the year. The file format is a huge .csv data containing relevant information for our idea, e.g.:

*	Pickup coordinates
*	Type of payments
*	Tip amount

As a output, we expect to provide a map from New York with plotted dots. The map will be separates into squares based on the map fields. Each dot represents a starting coordinate. As we’re not interested in the taxi’s destination from driver’s perspective, only the starting coordinates are relevant to us. Besides, each dot has one of two colors, depending on if the tip is below or above the average tip amount. With this combination, we expect to have a visualization of which area is most valuable for taxi drivers in perspective of density and tip amount.

# Architectures #

We will use a classic sql database to evaluate the data from the taxi company. The store our data, we want to use HDFS  due to huge compatibility to other platforms, APIs and so on. The input file format is a .csv format, which means we need to import the data into HDFS. To do so, we want to use Apache Sqoop to import the relevant data. From there, we can use other tools to process the data. To query the data we need from our imported database, we want to use Cloudera Impala instead of Apache Hive, because it’s much faster and thus, there’s no need for special features as we only need to query the database. Since we’re implementing a practical use case, we need to ensure that we have a good performance, e.g. with Impala we can achieve that approach.
To stream the data, we will use Apache Kafka or Spark Streaming, depending on the practical usability.
To show the results from our classification and clustering, we want to use Plotly to visualize the data processing. The results will be plotted on top of the New York map. Thus, we will highlight the divison of the squares within the map. In case the framework isn’t suited well for our idea, we will use matplotlib or another framework instead.




In summary, our levels should be implemented as follows:


1. Level 1
* Data archiving via HDFS, importing the data via Sqoop
* Model creation via PySpark
1.	Level 2
* Preparing new data via Kafka
* Data Analysis via Spark
1.	Level 3
* visualization via Matplotlib/Plotly/other framework

Because we’re not quite sure if our approach is correct, some decisions are not final yet. In case of questions, please add a comment on the github repository.

# Used software and components #

* Cloudera Version 5.12 via QuickVM (centOS 6.7)
* Anaconda 4.3.1
* CDH 5 5.12.0-1.cdh5.12.0.p0.29
* KAFKA 3.0.0-1.3.0.0.p0.40
* Spark Version 1.6
* Jupyter Notebook
* Python 2.7 via Jupyter

# Installation steps #

* Cloudera Manager -> Parcels: 
  * download and activate distributed CDH-5 
  * download and activate distributed Anaconda
  * download and activate distributed Kafka
  
* Import CSV to HDFS
  * hdfs dfs -put /localdirectory/file.csv /hdfsdirectory/

* Start jupyter with custom settings
  * see start script for detailed information
  
