
#################################
## Merge DenGen VCF
#################################

module load bcftools/1.20

input="dengen_list_of_samples.txt"
while IFS= read -r line
do
  filename=$(echo "$line" | sed 's|^|/ngc/projects2/gm/people/mauqua/dengen/results/normalization/|' | sed 's|$|_snv_germline_raw.haplotype_caller.normalized.vcf.gz|')
  echo "$filename" >> /tmp/dengen_normalized.paths
done < "$input"


###################################
## Merging of DenGen files as per production pipeline rules
###################################


bcftools merge -l /tmp/dengen_normalized.paths --missing-to-ref -m none -Oz -o /ngc/projects2/gm/people/mauqua/dengen/results/dengen_2211_merged.v2.vcf.gz


############
## Legacy 
############


#bcftools merge -l /ngc/projects2/gm/people/mauqua/dengen/bin/dengen_2211_list.paths -Oz -o /ngc/projects2/gm/people/mauqua/dengen/results/dengen_2211_merged.vcf.gz

#bcftools merge -l /ngc/projects2/gm/people/mauqua/dengen/bin/dengen_2211_list.paths.annot.subset -Oz -o /ngc/projects2/gm/people/mauqua/dengen/results/dengen_2211_merged.annotated.vcf.gz

#bcftools merge -l /ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list.paths -Oz -o /ngc/projects2/gm/people/mauqua/dengen/results/dengen_19681_merged.vcf.gz


#input="has_vcfs.txt"
#while IFS= read -r line
#do
#  filename=$(echo "$line" | sed 's|^|/ngc/projects2/gm/data/hierarchies/hg38/filetype/variants/snv/|' | sed 's|$|_snv_germline_raw.haplotype_caller.vcf.gz|')
#  echo "$filename" >> /ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list.paths
#done < "$input"

