LOAD CSV WITH HEADERS FROM 'file:///imdb_character_node.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_CHARACTER {
    somecharacter:line.somecharacter})
} IN TRANSACTIONS OF 1000000 ROWS;