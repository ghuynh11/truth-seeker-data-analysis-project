# Truth vs. Virality: A Data-Driven Dive into the Spread of Misinformation
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

[LINK](https://docs.google.com/spreadsheets/d/1gPY1wCCMnUUwVLHc2AAIKY0yB3e97cavKlU1nRhw0Bw/edit?gid=0#gid=0) to Summary Statistics table.

Based on the objectives of this project, I would choose the following columns of the dataset for analysis:

- **Meta-data features** (features about the users on Twitter): followers_count, friends_count, favourites_count, statuses_count, listed_count, cred (credibility score), normalize_influencen (influence score), mentions, replies, retweets, hashtags.
- **Lexical features** (linguistic and structural features of the Tweets): unique_count, word_count, present_verbs, past_verbs, adjectives, adverbs, pronouns, conjunctions, dots, exclamation, questions, ampersand, capitals, digits, long_word_freq, short_word_freq.

**General findings about meta-data features:**
- Skewed distributions of the following features: followers_count, friends_count, favourites_count, and statuses_count. A few users have disproportionately high values. This skew affects the average values of these features, making medians more representative of the Twitter users as they are less sensitive to outliers.
- Engagement variability: the replies and retweets features all have median value of 0. This shows that while engagement is low for many tweets, a subset receives very high engagement (e.g. max retweets 126,062), possibly indicating a small amount viral or highly discussed content in the TruthSeeker dataset.
- Influence and Credibility: With low average values in credibility score and influence score, most users in the dataset appear to have modest credibility and influence. The maximum credibility score is 1 and maximum influence score is 0.2. This could indicate a diverse set of users, including both prominent and ordinary users on Twitter.
- Word count is generally within the range of short-form content which is typical on Twitter, with a few longer posts (likely from users with Twitter Blue or now called X Premium).


















