-- 1. PROCESS: "Truth_Seeker_Dataset_with_Timestamps" Dataset

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

-- 2. MERGE TWO DATASETS: "Truth_Seeker_Dataset_with_Timestamps" and "Features_For_Traditional_ML_Techniques"
CREATE OR REPLACE TABLE `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL` AS
SELECT
  ts.*,
  ft.id AS ft_id,  -- Keep unique ID from ft to avoid conflicts, if needed
  ft.* EXCEPT(id, statement, BinaryNumTarget,tweet)  -- Include all other columns from ft except id, statement, BinaryNumTarget,tweet
FROM 
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Data_TimeStamps_new` AS ts
INNER JOIN 
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Features_Truth_Seeker_Dataset` AS ft
ON 
    ts.id = ft.id;
-- The new merged dataset is named "Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL"

-- 3. PROCESS: "Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL" Dataset

-- Check for null values in the columns which are relevant for the analysis
SELECT 
  COUNTIF(majority_target IS NULL) AS majority_target_null_count,
  COUNTIF(followers_count IS NULL) AS followers_null_count,
  COUNTIF(friends_count IS NULL) AS friends_null_count,
  COUNTIF(favourites_count IS NULL) AS favourites_null_count,
  COUNTIF(statuses_count IS NULL) AS statuses_null_count,
  COUNTIF(listed_count IS NULL) AS listed_null_count,
  COUNTIF(BotScoreBinary IS NULL) AS BotScoreBinary_null_count,
  COUNTIF(cred IS NULL) AS cred_null_count,
  COUNTIF(normalize_influence IS NULL) AS normalize_influence_null_count,
  COUNTIF(mentions IS NULL) AS mentions_null_count,
  COUNTIF(replies IS NULL) AS replies_null_count,
  COUNTIF(retweets IS NULL) AS retweets_null_count,
  COUNTIF(hashtags IS NULL) AS hashtags_null_count,
  COUNTIF(quotes IS NULL) AS quotes_null_count,
  COUNTIF(unique_count IS NULL) AS unique_null_count,
  COUNTIF(total_count IS NULL) AS total_null_count,
  COUNTIF(present_verbs IS NULL) AS present_verbs_null_count,
  COUNTIF(past_verbs IS NULL) AS past_verbs_null_count,
  COUNTIF(adjectives IS NULL) AS adjectives_null_count,
  COUNTIF(adverbs IS NULL) AS adverbs_null_count,
  COUNTIF(pronouns IS NULL) AS pronouns_null_count,
  COUNTIF(conjunctions IS NULL) AS conjunctions_null_count,
  COUNTIF(dots IS NULL) AS dots_null_count,
  COUNTIF(exclamation IS NULL) AS exclamation_null_count,
  COUNTIF(questions IS NULL) AS questions_null_count,
  COUNTIF(ampersand IS NULL) AS ampersand_null_count,
  COUNTIF(capitals IS NULL) AS capitals_null_count,
  COUNTIF(digits IS NULL) AS digits_null_count,
  COUNTIF(long_word_freq IS NULL) AS long_word_freq_null_count,
  COUNTIF(short_word_freq IS NULL) AS short_word_freq_null_count
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;
-- Result: There is no null value in all of the columns listed above.

-- Round floating values in "cred" (credibility score) column and check for outliers
SELECT 
  cred,
  ROUND(cred, 2) AS rounded_cred
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;
-- Result: Max value = 1.0; Min value = 0.0

-- Round floating values in "normalize_influence" (score) column and check for outliers
SELECT 
  normalize_influence,
  ROUND(normalize_influence, 2) AS rounded_normalize_influence
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;
-- Result: Max value = 0.21; Min value = 0.0

-- Count unique values from "majority_target" column
SELECT 
  majority_target,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`
GROUP BY majority_target
HAVING COUNT(*) > 1;
-- Result: There're 68,973 "true" (1.0) values and 65,211 "false" (0.0) values.

-- Count unique values from "BotScoreBinary" column
SELECT 
  BotScoreBinary,
  COUNT(*)
FROM `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`
GROUP BY BotScoreBinary;
-- Result: There're 129,842 "0.0" values, indicating these are the counts where the users are not considered NOT a bot. And there're 4,342 "1.0" values representing the counts where the users are considered a bot.

-- Count tweets which have 0 total word count
SELECT
  id,
  statement,
  tweet,
  majority_target,
  quotes,
  retweets,
  total_count,
  present_verbs,
  capitals
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`
WHERE total_count = 0;
-- Result: There're 8,464 tweets with 0 total word counts. This portion accounts for approx. 6.3% of the dataset.















