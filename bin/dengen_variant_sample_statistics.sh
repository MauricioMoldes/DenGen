################################
## Caculates sample statistics 
################################

module load bcftools/1.20

########
## Merged file 
########


bcftools stats --samples "-" /ngc/projects2/gm/people/mauqua/dengen/results/dengen_2211_merged.vcf.gz > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_samples_stats/dengen_2211.stats

########
## Each sample
########

: '

input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_2211_list.paths"
while IFS= read -r line
do
  echo "$line"
  filename=$(basename -- "$line")
  extension="${filename##*.}"
  filename="${filename%.*.*}"
  bcftools stats --samples "-" "$line" > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_samples_stats/"$filename".stats 
done < "$input"

'
