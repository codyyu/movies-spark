-- CREATE USER IF NOT EXISTS clickhouse
-- IDENTIFIED WITH sha256_password BY 'clickhouse';

-- GRANT default_role TO clickhouse;

CREATE DATABASE IF NOT EXISTS movies;

CREATE TABLE IF NOT EXISTS movies.title_akas (
    titleId String,
    ordering Int64,
    title String,
    region String,
    language String,
    types String,
    attributes String,
    isOriginalTitle Boolean
)
ENGINE = MergeTree
ORDER BY titleId;

INSERT INTO movies.title_akas
FROM INFILE 'data/clean/title-akas.parquet' FORMAT Parquet;

CREATE TABLE IF NOT EXISTS movies.title_basics (
    tconst String,
    titleType String,
    primaryTitle String,
    originalTitle String,
    isAdult Boolean,
    startYear String,
    endYear String,
    runtimeMinutes String,
    genres String
)
ENGINE = MergeTree
ORDER BY tconst;

INSERT INTO movies.title_basics
FROM INFILE 'data/clean/title-basics.parquet' FORMAT Parquet;

CREATE TABLE IF NOT EXISTS movies.title_crew (
    tconst String,
    directors String,
    writers String
)
ENGINE = MergeTree
ORDER BY tconst;

INSERT INTO movies.title_crew
FROM INFILE 'data/clean/title-crew.parquet' FORMAT Parquet;

CREATE TABLE IF NOT EXISTS movies.title_principals (
    tconst String,
    ordering Int64,
    nconst String,
    category String,
    job String,
    characters String
)
ENGINE = MergeTree
ORDER BY tconst;

INSERT INTO movies.title_principals
FROM INFILE 'data/clean/title-principals.parquet' FORMAT Parquet;

CREATE TABLE IF NOT EXISTS movies.title_ratings (
    tconst String,
    averageRating Float64,
    numVotes Int64
)
ENGINE = MergeTree
ORDER BY tconst;

INSERT INTO movies.title_ratings
FROM INFILE 'data/clean/title-ratings.parquet' FORMAT Parquet;

CREATE TABLE IF NOT EXISTS movies.name_basics (
    nconst String,
    primaryName String,
    birthYear String,
    deathYear String,
    primaryProfession String,
    knownForTitles String
)
ENGINE = MergeTree
ORDER BY nconst;

INSERT INTO movies.name_basics
FROM INFILE 'data/clean/name-basics.parquet' FORMAT Parquet;
