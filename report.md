#1-Ask and Plan
##Who are BellaBeat?
Bellabeat is a manufactuer of smart health products for women. It is a global company since 2016. They own several physical stores, their own e-commerce channel, website and online retailers (amazon and such).  
BellaBeat manufactures several products. The products are ordinary looking jewelry, you won't realize they're (too) smart!
- BellaBeat Leaf: smart bracelet, necklace or clip.
- BellaBeat Time: watch, but aso classic looking
- BellaBeat Spring: smart water bottle

Owners of BellaBeat devices enjoy the BellaBeat app: an app that receives data about vitals from smart devices about activity, sleep, stress, menstruation and the users' habits.  
BellaBeat membership subscription: 24/7 access to personalized guidance on the above problems, beauty and goals.

####BellaBeat Marketing Strategy: 
- traditional (radio, billboards, print e.g. magazines, television), but they also extensively focus on digital
- ads in google search, google display network (the ads by google you find on pages, phone apps and etc.), youtube, active ig and fb pages, and twitter interactions
- they use google display network around key marketing dates
The CEO requires us to analyze the usage data of a device to gain insight on how users are already using said smart devices.
then she wants high-level recommendations on how said insight can inform the marketing strategy

To learn more about BellaBeat, you can visit their [website.](https://bellabeat.com)  

---
##The Scope of Work
####My Role
- Me: junior data analyst  
- position: marketing analysis team  
- Company : Bellabeat, manufacturer of smart health products for women
- My task: analyze one of their product’s data

#####Analysis task: I will be analyzing data from customer’s use of the products.
-i.e. data collected by the device itself from customers, and sent to us.

####Stakeholders:  
- My team and the Executive Team
- CCO (founder)
- Mathematician, executive and cofounder.

#####Deliverables: presentation and recommendations

###The Analysis Problem
Problem: explore the use data of one of our health products and app to find insights, patterns and trends about the users’ usage to be used in making high-level marketing recommendations.  
The dataset is data collected by the app/device.

#####Potential Questions that need to be answered:
- What do they do the most/least with their product?  
- How long do they wear it everyday?  
- What is the thing they enjoy most/least about their product?  
- What features seem missing that we can add to the product?  
- who are the people who use our product the most/least? age/nationality  
- What is the most frequent time of day for usage?  
- on a scale from 0-5, rate your experience with the product, why?  
- How much running did they do this week? how long are their intervals?  
- Are there any men using our products?  
- what is the most unusual thing they do with the product?  
- What is the average intensity of any exercise?  
- Are those users’ health metrics within the healthy range?  

#####Hypothesis: they use the product the most for running and tracking their menstrual period or pregnancy.

####Required characteristics of the dataset:  
1. Population: there have been 100000 sold Bellabeat Leaf units from 2013 to 2017. I’m going to assume 100000 unique subjects.
with a margin of error of 10%, a confidence level of 10% I should have a sample size of at least 68 users.
2. Detailed non aggregate daily data of the usage, with intervals.
3. Rating about features of the product, or the product as a whole.
4. Also includes male users if possible.
5. Women of different ages, race, nationality, and physically or mentally challenged women, as well as women of several income brackets
6. preferably the data needs to be up to date as possible, with COVID-19 happening and all.
---
#2-Prepare
####1. Data Collection
 - The dataset used was not going to be a dataset collected by BellaBeat devices themselves, it was recommended to use FitBit proxy data. I have searched the internet for proxy BellaBeat data, but only FitBit or apple watch data was available, and the FitBit data had more users.
 - It is a proxy dataset collected by Amazon Mechanical Turk online survey 2 days In December 2016.  
 - The data was collected from 30 FitBit consenting users who gave their information about minute-level output for physical activity, heart rate, cadence, MET and sleep.
 - This is 3rd party data. The users sent their data to Zenodo who sent to the Kaggle dataset owner Mobius, and the dataset was downloaded from Kaggle.  
 - It is unclear why the data was collected in the first place, but it is assumed that it was general analysis of smart health device activity, or as practice for students or Kaggle competitions.  
 - It is not possible to know whether all the people who replied are men or women, It is also impossible to know if any of them are lying or do not have a FitBit device at all, but that is unlikely.

####2.Meta-Data
 - The dataset has no metadata at all whatsoever. some of the fields were researched on the FitBit device API website, and by reading medical articles and definitions.
 - 4 unimportant columns, or ones that could not be reserarched were removed from the dataset.

####3. Software used
- The dataset is large. some files have 3.5 million records!
- It has been decided to use a database to store the data and do the analysis there. a database called FitBitData was created in PostgreSQL on my device.
- Further metadata has been added to the dataset, with the proper data types, precision, format, constraints and etc.
- Tables in postgreSQL database were created with the coressponding names, datatypes, constraints and etc.

####4. Checking if dataset can still answer original questions.
- By looking at the dataset I can see that there are 2 giant joined tables:
  1. by minute (sleep, calorie, MET, steps, and intensity)
  2. by day (steps, distance, active minutes and calories)
  3. There are also the HRV and Weight tables.

- There are some interesting correlations worth investigating. i.e. the relation between calories, MET and intensity.
- I also want to find the avg pace in steps/km for different levels of activity or speed of a person. I also want to see the relation between MET, steps vs sleep_value

- Overall, the dataset has enough attributes to answer some of the questions. It is missing a few such as detailed activity, demographics, gender, job, menstruation cycle info. I can try to infer the nature of their job: is it sedentary? or active?
- However, There is no way to tell if the data is accurate or incomplete. it did not mention how many records. But it did say 30 subjects, and they were 33 unique device_id values. 
- The dataset has one huge limitation though: It is from 2016! we’re in 2021 now. this is a huge problem, because in 2021 we have problems such as COVID-19 where people’s activity has highly changed. 
- The dataset is also not cited, There is also no clue about the creator of the dataset.

####5. Data Ethics, Bias and Privacy
- All the users gave their consent to the data. there is no personal information whatsoever, so the data does even need anonymization.
- If the users of this dataset could be contacted, they should be contacted to inform them of our decision to use their data for our company's marketing purposes, and our procedures.  
- All of data is supposedly self reported so this decreases the possibility of some forms of bias. however, as stated above, there is no way to know age, gender, demographics or whatever.
---

#3-Process

The data has been backed up to GitHub in the latest commit before I start the process stage and start cleaning the dataset.

###1.Data Integrity: 
 - accuracy: there seems to be a problem with some of the fields. e.g. MET should be 1 if there is no exercise being done, but they all have 10
 - consistency: The dataset has been made consistent by keeping the same fields with the same names everywhere in the database with the same type, format and precision
 - completeness: the dataset is complete. nothing was lost during download or conversion from .csv files to the postgreSQL FitBitData Database.

###2. Cleaning:
 - The tables will now be explored. the following will be done to each table:
    1. Constraints will be added to the tables and columns (enumeration, set membership, cross column, range, not NULL etc.)
    2. The tables will be checked for duplicate rows. if any are found they will be removed
    3. The tables will be checked for NULL values. if any are found they will be dealt with accordingly.
    4. Some columns maybe combined into a single column, other columns maybe processed or divided into several other columns
    5. String types will be checked for excessive whitespace, and removed if any.


- SQL syntax for removing whole duplicate records from any table "table_name"
  ```{postgresql}
  WITH everything AS (
    DELETE FROM table_name
    RETURNING *
  )
  INSERT INTO table_name
  SELECT DISTINCT *
  FROM everything;
  ```
- SQL syntax for checking for any cells in any table "table_name" that have NULL values
  ```{postgresql}
  SELECT *
  FROM table_name
  WHERE
    NOT (table_name IS NOT NULL);
  ```
  

  - Weight table:  
    - There are no duplicate records
    - There are no null values
    - Constraints have been added to weight_kg, bfr, bmi and height_m to be >= 0, and bfr <= 1
    - Device_id to check that it is exactly 10 characters long.
    - Split the date_of_weigh column into 2 columns: date and time
    - Added NOT NULL to date and time columns
    - All the fields are numeric and typed perfectly. so no need to remove white space or get the value of columns.
    - No records have been deleted from the table.
  

  - DailySleep Table
    - There are no NULL values
    - There are 3 duplicate values. they have been removed
    - A constraint for the sleep_value column has been set to either be 1, 2 or 3.
    - device_id check to be exactly 10 characters long
    - minutes_in_bed check to be >=0 and <= 1440 (because you can’t spend negative minutes, or greater than a whole day in a single day)
    - minutes_asleep check to also be >=0 and <= minutes_in_bed.
    - Since all of the days start at 00:00:00, I’m just going to create a date column without the time, and discard the day_start column.
  

  - MinuteSteps Table
    - device_id check 10 characters long.
    - Table has no duplicate rows.
    - Table has not a single NULL cell.
    - minute_start will be split to 2 columns, date and time. both are set to NOT NULL.
    - minute_start column has been deleted.
    - Constraint to the steps column so that it can never be negative.
  

  - SecondHRV Table
    - Table does not have a single NULL cell.
    - LENGTH(device_id) = 10 constraint
    - HRV check >= 0
    - second_start will be split into date and time columns. both set to NOT NULL.
  

  - DailyActivity Table
    - Constraint LENGTH(device_id) = 10;
    - day_start column has been replaced with "date"
    - Table has no duplicates and not a single NULL cell.
    - 331/940 records do NOT add up active distances to total distance:
      - Corrected columns where the manual sum of active distances - total_sum >= -0.05km, so that the total_sum will be the sum of them.
      - Created a logged_distance column such that for columns where the manual sum of the active distances - total_sum < -0.05km, the difference goes into the logged_distance column.
    - Now, constrain the table such that
      - active_distance + logged_distance = total_distance
      - the sum of all active minutes SHOULD be = 1440. because a single day has 1440 minutes and sedentary minutes sitting down or sleeping. so if a person does not add up to 1440 minutes a day, it means he has taken his FitBit device off for a part of the day. create a new column that has the time where the user took off his fitbit.
    - Now, constrain the table such that active_minutes + not wearing = 1440
  

  - MinuteIntensity
    - Table does not have a single NULL cell.
    - No duplicate rows
    - The minute_start column will be divided into date and time, and they will be set to NOT NULL.
    - device_id constraint length = 10
    - intensity must have a set membership of either 0,1,2,3


  - MinuteMET
    - Table does not have a single NULL value.
    - Table has no duplicate records.
    - constraint to device_id is length = 10
    - minute_start will be divided to date and time columns.
    - met will be constrained to always be >= 1
    - There seems to be a problem here. some met values are 0. which violate the constraint. 7 rows that violate the constraint have been deleted. 
    - The numbers here do not make sense. the value of MET should be 1 if the person is sedentary while lying down or completely idle. and 16 if the user is an Olympic athlete who can see the finish line. most people in the table have 10, and some people have 100+!! The only logical case is that the numbers in the table are multiplied by 10. because most people have 10, when they should have 1. So all MET values were divided by 10.
    - Some values after division would be <1, and would violate the constraint. Only a single record violated that constraint, it has been deleted.


  - MinuteSleep
    - table has no NULL values
    - There are 543 duplicate records!
    - minute_start will be divided into date and time cols with NOT NULL
    - device_id length constrained to 10
    - sleep_value constrained to {1,2,3,}


  - MinuteCalories
    - Table has no NULL values, and no whole duplicate records.
    - constrained device_id length = 10
    - Split minute_start into date and time. both constrained to NOT NULL.
    - constrain calories to always be > 0

###3. Backup
- Before proceeding with the Analysis phase, the database has been backed up

---

#4-Analyze

- In this phase, 3 types of analysis will be done:
  1. Exploratory analysis:
      - Which categories/users/date/time have very low count compared to others, what am I going to do with them?
      - Summary of each column (aggregate: min, max, sum, count, unique count, percentiles and outliers)
      - Which categories/users have very low count compared to others, what am I going to do with them?
      - Investigate any anomalies/outliers found. 
      - do I need to divide the dataset into subsets? e.g. active vs. inactive? anomalies and outliers?
  2. Checking for correlations	
      - sleep vs calories or met or intensity
      - calories vs steps or intensity or met
  3. Answering the questions using data

1. Exploratory Analysis
- Numerical columns could be summarized with min/max/sum/NOT NULL count/percentiles and outliers. 
- while categorical (ordinal or nominal) are summarized as count, NOT NULL count, unique count, and the frequency of each category.  
- while date/time columns will get min/max and count NOT NULL.
  
SQL Syntax for summarizing a numerical column "col_name" in a table "table_name":
```{postgresql}
SELECT
    MIN(col_name),
    MAX(col_name),
    SUM(col_name),
    AVG(col_name),
    COUNT(*)
    PERCENTILE_DISC(0.01) WITHIN GROUP (ORDER BY col_name),
    PERCENTILE_DISC(0.05) WITHIN GROUP (ORDER BY col_name),
    PERCENTILE_DISC(0.1) WITHIN GROUP (ORDER BY col_name),
    PERCENTILE_DISC(0.25) WITHIN GROUP (ORDER BY col_name),
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY col_name),
    PERCENTILE_DISC(0.75) WITHIN GROUP (ORDER BY col_name),
    PERCENTILE_DISC(0.9) WITHIN GROUP (ORDER BY col_name),
    PERCENTILE_DISC(0.95) WITHIN GROUP (ORDER BY col_name),
    PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY col_name)
FROM table_name
WHERE
    col_name IS NOT NULL
```
SQL Syntax for summarizing a date/time column:
```{postgresql}
SELECT
    MIN(col_name),
    MAX(col_name)
    COUNT(*)
FROM table_name
WHERE
    col_name IS NOT NULL
```
SQL Syntax for summarizing a categorical column:
```{postgresql}
SELECT
    col_name,
    COUNT(*)
FROM table_name
GROUP BY
    col_name
```
- Strategy: join the minutes tables all into a "minute table". Since they all have 33 unique devices and almost the same number of rows, they will be INNER JOINed to get a full record (except the sleep table, it has a lot less records, so will be LEFT JOINed)  

| **column name** | **data type** | __sub type__ |
| :-----------: | :---------: | :--------: |
| device_id | categorical | nominal |
| date | date | N/A |
| time | time | N/A |
| datetime | timestamp | N/A |
| cadence | numerical | discrete |
| sleep | categorical | ordinal |
| calories | numerical | continuous |
| met | numerical | discrete |
| intensity | categorical | ordinal |

For the Minute Table, it will joined using the following syntax:
```{postgresql}
WITH Minute AS (
    SELECT *
    FROM MinuteCalories USING(device_id, date, time)
    INNER JOIN MinuteMET USING(device_id, date, time)
    INNER JOIN MinuteSteps USING(device_id, date, time)
    INNER JOIN USING(device_id, date, time)
    LEFT JOIN MinuteSleep USING(device_id, date, time)
)
--Other queries will then follow this temporarily CTE to query it.
```
<br>
1. Sleep  
    - From the exploratory results, It can be seen that the MinuteSleep table seems to only have records when the person is actually sleeping and when wearing the device. 10 device_id were missing from the MinuteSleep table. which indicates that a portion of the users 10/33, do not wear the device when sleeping.  
   recommendation: in the future, investigate why users do not sleep with the device, or add some features that encourage sleeping with it.  

    - There is no relation between sleep_value and met or calories or intensity or steps. However, it is strange that some people have a sleep value of 1 (asleep) and they have a very high MET or calorie count. people asleep walking < 20 steps per minute, This indicates the device incorrectly measures activity, or in an extreme scenario: people are sleep walking! Thus, There is no way to predict whether a person is asleep or not using the other metrics. the sleep table can only be used to predict what time users wake up and go to sleep. This is a limitation of the dataset, because the not all users have worn the device while sleeping.


2. Investigating correlations between MET, intensity, steps and calories
    - calories/min depend on the level of activity, weight, height, age, pregnancy and etc. and thus varies greatly from person to the other, so calories as a number is not good metric for this investigation. however, we maybe able to find the baseline calorie for each user (at MET=1, but MET IS the ratio ratio, so MET will be used instead)  
    - One thing should be for sure: at MET =1, steps should be =0, intensity =0 and calories = baseline. records where that is not satisfied (below <500 rows) have been removed from the analysis. 
    - The relation between met and percentage baseline is linear, but unit stepped with a few “intersections”. i.e. each MET range covers a range of percentage baseline calories. which seems to tell that MET is by definition, the baseline calories ratio. and that MET is approximated to be whole numbers by the device.  
    - The relation between cadence and baseline calories seems to be linear but is clustered heavily around the trendline. indicating that the percentage baseline of calories depends on factors other than just walking, but perhaps from user to user or other kinds of activity. i.e. the device users don't just walk or run.  
    - For intensity, there seems to be something quite strange. people having baseline calories of 10+ have an intensity of just 1! what should happen is that MET >3 should be at Intensity > 1! this maybe an indication that the device is measuring incorrectly.

3. Time to study the activity of people in a day for simplicity.
I will start with very active ones who have very_active_minutes > 0 and very_active_distance > 0

light ones:
-855 records are not zero. no time but no distance.
-in fact, 99th percentile is 1.86 km/h. thus I will let moderate be anything > 1.86km/h

moderate ones
-453 records have speed of > 1.86. with the 99th percentile at 4.2
-thus I will let active be anything >=4.2km/h

- Answer