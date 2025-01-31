#########################
## Join VDS DenGen 2211
#########################

# qsub -W group_list=external-rh_rh_gm -A external-rh_rh_gm -N dengen_2211_vds -l nodes=10:ppn=40,mem=100gb,walltime=96:00:00  -e /ngc/projects2/gm/people/mauqua/dengen/dengen_2211_vds.error -o /ngc/projects2/gm/people/mauqua/dengen/dengen_2211_vds.output create_dengen_2211_vds.sh


# load modules
module purge; module load tools jdk/11.0.1 hail/0.2.132

# assign memory
export PYSPARK_SUBMIT_ARGS="--driver-memory 500G --executor-memory 200g pyspark-shell"


python3 /ngc/projects2/gm/people/mauqua/dengen/bin/bencharmark.py

