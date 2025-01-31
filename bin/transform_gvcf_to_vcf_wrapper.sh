
#############################
##
#############################

#!/bin/bash
input="/ngc/projects2/gm/people/mauqua/dengen/bin/filepaths_200_cohort_gvcfs.txt"
while IFS= read -r line
do
  echo "$line"
  # get filename
  # create job 
  # send to queue 
  transform_gvcf_to_vcf.sh $filename		
	
done < "$input"

