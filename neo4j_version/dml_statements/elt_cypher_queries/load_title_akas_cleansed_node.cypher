LOAD CSV WITH HEADERS FROM 'file:///title_akas_cleansed_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:ATTRIBUTE {
    titleId:line.titleId,
    title:line.title,
    ordering:toInteger(line.ordering),
    isOriginalTitle:toBoolean(line.isOriginalTitle)})
} IN TRANSACTIONS OF 1000 ROWS;