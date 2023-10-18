import os
from pathlib import Path

import polars as pl
import pyarrow as pa
import pyarrow.parquet as pq

FILE_NAME = "title-basics.parquet"
PROCESSED_DATASET_PATH = Path(os.getcwd(), "data", "processed", FILE_NAME)
CLEAN_DATASET_PATH = Path(os.getcwd(), "data", "clean", FILE_NAME)


def main() -> None:
    mapper = {0: False, 1: True}

    df = (
        pl.scan_parquet(PROCESSED_DATASET_PATH)
        .filter(pl.col("titleType") == "movie")
        .with_columns(
            pl.col("isAdult").map_dict(mapper, return_dtype=pl.Boolean).cast(pl.Boolean)
        )
        .sink_parquet(CLEAN_DATASET_PATH)
    )


if __name__ == "__main__":
    main()
