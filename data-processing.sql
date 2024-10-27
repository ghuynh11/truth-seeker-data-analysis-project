-- Adjust column names by creating a new table based on TruthSeeker dataset
CREATE OR REPLACE TABLE `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new` AS
SELECT 
  int64_field_0 AS id,
  string_field_1 AS author,
  string_field_2 AS statement,
  double_field_3 AS target,
  double_field_4 AS BinaryNumTarget,
  string_field_5 AS manual_keywords,
  string_field_6 AS tweet,
  string_field_7 AS _5_label_majority_answer,
  string_field_8 AS _3_label_majority_answer,
  string_field_9 AS timestamps
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps`;

-- Convert data type of "timestamp" column from string to datatime format
-- Convert data type of "target" column from float to boolean format
CREATE OR REPLACE TABLE `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new` AS
SELECT 
  id,
  author,
  statement,
  CASE 
    WHEN target = 1 THEN TRUE
    WHEN target = 0 THEN FALSE
  END AS target,
  BinaryNumTarget,
  manual_keywords,
  tweet,
  _5_label_majority_answer,
  _3_label_majority_answer,
  PARSE_DATETIME('%a %b %d %H:%M:%S +0000 %Y', timestamps) AS timestamps
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`
WHERE timestamps IS NOT NULL AND timestamps != 'nan';

-- Count unique IDs of the tweets
SELECT COUNT(DISTINCT id)
FROM data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new

-- Check for null values in each column
SELECT 
  COUNTIF(id IS NULL) AS null_count_id,
  COUNTIF(author IS NULL) AS null_count_author,
  COUNTIF(statement IS NULL) AS null_count_statement,
  COUNTIF(target IS NULL) AS null_count_target,
  COUNTIF(BinaryNumTarget IS NULL) AS null_count_BinaryNumTarget,
  COUNTIF(manual_keywords IS NULL) AS null_count_manual_keywords,
  COUNTIF(tweet IS NULL) AS null_count_tweet,
  COUNTIF(_5_label_majority_answer IS NULL) AS null_count_5_label_answer,
  COUNTIF(_3_label_majority_answer IS NULL) AS null_count_3_label_answer,
  COUNTIF(timestamps IS NULL) AS null_count_timestamps
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`;

-- Count the "nan" value in the columns which have the string data type
SELECT 
  COUNT(*) AS nan_count_author
FROM data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new
WHERE 
  author = 'nan';

SELECT 
  COUNT(*) AS nan_count_statement
FROM data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new
WHERE 
  statement = 'nan';

SELECT 
  COUNT(*) AS nan_count_manual_keywords
FROM data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new
WHERE 
  manual_keywords = 'nan';

SELECT 
  COUNT(*) AS nan_count_tweet
FROM data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new
WHERE 
  tweet = 'nan';

SELECT 
  COUNT(*) AS nan_count_5_label
FROM data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new
WHERE 
  _5_label_majority_answer = 'nan';

SELECT 
  COUNT(*) AS nan_count_3_label
FROM data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new
WHERE 
  _3_label_majority_answer = 'nan';

SELECT 
  COUNT(*) AS nan_count_timestamps
FROM data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new
WHERE 
  timestamps = 'nan';
-- Result: the "_5_label_majority_answer", "_3_label_majority_answer" and "timestamps" columns have 4 "nan" values each. The "tweet" column has 1 "nan" value.

-- Count unique values from "author" column
SELECT 
  author,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`
GROUP BY author
HAVING COUNT(*) > 1;
-- Result: There're 158 authors in total

-- Count unique values from "statement" column
SELECT 
  statement,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`
GROUP BY statement
HAVING COUNT(*) > 1;
-- Result: There're multiple tweets with the same statement. In total, 1027 unique statements are recorded.

-- Count unique values from "manual_keywords" column
SELECT 
  manual_keywords,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`
GROUP BY manual_keywords
HAVING COUNT(*) > 1;
-- Result: 1025 unique set of keywords are recorded. Multiple tweets also have the same set of keywords derived directly from its statement.

-- Count unique values from "tweet" column
SELECT 
  tweet,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`
GROUP BY tweet
HAVING COUNT(*) > 1;
-- Result: Upon 134,198 tweets in the dataset, there're 23 tweets which are duplicated. The rest of the tweets are unique.

-- Count unique values from "target" and "BinaryNumTarget" columns
SELECT 
  target,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`
GROUP BY target
HAVING COUNT(*) > 1;

SELECT 
  BinaryNumTarget,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`
GROUP BY BinaryNumTarget
HAVING COUNT(*) > 1;
-- Result: There're 68,927 "true" (1.0) values and 65,267 "false" (0.0) values

-- Count unique values from "_5_label_majority_answer" column
SELECT 
  _5_label_majority_answer,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`
GROUP BY _5_label_majority_answer
HAVING COUNT(*) > 1;

-- TO CHECK
-- Aggregate and count records in the TruthSeeker dataset by the "_5_label_majority_answer" and "target" columns
SELECT 
  _5_label_majority_answer,
  target,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`
GROUP BY _5_label_majority_answer, target;

-- Aggregate and count records in the TruthSeeker dataset by the "_3_label_majority_answer" and "target" columns
SELECT 
  _3_label_majority_answer,
  target,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new`
GROUP BY _3_label_majority_answer, target;














