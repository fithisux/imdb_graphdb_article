LOAD CSV WITH HEADERS FROM 'file:///imdb_primaryprofession_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_PRIMARYPROFESSION {
    profession:line.profession})
} IN TRANSACTIONS OF 1000000 ROWS;