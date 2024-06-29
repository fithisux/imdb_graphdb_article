LOAD CSV WITH HEADERS FROM 'file:///has_title_type_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_BASICS {tconst: toInteger(line.tconst)}), (y:IMDB_TITLE_TYPE {title_type: toInteger(line.title_type)})
 CREATE (x)-[:HAS_TITLE_TYPE]->(y)
} IN TRANSACTIONS OF 1000000 ROWS