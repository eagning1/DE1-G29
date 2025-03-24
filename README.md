# Sentiment Analysis of Music Lyrics - DE Group 29

## Overview

This project explores sentiment analysis of song lyrics from the Million Song Dataset (MSD) and its musiXmatch subset, leveraging Apache Spark for distributed computing. We aim to analyze the emotional content of song lyrics across different genres and artists, identifying patterns in sentiments associated with music. We use machine learning techniques, particularly Support Vector Machines (SVM), to classify and analyze emotions present in lyrics. Our work contributes to understanding how lyrics influence emotions, culture, and commercial success in the music industry.

## Problem Definition

The project investigates two main research questions:

1. **RQ1:** What emotions are most common in different music genres?
2. **RQ2:** Which emotions are commonly linked to specific artists?

By applying sentiment analysis to the lyrics dataset, we aim to discover emotional trends in music genres like Pop/Rock, Rap, and others, and explore how different artists express emotions in their lyrics.

## Data

- **Million Song Dataset (MSD)**: Contains metadata for 1 million songs, including song names, artists, and genre tags.
- **musiXmatch Subset**: A collection of 237,000 song lyrics formatted in a bag-of-words model.
- The data is stored in **SQLite** format and used for sentiment analysis of lyrics.

## Methodology

### 1. **Data Processing**:
   - Data was uploaded to **PostgreSQL** (with some limitations leading to an RDD-based solution).
   - A database schema was created with tables for unique words, song lyrics, and matches between MSD and musiXmatch.
   - The dataset was cleaned, and the lyrics were preprocessed for sentiment analysis.

### 2. **Sentiment Analysis**:
   - **VADER** (Valence Aware Dictionary and sentiment Reasoner) was used for sentiment analysis to detect emotional tones in lyrics.
   - **Apache Spark** was used to distribute computations across a cluster, leveraging multiple nodes to process large datasets in parallel.
   - **SVM (Support Vector Machine)** was used for genre classification based on lyric sentiment, with a simplified model focusing on four main genres: Pop/Rock, Rap, Electronic, and Other.

### 3. **Scalability & Performance Testing**:
   - Time-based metrics were collected to assess the scalability of the distributed Spark setup.
   - Different fractions of the dataset were processed, and the impact of adding more worker nodes was evaluated to understand performance improvements.

### 4. **Machine Learning**:
   - The dataset was classified based on genre using SVM.
   - Words with high frequency in specific genres, such as “rapper” and “gangsta” in Rap, were analyzed to determine genre-specific sentiment.

## Results

- **RQ1**: Sentiment analysis showed that Rap tends to be more negative in sentiment, while Pop and Rock genres exhibit a more balanced or positive sentiment.
- **RQ2**: The sentiment distribution varied by artist, with Eminem reflecting the most negative sentiment in his lyrics, while artists like ABBA and Frank Sinatra were associated with fewer negative emotions.
  
  - **Key Observations**:
    - Rap: Words like “rapper,” “gangsta,” and “squad” are strongly associated with the genre.
    - Pop/Rock: The sentiment was more neutral or positive, with words like “mij,” “aldrig,” and “pum” standing out.

- The word clouds show the most distinctive words for genres, with Rap featuring more explicit content and Pop/Rock showing a wider range of vocabulary.

## Technologies

- **Apache Spark**: Distributed computing framework used for processing large datasets in parallel.
- **Python**: Primary programming language used for data processing, machine learning, and sentiment analysis.
- **VADER**: Sentiment analysis tool used to evaluate emotions in song lyrics.
- **SVM (Support Vector Machine)**: Used for genre classification based on sentiment features.
- **PostgreSQL**: Data storage solution (used in conjunction with RDD-based processing due to scalability issues).
  
## Workflow

1. **Data Preparation**:
    - Download the **Million Song Dataset** and **musiXmatch** subset.
    - Prepare the data for sentiment analysis by cleaning and preprocessing the lyrics.
    - Upload the cleaned data to a **PostgreSQL** instance (or use an RDD-based solution).

2. **Sentiment Analysis**:
    - Use **VADER** to analyze the sentiment of song lyrics.
    - Process data using **Apache Spark** distributed across multiple nodes for scalability.

3. **Genre Classification**:
    - Apply **SVM** to classify songs by genre based on their sentiment scores.
    - Analyze sentiment patterns for different genres (Pop/Rock, Rap, Electronic, etc.).

4. **Performance Testing**:
    - Conduct performance testing by varying the dataset fraction and the number of worker nodes.
    - Measure the impact on processing time and scalability.

5. **Results & Analysis**:
    - Visualize sentiment distributions for different genres and artists.
    - Analyze word clouds and identify genre-specific words with emotional associations.

## Conclusion

The project successfully demonstrated the use of sentiment analysis for music lyrics. We provided insights into the emotional content of different music genres and analyzed the sentiment of lyrics for individual artists. This approach can be expanded further with more advanced machine learning models and additional data sources to improve emotion classification accuracy.

## Group Members

- **Agnieszka Inglot**: Organization, literature review, and report writing. Supported sentiment analysis planning and execution.
- **David Forsberg Dimopoulos**: Code development, Spark error debugging, report writing, and supplementary assignment.
- **Erko Olumets**: Data processing, Spark configuration, and result analysis.
- **Johanna Molin**: Sentiment analysis code development, results interpretation, and report writing.
- **Vyoma Jitesh Shah**: Data preparation, Spark cluster setup, and machine learning implementation.

## References

- Ara, A., & Gopalakrishna, R. (2021). A Study on Emotion Identification from Music Lyrics.
- Barradas, G.T., & Sakka, L.S. (2022). When words matter: A cross-cultural perspective on lyrics and their relationship to musical emotions.
- Brewster, S. (2009). Lyric. Routledge.
- Rosebaugh, C., & Shamir, L. (2022). Data Science Approach to Compare the Lyrics of Popular Music Artists.
- VADER Sentiment Analysis. (n.d.). Available at: [VADER Sentiment Analysis Documentation](https://github.com/cjhutto/vaderSentiment)
