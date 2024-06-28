LOAD CSV WITH HEADERS FROM 'file:///genre_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_BASICS {tconst: toInteger(line.tconst)}), (y:IMDB_GENRE {genre: toInteger(line.genre)})
 CREATE (x)-[:HAS_GENRE]->(y)
} IN TRANSACTIONS OF 1000000 ROWS