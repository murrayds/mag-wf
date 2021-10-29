##############################################################################
# process.smk
###############################################################################

rule download_mag_main_from_gcloud:
    output: MAG_MAIN_FILES
    run:
        source = os.path.basename(output[0])
        command = "gsutil cp -n gs://mag2021oct/mag/2021-08-30/mag/{} {}".format(source, output[0])
        shell(command)

rule download_mag_adv_from_gcloud:
    output: MAG_ADV_FILES
    run:
        source = os.path.basename(output[0])
        command = "gsutil cp -n gs://mag2021oct/mag/2021-08-30/advanced/{} {}".format(source, output[0])
        shell(command)
