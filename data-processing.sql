# Adjust column names by creating a new table based on TruthSeeker dataset
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
