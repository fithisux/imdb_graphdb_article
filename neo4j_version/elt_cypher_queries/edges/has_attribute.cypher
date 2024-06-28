LOAD CSV WITH HEADERS FROM 'file:///attributes_edge.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_AKAS {ID: toInteger(line.ID)}), (y:IMDB_ATTRIBUTES {attribute: toInteger(line.attribute)})
 CREATE (x)-[:HAS_ATTRIBUTE]->(y)
} IN TRANSACTIONS OF 1000000 ROWS