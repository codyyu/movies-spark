import os
from pathlib import Path

import polars as pl
import pyarrow as pa
import pyarrow.parquet as pq

FILE_NAME = "title-akas.parquet"
PROCESSED_DATASET_PATH = Path(os.getcwd(), "data", "processed", FILE_NAME)
CLEAN_DATASET_PATH = Path(os.getcwd(), "data", "clean", FILE_NAME)


def main() -> None:
    df = (
        pl.scan_parquet(PROCESSED_DATASET_PATH)
        .with_columns(pl.col("isOriginalTitle").str.replace(r"(\\N)", False))
        .sink_parquet(CLEAN_DATASET_PATH)
    )


if __name__ == "__main__":
    main()
