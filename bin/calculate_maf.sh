####################
## Calculate MAF 
####################

## we calculate AF 

module load tools perl vcftools/0.1.16

VCF="/ngc/projects/gm/people/mauqua/dengen/results/dengen_2211_merged.v2.vcf.gz"
OUT="/ngc/projects/gm/people/mauqua/dengen/results/vcf_analysis_2"


# Allele Frequency 
vcftools --gzvcf $VCF --freq2 --out $OUT --max-alleles 2

# Mean Depth per Individual 

vcftools --gzvcf $VCF --depth --out $OUT

# Mean Depth per site 

vcftools --gzvcf $VCF --site-mean-depth --out $OUT

# Site Quality 

vcftools --gzvcf $VCF --site-quality --out $OUT

# proportion of missing data per individual 

vcftools --gzvcf $VCF --missing-indv --out $OUT

# proportion of missing data per site 

vcftools --gzvcf $VCF --missing-site --out $OUT

# calculate heterozigozity and inbreed per individual 

vcftools --gzvcf $VCF --het --out $OUT

