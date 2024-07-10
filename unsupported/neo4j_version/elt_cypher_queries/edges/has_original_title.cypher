LOAD CSV WITH HEADERS FROM 'file:///has_original_title_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_AKAS {akas_id: toInteger(line.akas_id)}), (y:IMDB_TITLE_BASICS {tconst: toInteger(line.tconst)})
 CREATE (x)-[:HAS_ORIGINAL_TITLE]->(y)
} IN TRANSACTIONS OF 1000000 ROWS