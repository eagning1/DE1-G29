import pandas as pd
from sqlalchemy import create_engine

# PostgreSQL connection details
db_user = "sparkuser"
db_password = "9567"
db_host = "localhost"  # Change if needed
db_port = "5432"  # Default PostgreSQL port
db_name = "lyricsdb"

# Create SQLAlchemy engine
engine = create_engine(f"postgresql+psycopg2://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}")

# Append data to an existing table
# words_df.to_sql("words", engine, if_exists="append", index=False)

# Parse the training data file for lyrics
train_file_path = "mxm_dataset_train.txt"
lyrics_data = []
with open(train_file_path, 'r', encoding='utf-8') as file:
    for line in file:
        if not line.strip() or line.startswith(('%', '#')):
            continue

        parts = line.strip().split(',')
        track_id, mxm_tid = parts[:2]

        # Split word and count pairs
        for word_count in parts[2:]:
            word, count = word_count.split(':')
            lyrics_data.append([track_id, mxm_tid, word, int(count), 0])  # is_test = 0 for training data

lyrics_df = pd.DataFrame(lyrics_data, columns=["track_id", "mxm_tid", "word", "count", "is_test"])

lyrics_df = lyrics_df.rename(columns={'word':'word_id'})
lyrics_df['is_test'] = lyrics_df['is_test'].astype(bool)
lyrics_df.insert(5, 'l_id', range(1, len(lyrics_df) + 1))

lyrics_df[100001:].to_sql("lyrics", engine, if_exists="append", index=False)
