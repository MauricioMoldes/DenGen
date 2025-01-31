################################
## Caculates sample statistics 
################################

module load samtools/1.20

samtools stats sortedbamfilename.bam > sortedbamfilename.stats
#plot-bamstats -p my_output sortedbamfilename.stats


input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_2211_list.paths"
while IFS= read -r line
do
  echo "$line"
  filename=$(basename -- "$line")
  extension="${filename##*.}"
  filename="${filename%.*.*}"
  bcftools stats --samples "-" "$line" > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_samples_stats/"$filename".stats 
done < "$input"


