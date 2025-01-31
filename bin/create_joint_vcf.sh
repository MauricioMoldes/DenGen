
####################################
##
####################################

module load bcftools/1.9

bcftools merge -l /ngc/projects2/gm/people/mauqua/dengen/bin/filepaths_200_cohort_vcfs.txt -Oz -o /ngc/projects2/gm/people/mauqua/dengen/results/dengen_200_merged.vcf.gz


