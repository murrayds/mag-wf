############################################################################
# upload.smk
###############################################################################
rule upload_main_to_bigquery:
    input: rules.process_mag_main.output, MAG_SCHEMAS
    output: BQ_MAIN_LOGS
    shell:
        """
        bq load \
          --source_format=NEWLINE_DELIMITED_JSON \
          --max_bad_records=5000 \
          --replace=True \
          mag.{wildcards.file} \
          {input[0]} \
          {input[1]}

        touch {output}
        bq show ccnr-success:mag.{wildcards.file} > {output}
        """

rule upload_main_to_bigquery:
    input: rules.process_mag_adv.output, MAG_SCHEMAS
    output: BQ_ADV_LOGS
    shell:
        """
        bq load \
          --source_format=NEWLINE_DELIMITED_JSON \
          --max_bad_records=5000 \
          --replace=True \
          mag.{wildcards.file} \
          {input[0]} \
          {input[1]}

        touch {output}
        bq show ccnr-success:mag.{wildcards.file} > {output}
        """
