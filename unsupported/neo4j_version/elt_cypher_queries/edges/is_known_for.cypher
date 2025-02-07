LOAD CSV WITH HEADERS FROM 'file:///is_known_for_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_NAME_BASICS {nconst: line.nconst}), (y:IMDB_TITLE_BASICS {tconst: line.tconst})
 CREATE (x)-[:IS_KNOWN_FOR]->(y)
} IN TRANSACTIONS OF 1000000 ROWS