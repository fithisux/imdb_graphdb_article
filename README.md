# imdb_graphdb_article
(Upcoming article) Article on Graph Modeling of the IMDB dataset.

Checkout this repo in the same folder with this one.
Please run the notebook while having fixed if necessary the paths. It generates a Kuzu DB graph database in kuzudb_elt folder.

To view your graph and run interactive queries use next command (change accordingly)

```
docker run -p 8000:8000  -v C:/work/imdb_graphdb_article/kuzudb_elt:/database --rm kuzudb/explorer:latest
```
