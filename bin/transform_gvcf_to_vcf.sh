
########################
##
#########################



 
module load oracle_jdk/21.0.2 gatk/4.1.3.0


gatk GenotypeGVCFs -R my_data/reference_genome/GCA_000001405.15_GRCh38_no_alt_analysis_set_maskedGRC_exclusions.fasta --variant my_data/$1.g.vcf -O my_data/$1.gatk.vcf



