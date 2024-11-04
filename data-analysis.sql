-- 1. SUMMARY STATISTICS

-- "followers_count" column
SELECT
  MIN(followers_count) AS min_follower,
  MAX(followers_count) AS max_follower,
  ROUND(AVG(followers_count), 2) AS avg_follower,
  APPROX_QUANTILES(followers_count, 2)[OFFSET(1)] AS median_follower
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "friends_count" column
SELECT
  MIN(friends_count) AS min_friend,
  MAX(friends_count) AS max_friend,
  ROUND(AVG(friends_count), 2) AS avg_friend,
  APPROX_QUANTILES(friends_count, 2)[OFFSET(1)] AS median_friend
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "favourites_count" column
SELECT
  MIN(favourites_count) AS min_favourite,
  MAX(favourites_count) AS max_favourite,
  ROUND(AVG(favourites_count), 2) AS avg_favourite,
  APPROX_QUANTILES(favourites_count, 2)[OFFSET(1)] AS median_favourite
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "statuses_count" column
SELECT
  MIN(statuses_count) AS min_status,
  MAX(statuses_count) AS max_status,
  ROUND(AVG(statuses_count), 2) AS avg_status,
  APPROX_QUANTILES(statuses_count, 2)[OFFSET(1)] AS median_status
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "listed_count" column
SELECT
  MIN(listed_count) AS min_listed,
  MAX(listed_count) AS max_listed,
  ROUND(AVG(listed_count), 2) AS avg_listed,
  APPROX_QUANTILES(listed_count, 2)[OFFSET(1)] AS median_listed
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "cred" (credibility score) column
SELECT
  MIN(cred) AS min_credibility_score,
  MAX(cred) AS max_credibility_score,
  ROUND(AVG(cred), 2) AS avg_credibility_score,
  APPROX_QUANTILES(cred, 2)[OFFSET(1)] AS median_credibility_score
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "normalize_influence" column
SELECT
  MIN(normalize_influence) AS min_influence_score,
  MAX(normalize_influence) AS max_influence_score,
  ROUND(AVG(normalize_influence), 2) AS avg_influence_score,
  APPROX_QUANTILES(normalize_influence, 2)[OFFSET(1)] AS median_influence_score
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "mentions" column
SELECT
  MIN(mentions) AS min_mention,
  MAX(mentions) AS max_mention,
  ROUND(AVG(mentions), 2) AS avg_mention,
  APPROX_QUANTILES(mentions, 2)[OFFSET(1)] AS median_mention
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "replies" column
SELECT
  MIN(replies) AS min_replies,
  MAX(replies) AS max_replies,
  ROUND(AVG(replies), 2) AS avg_replies,
  APPROX_QUANTILES(replies, 2)[OFFSET(1)] AS median_replies
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "retweets" column
SELECT
  MIN(retweets) AS min_retweets,
  MAX(retweets) AS max_retweets,
  ROUND(AVG(retweets), 2) AS avg_retweets,
  APPROX_QUANTILES(retweets, 2)[OFFSET(1)] AS median_retweets
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "hashtags" column
SELECT
  MIN(hashtags) AS min_hashtags,
  MAX(hashtags) AS max_hashtags,
  ROUND(AVG(hashtags), 2) AS avg_hashtags,
  APPROX_QUANTILES(hashtags, 2)[OFFSET(1)] AS median_hashtags
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "quotes" column
SELECT
  MIN(quotes) AS min_quotes,
  MAX(quotes) AS max_quotes,
  ROUND(AVG(quotes), 2) AS avg_quotes,
  APPROX_QUANTILES(quotes, 2)[OFFSET(1)] AS median_quotes
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "unique_count" column
SELECT
  MIN(unique_count) AS min_unique_word,
  MAX(unique_count) AS max_unique_word,
  ROUND(AVG(unique_count), 2) AS avg_unique_word,
  APPROX_QUANTILES(unique_count, 2)[OFFSET(1)] AS median_unique_word
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "total_count" column
SELECT
  MIN(total_count) AS min_total_word,
  MAX(total_count) AS max_total_word,
  ROUND(AVG(total_count), 2) AS avg_total_word,
  APPROX_QUANTILES(total_count, 2)[OFFSET(1)] AS median_total_word
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "Word_count" column
SELECT
  MIN(Word_count) AS min_Word_count,
  MAX(Word_count) AS max_Word_count,
  ROUND(AVG(Word_count), 2) AS avg_Word_count,
  APPROX_QUANTILES(Word_count, 2)[OFFSET(1)] AS median_Word_count
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "present_verbs" column
SELECT
  MIN(present_verbs) AS min_present_word,
  MAX(present_verbs) AS max_present_word,
  ROUND(AVG(present_verbs), 2) AS avg_present_word,
  APPROX_QUANTILES(present_verbs, 2)[OFFSET(1)] AS median_present_word
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "past_verbs" column
SELECT
  MIN(past_verbs) AS min_past_word,
  MAX(past_verbs) AS max_past_word,
  ROUND(AVG(past_verbs), 2) AS avg_past_word,
  APPROX_QUANTILES(past_verbs, 2)[OFFSET(1)] AS median_past_word
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "adjectives" column
SELECT
  MIN(adjectives) AS min_adjectives,
  MAX(adjectives) AS max_adjectives,
  ROUND(AVG(adjectives), 2) AS avg_adjectives,
  APPROX_QUANTILES(adjectives, 2)[OFFSET(1)] AS median_adjectives
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "adverbs" column
SELECT
  MIN(adverbs) AS min_adverbs,
  MAX(adverbs) AS max_adverbs,
  ROUND(AVG(adverbs), 2) AS avg_adverbs,
  APPROX_QUANTILES(adverbs, 2)[OFFSET(1)] AS median_adverbs
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "pronouns" column
SELECT
  MIN(pronouns) AS min_pronouns,
  MAX(pronouns) AS max_pronouns,
  ROUND(AVG(pronouns), 2) AS avg_pronouns,
  APPROX_QUANTILES(pronouns, 2)[OFFSET(1)] AS median_pronouns
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "conjunctions" column
SELECT
  MIN(conjunctions) AS min_conjunctions,
  MAX(conjunctions) AS max_conjunctions,
  ROUND(AVG(conjunctions), 2) AS avg_conjunctions,
  APPROX_QUANTILES(conjunctions, 2)[OFFSET(1)] AS median_conjunctions
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "dots" column
SELECT
  MIN(dots) AS min_dots,
  MAX(dots) AS max_dots,
  ROUND(AVG(dots), 2) AS avg_dots,
  APPROX_QUANTILES(dots, 2)[OFFSET(1)] AS median_dots
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "exclamation" column
SELECT
  MIN(exclamation) AS min_exclamation,
  MAX(exclamation) AS max_exclamation,
  ROUND(AVG(exclamation), 2) AS avg_exclamation,
  APPROX_QUANTILES(exclamation, 2)[OFFSET(1)] AS median_exclamation
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "questions" column
SELECT
  MIN(questions) AS min_questions,
  MAX(questions) AS max_questions,
  ROUND(AVG(questions), 2) AS avg_questions,
  APPROX_QUANTILES(questions, 2)[OFFSET(1)] AS median_questions
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "ampersand" column
SELECT
  MIN(ampersand) AS min_ampersand,
  MAX(ampersand) AS max_ampersand,
  ROUND(AVG(ampersand), 2) AS avg_ampersand,
  APPROX_QUANTILES(ampersand, 2)[OFFSET(1)] AS median_ampersand
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "capitals" column
SELECT
  MIN(capitals) AS min_capitals,
  MAX(capitals) AS max_capitals,
  ROUND(AVG(capitals), 2) AS avg_capitals,
  APPROX_QUANTILES(capitals, 2)[OFFSET(1)] AS median_capitals
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "digits" column
SELECT
  MIN(digits) AS min_digits,
  MAX(digits) AS max_digits,
  ROUND(AVG(digits), 2) AS avg_digits,
  APPROX_QUANTILES(digits, 2)[OFFSET(1)] AS median_digits
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "long_word_freq" column
SELECT
  MIN(long_word_freq) AS min_long_word_freq,
  MAX(long_word_freq) AS max_long_word_freq,
  ROUND(AVG(long_word_freq), 2) AS avg_long_word_freq,
  APPROX_QUANTILES(long_word_freq, 2)[OFFSET(1)] AS median_long_word_freq
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- "short_word_freq" column
SELECT
  MIN(short_word_freq) AS min_short_word_freq,
  MAX(short_word_freq) AS max_short_word_freq,
  ROUND(AVG(short_word_freq), 2) AS avg_short_word_freq,
  APPROX_QUANTILES(short_word_freq, 2)[OFFSET(1)] AS median_short_word_freq
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`;

-- 2. ENGAGEMENT METRICS ANALYSIS

-- Count tweets and group by "total_count" column
SELECT
  total_count,
  COUNT(tweet)
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`
GROUP BY total_count;

-- Aggregated engagement metrics split by true/false labels
SELECT
  majority_target,
  SUM(followers_count) AS total_followers,
  SUM(friends_count) AS total_friends,
  SUM(favourites_count) AS total_favourites,
  SUM(statuses_count) AS total_statuses,
  SUM(listed_count) AS total_listed
FROM
  `data-analysis-portfolio-407018.Truth_Seeker_Model_Dataset.Truth_Seeker_Dataset_ALL`
GROUP BY
  majority_target;






























