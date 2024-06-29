LOAD CSV WITH HEADERS FROM 'file:///has_character_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_PRINCIPAL {principal_id: toInteger(line.principal_id)}), (y:IMDB_CHARACTER {somecharacter: toInteger(line.somecharacter)})
 CREATE (x)-[:HAS_CHARACTER]->(y)
} IN TRANSACTIONS OF 1000000 ROWS