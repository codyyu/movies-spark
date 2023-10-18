import os

import pyarrow.csv as csv
import pyarrow.parquet as pa


def invalid_row_handler(err: csv.InvalidRow):
    return "skip"


def main():
    for file in os.listdir("data/raw/"):
        file_name, _ = file.split(".")
        try:
            data = csv.read_csv(
                f"data/raw/{file}",
                parse_options=csv.ParseOptions(
                    delimiter="\t", invalid_row_handler=invalid_row_handler
                ),
            )
            pa.write_table(
                data, f"data/processed/{file_name}.parquet", compression=None
            )
        except:
            print(f"{file} error")


if __name__ == "__main__":
    main()
