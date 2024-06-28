LOAD CSV WITH HEADERS FROM 'file:///title_akas_cleansed_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_TITLE_AKAS {
    ID:line.ID,
    title:line.title,
    ordering:toInteger(line.ordering),
    isOriginalTitle:toBoolean(line.isOriginalTitle)})
} IN TRANSACTIONS OF 1000000 ROWS;