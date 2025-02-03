#################
## index VCF file 
#################

module load tabix/1.2.1

# Index each DenGen sample

#!/bin/bash
input="dengen_2211_list.paths"
while IFS= read -r line
do
  echo "$line"
  filename=$(basename -- "$line")
  extension="${filename##*.}"
  filename="${filename%.*.*}"


tabix -p vcf /ngc/projects2/gm/people/mauqua/dengen/results/normalization/"$filename".normalized.vcf.gz 

done < "$input"


