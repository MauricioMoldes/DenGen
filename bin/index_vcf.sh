

#################
## index file 
#################

module load tabix/1.2.1

#tabix -p vcf /ngc/projects2/gm/people/mauqua/dengen/results/dengen_2211_merged.snp_filtered.vcf.gz
#tabix -p vcf /ngc/projects2/gm/people/mauqua/dengen/results/dengen_2211_merged.vcf.gz

tabix -p vcf /ngc/projects2/gm/people/mauqua/dengen/results/1000g_dengen_2211_merged.snp_filtered.vcf.gz

: ' 
input="1000_genomes_grch38.target.paths.reheader"
while IFS= read -r line
do
  echo "$line"
  tabix -p vcf ../data/1000genomes_grch38/"$line"
  
done < "$input"

'


