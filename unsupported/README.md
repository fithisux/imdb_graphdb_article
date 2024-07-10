
## Neo4j version (WIP, only nodes and their indexes)
It generates a Neo4j DB graph database (Dokcer will need 32GB) from the kuzdb graph model.

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
    --env NEO4J_server_memory_heap_max__size=25G \
    --env NEO4J_db.memory.transaction.total.max=10G \
    neo4j:latest
```

Please run the [neo4j_export.ipynb](neo4j_version/neo4j_export.ipynb) notebook while having fixed if necessary the paths in order to export to csv.
Please run the [neo4j_load.ipynb](neo4j_version/neo4j_load.ipynb) to load graph to neo4j.