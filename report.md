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

