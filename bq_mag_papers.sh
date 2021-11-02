MAX_ERRORS=1000

bq load \
  --source_format=NEWLINE_DELIMITED_JSON \
  --autodetect \
  --max_bad_records=$MAX_ERRORS \
  --replace=true \
  mag.Papers \
  /scratch/d.murray/mag-proc/main/Papers.jsonl
