################################
## Caculates sample statistics 
################################

module load samtools/1.19.2
#module load gnuplot/5.4.0


#samtools stats sortedbamfilename.bam > sortedbamfilename.stats
#plot-bamstats -p my_output sortedbamfilename.stats


input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"

mkdir -p /ngc/projects2/gm/people/mauqua/dengen/results/dengen_samples_alignment_stats/

while IFS= read -r line
do
  echo "$line"
  samtools stats /ngc/projects/gm/data/hierarchies/hg38/filetype/alignments/"$line".cram > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_samples_alignment_stats/"$line".stats
 #plot-bamstats -p /ngc/projects2/gm/people/mauqua/dengen/results/outdir/"$line" /ngc/projects2/gm/people/mauqua/dengen/results/dengen_samples_alignment_stats/"$line".stats 
done < "$input"


