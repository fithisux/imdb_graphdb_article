LOAD CSV WITH HEADERS FROM 'file:///has_parent_title_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_EPISODE {epitconst: line.epitconst}), (y:IMDB_TITLE_BASICS {tconst: line.tconst})
 CREATE (x)-[:HAS_PARENT_TITLE]->(y)
} IN TRANSACTIONS OF 1000000 ROWS