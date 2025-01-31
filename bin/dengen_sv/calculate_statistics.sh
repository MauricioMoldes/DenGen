################
## Calculate statistics 
###################

# load samtools 

module load samtools/1.19.2 

input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
while IFS= read -r line
do
  
  source=$(echo "$line"| sed "s|^|/ngc/projects/gm/data/hierarchies/hg38/filetype/alignments/|g" | sed "s|$|.cram|g")
  echo "Processing $source file..."

  #samtools flagstat $source > /ngc/projects2/gm/people/mauqua/dengen/results/statistics/$line.flagstat.statistics
  samtools stats $source | grep ^SN | cut -f 2- > /ngc/projects2/gm/people/mauqua/dengen/results/statistics/$line.stats

done < "$input"

