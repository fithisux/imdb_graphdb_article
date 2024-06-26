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

## Neo4j version (WIP, only nodes and their indexes)
It generates a Neo4j DB graph database (DOkcer will need 32GB) from the kuzdb graph model.

Run first your neo4j

```
docker run \
    -p 7474:7474 -p 7687:7687 \
    --name neo4j-apoc \
    --volume="C:\work\imdb_graphdb_article\neo4j_version\data":/data \
    --volume="C:\work\imdb_graphdb_article\neo4j_version\logs":/logs \
    --volume="C:\work\imdb_graphdb_article\neo4j_version\conf":/conf \
    --volume="C:\work\imdb_graphdb_article\neo4j_version\export_elt":/import \
    -e NEO4J_apoc_export_file_enabled=true \
    -e NEO4J_apoc_import_file_enabled=true \
    -e NEO4J_apoc_import_file_use__neo4j__config=true \
    -e NEO4J_PLUGINS=\[\"apoc\"\] \
    --env NEO4J_server_memory_pagecache_size=10G \
    --env NEO4J_server_memory_heap_initial__size=5G \
    --env NEO4J_server_memory_heap_max__size=5G \
    neo4j:latest
```

Please run the [neo4j_export.ipynb](neo4j_version/neo4j_export.ipynb) notebook while having fixed if necessary the paths in order to export to parquet.
Please run the [neo4j_load.ipynb](neo4j_version/neo4j_load.ipynb) to load graph to neo4j.
