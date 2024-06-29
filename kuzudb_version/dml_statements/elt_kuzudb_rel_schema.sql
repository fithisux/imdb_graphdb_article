CREATE REL TABLE HAS_ATTRIBUTE(FROM IMDB_TITLE_AKAS TO IMDB_ATTRIBUTE);
CREATE REL TABLE HAS_CHARACTER(FROM IMDB_TITLE_PRINCIPAL TO IMDB_CHARACTER);
CREATE REL TABLE HAS_DIRECTOR(FROM IMDB_TITLE_BASICS TO IMDB_NAME_BASICS);
CREATE REL TABLE HAS_DISTRIBUTION_TYPE(FROM IMDB_TITLE_AKAS TO IMDB_DISTRIBUTION_TYPE);
CREATE REL TABLE HAS_LANGUAGE(FROM IMDB_TITLE_AKAS TO IMDB_LANGUAGE_CODE);
CREATE REL TABLE HAS_GENRE(FROM IMDB_TITLE_BASICS TO IMDB_GENRE);
CREATE REL TABLE HAS_JOB_CATEGORY(FROM IMDB_TITLE_PRINCIPAL TO IMDB_JOB_CATEGORY);
CREATE REL TABLE IS_KNOWN_FOR(FROM IMDB_NAME_BASICS TO IMDB_TITLE_BASICS);
CREATE REL TABLE HAS_NAME(FROM IMDB_TITLE_PRINCIPAL TO IMDB_NAME_BASICS);
CREATE REL TABLE HAS_ORIGINAL_TITLE(FROM IMDB_TITLE_AKAS TO IMDB_TITLE_BASICS);
CREATE REL TABLE HAS_PARENT_TITLE(FROM IMDB_TITLE_EPISODE TO IMDB_TITLE_BASICS);
CREATE REL TABLE HAS_PRIMARYPROFESSION(FROM IMDB_NAME_BASICS TO IMDB_PRIMARYPROFESSION);
CREATE REL TABLE HAS_RATING(FROM IMDB_TITLE_BASICS TO IMDB_TITLE_RATING);
CREATE REL TABLE HAS_REGION(FROM IMDB_TITLE_AKAS TO IMDB_REGION_CODE);
CREATE REL TABLE IS_TITLE_TYPE(FROM IMDB_TITLE_EPISODE TO IMDB_TITLE_BASICS);
CREATE REL TABLE HAS_TITLE_TYPE(FROM IMDB_TITLE_BASICS TO IMDB_TITLE_TYPE);
CREATE REL TABLE WORKS_FOR(FROM IMDB_TITLE_PRINCIPAL TO IMDB_TITLE_BASICS);
CREATE REL TABLE IS_WRITTEN_BY(FROM IMDB_TITLE_BASICS TO IMDB_NAME_BASICS);