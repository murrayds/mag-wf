############################################################################
# process.smk
###############################################################################
import codecs

rule process_mag_main:
    input: rules.download_mag_main_from_gcloud.output
    output: MAG_MAIN_FILES_PROC
    run:
        csv.field_size_limit(256<<10)
        with codecs.open(input[0], "rb", encoding="utf-8") as f_in, open(output[0], 'a') as f_out:
            reader = csv.reader((x.replace('\0', '') for x in f_in), delimiter='\t', quoting=csv.QUOTE_NONE)
            for line in reader:
                record = collections.OrderedDict(zip(config[wildcards.file], line))
                json.dump(record, f_out)
                f_out.write("\n")

rule process_mag_adv:
    input: rules.download_mag_adv_from_gcloud.output
    output: MAG_ADV_FILES_PROC
    run:
        csv.field_size_limit(256<<10)
        with codecs.open(input[0], "rb", encoding="utf-8") as f_in, open(output[0], 'a') as f_out:
            reader = csv.reader((x.replace('\0', '') for x in f_in), delimiter='\t', quoting=csv.QUOTE_NONE)
            for line in reader:
                record = collections.OrderedDict(zip(config[wildcards.file], line))
                json.dump(record, f_out)
                f_out.write("\n")
