###############################
# calculate depth of coverage
###############################

module load samtools/1.19.2

input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
while IFS= read -r line
do

  source=$(echo "$line"| sed "s|^|/ngc/projects/gm/data/hierarchies/hg38/filetype/alignments/|g" | sed "s|$|.cram|g")
  echo "Processing $source file..."


samtools depth $source |  awk '{sum+=$3} END { print "Average = ",sum/NR}' > /ngc/projects2/gm/people/mauqua/dengen/results/statistics/$line.depth_of_coverage

done < "$input"


