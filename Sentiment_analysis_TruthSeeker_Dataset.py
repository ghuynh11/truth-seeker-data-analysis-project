import pandas as pd
import csv
data = pd.read_csv('TruthSeeker_Dataset_filter.csv')

import re
def clean_text(text):
    text = re.sub(r'http\S+', '', text)  # Remove URLs
    text = re.sub(r'@\w+', '', text)    # Remove mentions
    text = re.sub(r'#\w+', '', text)    # Remove hashtags
    text = re.sub(r'[^\w\s]', '', text) # Remove punctuation
    return text.lower().strip()
data['cleaned_tweet'] = data['tweet'].apply(clean_text)

from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer

analyzer = SentimentIntensityAnalyzer()

def get_sentiment(text):
    scores = analyzer.polarity_scores(text)
    if scores['compound'] > 0.05:
        return 'positive'
    elif scores['compound'] < -0.05:
        return 'negative'
    else:
        return 'neutral'
data['sentiment'] = data['cleaned_tweet'].apply(get_sentiment)

# Save the resulting DataFrame to a new CSV file
data.to_csv('TruthSeeker_Dataset_with_Sentiment.csv', index=False)

print("CSV file has been saved as 'TruthSeeker_Dataset_with_Sentiment.csv'")
