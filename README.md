# imdb_graphdb_article

## Prelude
(Upcoming article) Article on Graph Modeling of the IMDB dataset.

Checkout this repo in the same folder with this one [IMDB DATASET ARTICLE CODE](https://github.com/fithisux/imdb_dataset_article).
 

## Kuzudb version
It generates a Kuzu DB graph database in kuzudb_elt folder.

Please run the [kuzudb_export.ipynb](kuzudb_version/kuzudb_export.ipynb) notebook while having fixed if necessary the paths in order to export to parquet.
Please run the [kuzudb_load.ipynb](kuzudb_version/kuzudb_load.ipynb) to load graph to kuzudb.

To view your graph and run interactive queries use next command (change accordingly)

```
docker run -p 8000:8000  -v C:/work/imdb_graphdb_article/kuzudb_elt:/database --rm kuzudb/explorer:latest
```