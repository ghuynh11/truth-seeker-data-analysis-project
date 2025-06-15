# Truth vs. Virality: A Data-Driven Approach to the Spread of Misinformation
## Using SQL, Google Sheet and Tableau

In today’s hyperconnected world, social media isn’t just a place to scroll and entertain, it’s where opinions are formed, narratives are shaped, and influence is spread. As someone who grew up with the rise of social media, I’ve come to recognize how easily misinformation can blur the line between fact and fiction.

And that line matters, because we live in a world where viral content spreads faster than verified facts, no matter if the content is true or not.

Why this matters: The consequences of misinformation are real. From fueling public panic during pandamic to distorting facts around environmental, social and political issues, misinformation can manipulate behavior at a massive scale.

So how can we detect it early? What differentiates a factual piece of information from a misleading one in the eyes an average user? These are some of the questions that drive this project.

In this data analysis project, I dive into the TruthSeeker dataset, which contains over 100,000 labelled and reviewed social media posts. By combining exploratory data analysis and sentiment tracking, this project aims to **understand the factors behind the spread of misinformation** and **identify patterns that differentiate truthful content from misinformation**.

Understanding how misinformation spreads is not just an academic pursuit, it’s a responsibility we share in today’s digitalized world. This project combines my technical skills with the critical digital challenge that I care about. The insights gained here could be potential to inform more mindful content consumption and sharing.

## Methodology

The following methodology with 6 steps are implemented for this project:

**1. Ask:** Define the (business) problem or objective by understanding the key questions that need to be answered and identifying stakeholders’ needs.

**2. Prepare:** Gather and evaluate the relevant data, ensuring it’s accessible, complete, and appropriate for the analysis by cleaning and organizing the datasets.

**3. Process:** Clean and transform the raw data, checking for errors, inconsistencies, or missing values to ensure that it is reliable and ready for analysis.

**4. Analyse:** Apply analytical techniques to explore the data, identify patterns, trends, and relationships, and extract actionable insights relevant to the business problem.

**5. Share:** Present findings through reports, visualizations, or dashboards in a clear, understandable and engaging way to communicate key insights to stakeholders.

**6. Act:** Use the insights gained to inform decision-making, implement solutions, or recommend strategies that address the original business question or problem.

## STEP 1: Ask
**Topic:** Misinformation on social media

**Project overview and objectives:** Analyze the TruthSeeker dataset, which contains over 100,000 labelled and reviewed posts on Twitter (now called X), to understand the factors behind the spread of misinformation and identify patterns that differentiate truthful content from misinformation on social media. To achieve this, the project is structured around two key objectives:
- Sentiment Analysis: Analyze the emotional tone (positive, negative, neutral) expressed in the Tweets and explore how sentiment correlates with the misinformation.
- Exploratory Data Analysis (EDA): Perform an in-depth analysis of the dataset to uncover key features (post length, number of likes, shares, etc.), patterns, and insights about post types (truth vs. falsehood), user behavior, and content trends.

## STEP 2: Prepare
**Dataset:** [Truth Seeker 2023 - The Largest Social Media Ground-Truth Dataset](https://www.unb.ca/cic/datasets/truthseeker-2023.html) from University of New Brunswick

- The creation of the TruthSeeker dataset begins with a combination of Real and Fake news crawled from the PolitiFact website - a fact-checking website that evaluates the truthfulness of statements made by politicians, public figures, and organizations, primarily in the United States.
- From this data, keywords relating to each piece of text are generated. These generated keywords are then used to search Twitter for Tweets which are related to these keywords.
- All the collected Tweets are then verified with a three-factor active learning verification method which involves utilizing 456 unique highly skilled individuals in Amazon Mechanical Turk - a crowdsourcing platform created by Amazon that enables businesses and individuals to outsource small tasks, known as Human Intelligence Tasks (HITs), to a large, distributed workforce.
- Each Tweet is labeled three times by three different Turkers. Additional verification is then done by the author's institution. Machine learning models are also trained and tested automatically on this labeled data to evaluate how effective the labeling process is.

→ This multi-layered approach increases confidence in the accuracy of the labeled data.


**The overall pipeline of the TruthSeeker dataset generation:**
<img width="1193" alt="image" src="https://github.com/user-attachments/assets/6fdb0158-9e4b-49ab-8bf9-f37d00f67cc9" />
*Source: 
Study “TruthSeeker: The Largest Social Media Ground-Truth Dataset for Real/Fake Content” by Sajjad Dadkhah Member, IEEE, Xichen Zhang, Alexander Gerald Weismann, Amir Firouzi, Ali A. Ghorbani Senior Member, IEEE.*

**Explaination of the evaluation process:**
Each Tweet in the TruthSeeker dataset was evaluated by multiple annotators to assess how closely it alligns with the verified statement. The following label systems are used:
- 5_label_majority_answer: Options included Agree, Mostly Agree, Disagree, Mostly Disagree, and Unrelated. This approach shows how information from the Tweets relates to the truth.
- 3_label_majority_answer: A simplified version with Agree, Disagree, and Unrelated as the only choices.
→ This classification provides more nuanced insights compared to a simple binary (true/false) system, allowing for a finer-grained analysis of misinformation. Meaning, it captures the complexity of real-world information, rather than reducing everything to just right or wrong.

Why this matters:
In many social media posts, content is not purely factual or entirely false. People mix facts with opinions, or take facts out of context, which creates ambiguity. A binary system (true vs. false) would oversimplify these cases.
Instead, using labels like “Mostly Agree,” “Mostly Disagree,” or “Unrelated” helps us:
- Understand how close a post is to the truth
- Detect subtle forms of misinformation

**Is the data ROCCC?**
- Reliable: yes, considering the thorough ground truth verification and fact-checking process
- Original: yes
- Comprehensive: yes
- Current: yes
- Cited: This dataset is the result of University of New Brunswick’s project. Their goal is to create the largest ground truth fake news analysis dataset for real and fake news content in relation to social media posts.

**Terminology and metadata:**
- **Statement:** Headline of a news article on PolitiFact website.
- **Target (True or False):** the ground truth value of statement. This was generated based on reliable source from [politifact.com](https://www.politifact.com/).
- **BinaryNumTarget:** Binary representation of the target value (1 = True / 0 = False)
- **Tweet:** Twitter (now called X) posts
- **majority_target:** shows whether a post is true or false based on what the human reviewers (annotators) decided. It is the result of the label systems mentioned above.
  - If most reviewers said the post agrees with the truth → majority_target = True
  - If most said it disagrees or is misleading → majority_target = False
  - If they couldn’t agree → it may be marked as No Majority
This helps simplify the data for analysis by giving each post a clear true/false label.

- **statuses_count:** represents the total number of Tweets a user has posted on Twitter. It includes all Tweets, Retweets, and Replies that a user has made up to the time of data collection. This count is an indicator of the user’s activity level on Twitter.
- **favorites_count:** the total number of likes a user has received across all their Tweets.
- **unique_count:** This column represents the number of unique, complex words in each tweet.
- **total_count:** This column represents the total number of words in each tweet. It is a straightforward word count that indicates the length of the tweet.
- **conjunctions:** words that connect phrases, clauses, or sentences to create more complex sentence structures.
- **cred (credibility score):** designed to assess a user’s perceived trustworthiness on social media. This score based on factors such as activity, engagement, etc.
- **normalize_influence (score):** represents a normalized influence score for each user. This score is calculated to reflect the user’s influence on social media, taking into account factors like follower count, engagement metrics (likes, retweets, replies), etc. The influence scores are adjusted so they are on the same scale across all users (normalized), making them easier to compare fairly, regardless of raw numbers like follower count or total likes.

**Initial examination of the dataset:**
- The data is structured in long format.
- There is a specific ID for each Tweet, along with related information such as author, keywords, verified status of the statement, etc.
- The Tweets are originated from the period 2008 - 2022.
- In total there are 134,194 Tweets in the “Truth_Seeker_Dataset_with_Timestamps” dataset. → 68,973 TRUE Tweets and 65,211 FALSE Tweets
- Multiple Tweets have the same statement which is documented in the “statement” column. This statement serves as the central theme or “ground-truth statement,” against which each Tweet’s truthfulness is assessed.
- Despite the high credibility of the dataset, it still contains 8,464 Tweets with 0 total word counts (data extracted from the "total_count" column). This portion accounts for approx. 6.3% of the dataset.
- Upon further examination, I noticed that the **“word_count”** column contains more correct data in relation to the tweet. The average word count of the tweets is 35. There is only one tweet with zero word count.

## STEP 3: Process

**Tool:** SQL

**Datasets used for the analysis:**
- Truth_Seeker_Dataset_with_Timestamps
- Features_For_Traditional_ML_Techniques

**Data format adjustment before uploading to SQL:**
Upon uploading the datasets into SQL Big Query, there were many errors and the job couldn’t be completed.
The dataset in CSV format has lots of blank lines which is probably the reason for the errors.
I wrote the following Python code to delete the blank lines in the CSV file “Truth_Seeker_Dataset_with_Timestamps” and “Features_For_Traditional_ML_Techniques”: LINK to the Python code.

**Documentation of further data cleaning in SQL BigQuery:** Detail SQL query in this [LINK](https://github.com/ghuynh11/truth-seeker-data-analysis-project/blob/main/data-processing.sql).

## STEP 4: Analyze 

### 1. Summary Statistics:

**Tool:** Spreadsheet

[LINK](https://docs.google.com/spreadsheets/d/1gPY1wCCMnUUwVLHc2AAIKY0yB3e97cavKlU1nRhw0Bw/edit?gid=0#gid=0) to Summary Statistics table.

Based on the objectives of this project, I would choose the following columns of the dataset for analysis:

- **Meta-data features** (features about the users on Twitter): followers_count, friends_count, favourites_count, statuses_count, listed_count, cred (credibility score), normalize_influencen (influence score), mentions, replies, retweets, hashtags.
- **Lexical features** (linguistic and structural features of the Tweets): unique_count, word_count, present_verbs, past_verbs, adjectives, adverbs, pronouns, conjunctions, dots, exclamation, questions, ampersand, capitals, digits, long_word_freq, short_word_freq.

**General findings about meta-data features:**
- Skewed distributions of the following features: followers_count, friends_count, favourites_count, and statuses_count. A few users have disproportionately high values. This skew affects the average values of these features, making medians more representative of the Twitter users as they are less sensitive to outliers.
- Engagement variability: the replies and retweets features all have median value of 0. This shows that while engagement is low for many tweets, a subset receives very high engagement (e.g. max retweets 126,062), possibly indicating a small amount viral or highly discussed content in the TruthSeeker dataset.
- Influence and Credibility of the users: With low average values in credibility score and influence score, most users in the dataset appear to have modest credibility and influence. The maximum credibility score is 1 and maximum influence score is 0.2. This could indicate a diverse set of users, including both prominent and ordinary users on Twitter.
- Word count is generally within the range of short-form content which is typical on Twitter, with a few longer posts (likely from users with Twitter Blue or now called X Premium).

**General findings about lexical features:**
- Text simplicity: The tweets from the dataset tends to be formulated in short, direct language, with lower average counts of conjunctions and long words. The short word frequency is high: a tweet with approx. 35 words has about 21 short words on average.
- Generally low frequency of question marks and exclamations.
- Capitals and digits (numbers) appear to be used often in the tweets of the dataset. On average, a tweet with approx. 35 words has about 13 capitals and 4 numbers.

### 2. Engagement Metrics Analysis:

**Tool:** SQL, Tableau


**Features about the users**

<img width="400" alt="image" src="https://github.com/user-attachments/assets/39879bb4-264c-4e9d-8866-dc828cd248a9" />

- The bars representing true Tweets are larger than the the other bars across most of the features about the users.
- Truthful content is associated with users who genrally have more followers, more friends, and more Tweets.


**Engagement features**

<img width="400" alt="image" src="https://github.com/user-attachments/assets/4e683915-0031-4dac-96b3-84a33be97bcf" />

- The bars representing false Tweets have higher values for most engagement features, especially in retweets and replies, indicating that false Tweets are shared more frequently than truthful ones.
→ False content spreads wider, highlighting the viral nature of misinformation, as well as being more controversial and generating more discussions.


**Textual features**

<img width="400" alt="image" src="https://github.com/user-attachments/assets/cc17608d-5a70-49b9-8f78-d27e16bdce25" />

- Higher use of adjectives in true Tweets
- Higher use of adverbs, conjunctions, past verbs and present verbs and pronouns in false Tweets

<img width="400" alt="image" src="https://github.com/user-attachments/assets/9baa3798-ce74-4bd9-ab09-fbb13822f4c0" />

- False Tweets have more capitalized words, more exclamations and question marks than true Tweets, indicating a tendency toward emphasis, emotional and provocative language, which is common in misinformation.
- True Tweets have more digits than false Tweets. This could suggest that truthful Tweets are more likely to have quantitative data, such as statistics or factual figures.

### 3. Temporal Analysis:

**Tool:** SQL, Tableau

<img width="400" alt="image" src="https://github.com/user-attachments/assets/4ca5b974-13bc-4cde-87c4-3da94e53d8f1" />

- There was a sharp rise in the volume of false Tweets around 2020, significantly outpacing the volume of true Tweets. This could be associated with major events like the COVID-19 pandemic or political events, which are often accompanied by the spread of misinformation. → This suggests that global crisis results in uncertainty that drives the consumption of unverified content.
- From 2020 to 2022, false Tweets consistently had a higher volume than true Tweets.
- Before 2020, true Tweets showed occasional spikes (e.g., around 2013 and 2017). These might correspond to specific political events like the Euromaidan Protests (Ukraine), U.S. Presidential Election, Brexit and social movements like #BlackLivesMatter, #MeToo.
- True Tweets tend to have steadier growth in general, possibly due to slower spread or reliance on verified information.

### 4. Sentiment Analysis:

**Tool:** SQL, Python, Tableau

The following steps are taken for the sentiment analysis of the Tweets:

- Export dataset from SQL for sentiment analysis in Python.
- Use the The VaderSentiment library - a sentiment analysis tool that is specifically designed for analyzing social media texts and short, informal content like Tweets, Reviews, and Comments.
- The output includes the compound score ranging from -1 (most negative) to +1 (most positive). In order to better visualize the result, I used 3 categories for the sentiment of the Tweets: positive, negative and neutral.
- The Python script can be viewed in this LINK.

<img width="400" alt="image" src="https://github.com/user-attachments/assets/f52ed5ba-2f80-4b3f-8bc2-1b773c265fb8" />

- False Tweets show a significantly higher negative sentiment count compared to true Tweets. → Misinformation tends to evoke more negative emotions.
- True Tweets have lower level of both positive and negative sentiments. → True content is less emotionally polarizing and relies on a more factual, neutral tone.


**Temporal and Sentiment Trends**

<img width="400" alt="image" src="https://github.com/user-attachments/assets/fbd62a1c-5340-4b49-aa9a-ec10f5457dcd" />

**Sharp increase in the number of Tweets after 2019**

- From 2020 onward, there is a significant spike in the number of Tweets across all sentiment categories.
- This increase suggests that major global events such as the COVID-19 pandemic, political events, or social movements led to a surge in discussions on social media.

**Tweets with negative sentiment dominates after 2020**

- The red line in the graph above, representing negative sentiment, consistently remains higher than positive and neutral Tweets after 2020.
- This might be due to the online discussions during this period. Because of the major global events, these discussions were largely driven by negative emotions (e.g., fear, frustration, or anger). The reasons for that could be:
  - Misinformation about controversial topics
  - Public reactions to crises, policies, or social issues

**Tweets with positive sentiment also increases, but less than negative**

- The blue line, representing positive sentiment, follows a similar upward trend but remains below the red line (negative sentiment).
- This could indicate that while some events generated optimism and support (e.g., vaccine rollouts, political victories), the general tone of discussions leaned more in the negative direction.

## STEP 5: Share conclusions

This analysis of the TruthSeeker dataset shows clear patterns in how misinformation and truthful content differ in terms of user behavior, language use, emotional tone, and temporal trends.

**Tweet users and content characteristics**

- True Tweets are more often posted by users with more followers and higher activity levels, suggesting that credibility is associated with more established accounts.
- In contrast, false Tweets, though often from users with less followers, receive more engagement, particularly in retweets and replies, highlighting the viral nature of misinformation.

**Linguistic and structural features**

- False Tweets show a higher use of provocative language, including a high amount of exclamations, capital letters, and question marks.
- True Tweets, on the other hand, have more neutral and descriptive language, with a higher frequency of adjectives and numeric data.

**Sentiment and temporal trends**

- Tweets sentiment has become more polarized over time, especially post-2020.
- Since 2020, false Tweets have consistently outpaced true Tweets in volume, especially during periods of global crisis (e.g., the COVID-19 pandemic, political unrest), suggesting that misinformation thrives during uncertain period.

**Based on the insights above, it is clear that emotional misinformation spreads faster than facts nowadays in the digitalized world. Therefore, it is crucial to promote social media literacy in order to be more critical when receiving information from these platforms. Truth may be "quieter", but it is our shared responsibility to make it "louder".**
