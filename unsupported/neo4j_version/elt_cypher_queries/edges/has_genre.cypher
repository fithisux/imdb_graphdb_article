LOAD CSV WITH HEADERS FROM 'file:///has_genre_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_BASICS {tconst: line.tconst}), (y:IMDB_GENRE {genre: line.genre})
 CREATE (x)-[:HAS_GENRE]->(y)
} IN TRANSACTIONS OF 1000000 ROWS