
####################################
##
####################################

module load bcftools/1.20

#bcftools filter -O z -o /ngc/projects2/gm/people/mauqua/dengen/results/dengen_200_merged.snp_filtered.vcf.gz -i 'TYPE="SNP"' /ngc/projects2/gm/people/mauqua/dengen/results/dengen_200_merged.vcf.gz

#bcftools filter -O z -o /ngc/projects2/gm/people/mauqua/dengen/results/1000g_grch38.snp_filtered.vcf.gz -i 'TYPE="SNP"' /ngc/projects2/gm/people/mauqua/dengen/results/1000g_grch38.vcf.gz


bcftools filter -O z -o /ngc/projects2/gm/people/mauqua/dengen/results/dengen_2211_merged.snp_filtered.vcf.gz -i 'TYPE="SNP"' /ngc/projects2/gm/people/mauqua/dengen/results/dengen_2211_merged.vcf.gz

