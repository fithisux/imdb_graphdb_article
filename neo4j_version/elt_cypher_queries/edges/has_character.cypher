LOAD CSV WITH HEADERS FROM 'file:///characters_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_PRINCIPALS {ID: toInteger(line.ID)}), (y:IMDB_CHARACTERS {somecharacter: toInteger(line.somecharacter)})
 CREATE (x)-[:HAS_CHARACTER]->(y)
} IN TRANSACTIONS OF 1000 ROWS