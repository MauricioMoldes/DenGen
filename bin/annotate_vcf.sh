
########################
## Annotate VCF
########################

module load bcftools/1.20

bcftools annotate \
-a /ngc/projects2/gm/people/mauqua/dengen/results/GCF_000001405.25.gz \
-O z \
-o /ngc/projects2/gm/people/mauqua/dengen/results/dengen_2211_dbSNP156.vcf.gz \
/ngc/projects2/gm/people/mauqua/dengen/results/dengen_2211_merged.vcf.gz




