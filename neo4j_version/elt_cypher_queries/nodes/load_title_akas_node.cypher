LOAD CSV WITH HEADERS FROM 'file:///imdb_title_akas_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_TITLE_AKAS {
    akas_id:line.akas_id,
    titleId:line.titleId,
    ordering:toInteger(line.ordering),
    isOriginalTitle:toBoolean(line.isOriginalTitle)})
} IN TRANSACTIONS OF 1000000 ROWS;