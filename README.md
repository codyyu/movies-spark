# Movies-Spark-Clickhouse

## TODO
- [ ] Explore all pre-processed Dataset
- [ ] Dataset cleaning
- [ ] Insert all datasets into Clickhouse
- [ ] Use Spark to query and produce matrices
- [x] Set up Clickhouse environment
- [x] Set up PySpark environment
- [x] Test connection between Clickhouse and Spark 

## Goals
- Play with Polars' LazyFrame API (data transforming with lazy evaluation)
- Play with Clickhouse
- Play with Spark

## Tech Stack
| Layer | Technology |
|-------|------------|
| Language | Python 3.11 |
| Storage | Clickhouse |
| Computation | Spark 3.4 |

## Dataset
IMDb: [link](https://developer.imdb.com/non-commercial-datasets/)

## Set Up
### Pre-request
- make
- poetry
- docker & docker compose
### Get Started
#### Step 1: `poetry env use /path/to/your/python/execuable`
#### Step 2: `poetry install --only main`
#### Step 3: `make setup`
