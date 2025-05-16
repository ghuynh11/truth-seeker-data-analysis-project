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

**Explaination of the evaluation process:**
Each Tweet in the TruthSeeker dataset was evaluated was evaluated to assess how closely it alligns with the verified statement. The following label systems are used:
- 5_label_majority_answer: Options included Agree, Mostly Agree, Disagree, Mostly Disagree, and Unrelated. This approach shows how information from the Tweets relates to the truth.
- 3_label_majority_answer: A simplified version with Agree, Disagree, and Unrelated as the only choices.
→ This classification provides more nuanced insights compared to a simple binary (true/false) system, allowing for a finer-grained analysis of misinformation. Meaning, it captures the complexity of real-world information, rather than reducing everything to just right or wrong.
Why this matters:
In many social media posts, content is not purely factual or entirely false. People mix facts with opinions, or take facts out of context, which creates ambiguity. A binary system (true vs. false) would oversimplify these cases.
Instead, using labels like “Mostly Agree,” “Mostly Disagree,” or “Unrelated” helps us:
- Understand how close a post is to the truth
- Detect subtle forms of misinformation

- **majority_target:** indicates whether the tweet conveys either true information or false information. This is determined through the crowdsourcing process mentioned above:
1 (or TRUE): The tweet is considered to convey true information.
0 (or FALSE): The tweet is considered to convey false information.
statuses_count: represents the total number of tweets (or “statuses”) a user has posted on Twitter. It includes all tweets, retweets, and replies that a user has made up to the time of data collection. This count is an indicator of the user’s activity level on Twitter.
favorites_count: the total number of likes (or favorites) a user has received across all their tweets.
listed_count: This column indicates the number of public Twitter lists that include the user. Being listed means other Twitter users have added this account to one or more curated lists (e.g., lists for specific interests or groups), which may indicate that the user is seen as a valuable or influential source within certain topics.
Usage
statuses_count can provide insights into user engagement and activity, as users with a high statuses_count are often more active and may have higher visibility on the platform.
listed_count may suggest the user’s credibility or reputation, as being added to lists is often associated with users who are recognized by others as knowledgeable or influential in specific areas.
cred (credibility score): designed to assess a user’s perceived trustworthiness or reliability on social media. This score reflects the user’s likely credibility based on factors such as activity, influence, engagement, and other metadata. 
Usage
The cred column can help analyze patterns related to information reliability:
Comparing Credibility Scores: Determine if users posting truthful information generally have higher credibility scores than those spreading misinformation.
Feature for Predictive Modeling: Incorporate credibility as a feature in models predicting misinformation, as high credibility users are often more trusted sources.
normalize_influence (score): represents a normalized influence score for each user. This score is calculated to reflect the user’s influence on social media, taking into account factors like follower count, engagement metrics (likes, retweets, replies), and possibly other activity indicators, then normalizing these values to make them comparable across all users in the dataset. → Ex: Think of a tweet's contents as a virus. When a person reads the tweet, they become infected — their influence probability is the chance they'll spread it to their followers.
Usage
Standardized Metric: By normalizing influence, this score allows for comparison of influence levels across users, regardless of absolute follower counts or raw engagement.
Indicator of Reach and Engagement: Higher scores suggest that the user likely has a wider reach, higher engagement, or more significant impact on the platform, which can be a factor in the spread of information (or misinformation).
unique_count: This column represents the number of unique, complex words in each tweet. Complex words typically refer to words with higher lexical difficulty, possibly based on word length or syllable count. This metric can give insight into the sophistication or readability of a tweet.
total_count: This column represents the total number of words in each tweet. It is a straightforward word count that indicates the length of the tweet.
Usage
unique_count can be used to analyze the linguistic complexity of tweets, which may differ between truthful and false information. Complex language might be associated with certain types of content or persuasion techniques.
total_count helps assess tweet length, which can influence engagement and readability. Shorter tweets are often more readable and may spread faster, while longer tweets can convey more detailed information.
conjunctions: words that connect phrases, clauses, or sentences to create more complex sentence structures. Common conjunctions include:
Coordinating Conjunctions: “and,” “but,” “or,” “so,” “for,” “nor,” “yet”
Subordinating Conjunctions: “because,” “although,” “since,” “unless,” “while,” “though”
Correlative Conjunctions: “either…or,” “neither…nor,” “not only…but also”
Usage
Sentence Complexity: Tweets with more conjunctions may be more complex in structure, indicating a higher level of detail or nuance.
Tone and Argumentation: The presence of conjunctions can signify logical or persuasive language, as conjunctions are often used to connect ideas and reasons (e.g., “because,” “although”).
Content Analysis: Misinformation content may sometimes have simpler or more repetitive sentence structures, whereas truthful content might use conjunctions to build complex, multi-part explanations.



