############################################################################
# upload.smk
###############################################################################
rule upload_main_to_bigquery:
    input: rules.process_mag_main.output, MAG_SCHEMAS
    output: BQ_MAIN_LOGS
    threads: 10
    shell:
        """
        bq load \
          --source_format=NEWLINE_DELIMITED_JSON \
          --max_bad_records=8000000 \
          --replace=True \
          mag.{wildcards.file} \
          {input[0]} \
          {input[1]}

        touch {output}
        bq show ccnr-success:mag.{wildcards.file} > {output}
        """

rule upload_adv_to_bigquery:
    input: rules.process_mag_adv.output, MAG_SCHEMAS
    output: BQ_ADV_LOGS
    threads: 10
    shell:
        """
        bq load \
          --source_format=NEWLINE_DELIMITED_JSON \
          --max_bad_records=10000 \
          --replace=True \
          mag.{wildcards.file} \
          {input[0]} \
          {input[1]}

        touch {output}
        bq show ccnr-success:mag.{wildcards.file} > {output}
        """
