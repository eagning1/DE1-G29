CREATE TABLE words (
    word_id INTEGER NOT NULL,
    word TEXT NOT NULL,
    CONSTRAINT words_pkey PRIMARY KEY (word_id),
    CONSTRAINT words_word_key UNIQUE (word)
);

CREATE TABLE lyrics (
    track_id CHARACTER(18) NOT NULL,
    mxm_tid VARCHAR(100) NOT NULL,
    word_id INTEGER NOT NULL,
    count INTEGER NOT NULL,
    is_test BOOLEAN NOT NULL,
    l_id INTEGER NOT NULL,
    CONSTRAINT lyrics_pkey PRIMARY KEY (track_id, mxm_tid, word_id),
    CONSTRAINT lyrics_word_id_fkey FOREIGN KEY (word_id) REFERENCES public.words(word_id)
) PARTITION BY RANGE (track_id);

-- TRA* to TRG*
CREATE TABLE lyrics_a_g PARTITION OF lyrics
    FOR VALUES FROM ('TRAAAAA0000000000') TO ('TRH0000000000000');

-- TRH* to TRO*
CREATE TABLE lyrics_h_n PARTITION OF lyrics
    FOR VALUES FROM ('TRH0000000000000') TO ('TRO0000000000000');

-- TRO* to TRV*
CREATE TABLE lyrics_o_u PARTITION OF lyrics
    FOR VALUES FROM ('TRO0000000000000') TO ('TRV0000000000000');

-- TRV* to TRZ*
CREATE TABLE lyrics_v_z PARTITION OF lyrics
    FOR VALUES FROM ('TRV0000000000000') TO ('TRZ0000000000000');

-- Catch-all partition for anything else (optional)
CREATE TABLE lyrics_misc PARTITION OF lyrics
    DEFAULT;
