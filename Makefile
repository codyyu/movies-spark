.PHONY: all format lint setup help

all: help

#############################
# Linting and Formatting
#############################
format:
	poetry run black .
	poetry run isort .

lint:
	poetry run black .
	peotry run flake8 .
	poetry run mypy .

#############################
# Set Up
#############################
setup:
	mkdir -p data/raw
	curl -o data/raw/name-basics.tsv.gz https://datasets.imdbws.com/name.basics.tsv.gz
	curl -o data/raw/title-akas.tsv.gz https://datasets.imdbws.com/title.akas.tsv.gz
	curl -o data/raw/title-basics.tsv.gz https://datasets.imdbws.com/title.basics.tsv.gz
	curl -o data/raw/title-crew.tsv.gz https://datasets.imdbws.com/title.crew.tsv.gz
	curl -o data/raw/title-episode.tsv.gz https://datasets.imdbws.com/title.episode.tsv.gz
	curl -o data/raw/title-principals.tsv.gz https://datasets.imdbws.com/title.principals.tsv.gz
	curl -o data/raw/title-ratings.tsv.gz https://datasets.imdbws.com/title.ratings.tsv.gz
	gzip -d data/raw/*.gz
