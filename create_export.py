import pathlib

files = [f.name.split('.')[0] for f in pathlib.Path().glob("../imdb_dataset_article/models/imdb_kuzu/*.sql")]

print("USE main;")
for filename in files:
    #print(f"COPY (SELECT * FROM {filename}) TO 'C:/work\neo4j_imdb_dataset/export_elt/{filename}.csv.gz'(HEADER, DELIMITER ';', COMPRESSION 'gzip');")
    print(f"COPY (SELECT * FROM {filename}) TO 'C:/work\kuzu_imdb_dataset/export_elt/{filename}.parquet' (FORMAT PARQUET);")