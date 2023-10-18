-- CREATE USER IF NOT EXISTS clickhouse
-- IDENTIFIED WITH sha256_password BY 'clickhouse';

-- GRANT default_role TO clickhouse;

CREATE DATABASE IF NOT EXISTS movies;

CREATE TABLE IF NOT EXISTS movies.titles_akas (
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

INSERT INTO movies.titles_akas
FROM INFILE 'data/processed/title-akas.parquet' FORMAT Parquet