LOAD CSV WITH HEADERS FROM 'file:///has_director_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_BASICS {tconst: toInteger(line.tconst)}), (y:IMDB_NAME_BASICS {nconst: toInteger(line.nconst)})
 CREATE (x)-[:HAS_DIRECTOR]->(y)
} IN TRANSACTIONS OF 1000000 ROWS