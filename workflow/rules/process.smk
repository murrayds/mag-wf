##############################################################################
# process.smk
###############################################################################

rule process_mag_main:
    input: rules.download_mag_main_from_gcloud.output
    output: MAG_MAIN_FILES_PROC
    run:
        with open(input[0]) as f_in, open(output[0], 'a') as f_out:
            reader = csv.reader(f_in, delimiter='\t', quotechar='"')
            for line in reader:
                record = collections.OrderedDict(zip(config[wildcards.file], line))
                json.dump(record, f_out)
                f_out.write("\n")

rule process_mag_adv:
    input: rules.download_mag_adv_from_gcloud.output
    output: MAG_ADV_FILES_PROC
    run:
        with open(input[0]) as f_in, open(output[0], 'a') as f_out:
            reader = csv.reader(f_in, delimiter='\t', quotechar='"')
            for line in reader:
                record = collections.OrderedDict(zip(config[wildcards.file], line))
                json.dump(record, f_out)
                f_out.write("\n")
