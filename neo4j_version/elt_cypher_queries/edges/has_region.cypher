LOAD CSV WITH HEADERS FROM 'file:///has_region_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_AKAS {akas_id: toInteger(line.akas_id)}), (y:IMDB_REGION_CODE {alpha2: toInteger(line.alpha2)})
 CREATE (x)-[:HAS_REGION]->(y)
} IN TRANSACTIONS OF 1000000 ROWS