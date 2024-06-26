LOAD CSV WITH HEADERS FROM 'file:///primaryprofession_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_PRIMARYPROFESSION {
    profession:line.profession})
} IN TRANSACTIONS OF 1000 ROWS;