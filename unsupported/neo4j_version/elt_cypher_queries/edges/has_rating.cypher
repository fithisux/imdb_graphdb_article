LOAD CSV WITH HEADERS FROM 'file:///has_rating_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_BASICS {tconst: line.tconst}), (y:IMDB_TITLE_RATINGS {ratetconst: line.ratetconst})
 CREATE (x)-[:HAS_RATING]->(y)
} IN TRANSACTIONS OF 1000000 ROWS