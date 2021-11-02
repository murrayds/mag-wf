MAX_ERRORS=1000

echo "doing papers"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.Papers \
  /scratch/d.murray/mag-proc/main/Papers.jsonl \
  ./schemas/papers_schema.json


# begin with the main mag data
echo "doing authors"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.Authors \
  /scratch/d.murray/mag-proc/main/Authors.jsonl \
  ./schemas/authors_schema.json

echo "Done. doing journls"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.Journals \
  /scratch/d.murray/mag-proc/main/Journals.jsonl \
  ./schemas/journals_schema.json

echo "Done. doing affiliations"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.Affiliations \
  /scratch/d.murray/mag-proc/main/Affiliations.jsonl \
  ./schemas/affiliations_schema.json

echo "Done. doing paper references"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.PaperReferences \
  /scratch/d.murray/mag-proc/main/PaperReferences.jsonl \
  ./schemas/paper-refs_schema.json

echo "Done, doing paper urls"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.PaperUrls \
  /scratch/d.murray/mag-proc/main/PaperUrls.jsonl \
  ./schemas/paper-urls_schema.json

echo "Done. doing affiliations"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.PaperAuthorAffiliations \
  /scratch/d.murray/mag-proc/main/PaperAuthorAffiliations.jsonl \
  ./schemas/paper-author-affiliation_schema.json


# Start on the advanced files
echo "Done. doing fields of study"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.FieldsOfStudy \
  /scratch/d.murray/mag-proc/advanced/FieldsOfStudy.jsonl \
  ./schemas/fields-of-study_schema.json

echo "Done. doing paper fields of study"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.PaperFieldsOfStudy \
  /scratch/d.murray/mag-proc/advanced/PaperFieldsOfStudy.jsonl \
  ./schemas/paper-fields-of-study_schema.json

echo "Done. doing field of study children"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.FieldOfStudyChildren \
  /scratch/d.murray/mag-proc/advanced/FieldOfStudyChildren.jsonl \
  ./schemas/field-of-study-children_schema.json

echo "Done. doing paper mesh"
bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --max_bad_records=$MAX_ERRORS \
  --replace=True \
  mag.PaperMeSH \
  /scratch/d.murray/mag-proc/advanced/PaperMeSH.jsonl \
  ./schemas/paper-mesh_schema.json
