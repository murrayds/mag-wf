MAX_ERRORS=1000

# begin with the main mag data
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  mag.Authors \
  /scratch/d.murray/mag-proc/main/Authors.jsonl \
  ./schemas/authors_schema.json

bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  mag.Journals \
  /scratch/d.murray/mag-proc/main/Journals.jsonl \
  ./schemas/journals_schema.json

bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  mag.Affiliations \
  /scratch/d.murray/mag-proc/main/Affiliations.jsonl \
  ./schemas/affiliations_schema.json

bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  mag.PaperReferences \
  /scratch/d.murray/mag-proc/main/PaperReferences.jsonl \
  ./schemas/paper-refs_schema.json

bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  mag.PaperUrls \
  /scratch/d.murray/mag-proc/main/PaperUrls.jsonl \
  ./schemas/paper-urls_schema.json

bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  mag.PaperAuthorAffiliations \
  /scratch/d.murray/mag-proc/main/PaperAuthorAffiliations.jsonl \
  ./schemas/paper-author-affiliation_schema.json


# Start on the advanced files
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  mag.FieldsOfStudy \
  /scratch/d.murray/mag-proc/advanced/FieldsOfStudy.jsonl \
  ./schemas/fields-of-study_schema.json

bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  mag.PaperFieldsOfStudy \
  /scratch/d.murray/mag-proc/advanced/PaperFieldsOfStudy.jsonl \
  ./schemas/paper-fields-of-study_schema.json

bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  mag.FieldOfStudyChildren \
  /scratch/d.murray/mag-proc/advanced/FieldOfStudyChildren.jsonl \
  ./schemas/field-of-study-children_schema.json

bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  mag.PaperMeSH \
  /scratch/d.murray/mag-proc/advanced/PaperMeSH.jsonl \
  ./schemas/paper-mesh_schema.json
