LOAD CSV WITH HEADERS FROM 'file:///has_attribute_edge.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_AKAS {akas_id: line.akas_id}), (y:IMDB_ATTRIBUTE {attribute: line.attribute})
 CREATE (x)-[:HAS_ATTRIBUTE]->(y)
} IN TRANSACTIONS OF 1000000 ROWS