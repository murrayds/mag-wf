############################################################################
# process.smk
###############################################################################
import codecs

rule process_mag_main:
    input: ancient(rules.download_mag_main_from_gcloud.output), MAG_SCHEMAS
    output: MAG_MAIN_FILES_PROC
    run:
        csv.field_size_limit(256<<10)
        with open(input[1], ) as schemafile:
            schema = [item["name"] for item in json.loads(schemafile.read())]

        with codecs.open(input[0], "rb", encoding="utf-8") as f_in, open(output[0], 'a', encoding='utf-8') as f_out:
            #print(schema)
            reader = csv.reader((x.replace('\0', '') for x in f_in), delimiter='\t', quoting=csv.QUOTE_NONE)
            for line in reader:
                record = dict(zip(schema, line))

                json.dump(record, f_out)
                f_out.write("\n")

rule process_mag_adv:
    input: ancient(rules.download_mag_adv_from_gcloud.output), MAG_SCHEMAS
    output: MAG_ADV_FILES_PROC
    run:
        csv.field_size_limit(256<<10)
        with open(input[1], ) as schemafile:
            schema = [item["name"] for item in json.loads(schemafile.read())]

        with codecs.open(input[0], "rb", encoding="utf-8") as f_in, open(output[0], 'a', encoding='utf-8') as f_out:
            reader = csv.reader((x.replace('\0', '') for x in f_in), delimiter='\t', quoting=csv.QUOTE_NONE)
            for line in reader:
                record = dict(zip(schema, line))

                json.dump(record, f_out)
                f_out.write("\n")
