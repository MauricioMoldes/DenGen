
###################################
## Merge 1000G and Dengen 200
###################################

## merge 1000G vcf ( comprised of concatenated samples ) and Dengen 200 vcf 

module load bcftools/1.20

bcftools merge /ngc/projects2/gm/people/mauqua/dengen/results/1000g_grch38.snp_filtered.vcf.gz /ngc/projects2/gm/people/mauqua/dengen/results/dengen_200_merged.snp_filtered.vcf.gz  -Oz -o /ngc/projects2/gm/people/mauqua/dengen/results/1000g_dengen_200_merged.snp_filtered.vcf.gz



