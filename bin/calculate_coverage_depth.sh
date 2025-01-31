################################
## Calculate average sequencing depth statistics
################################

# depth file path 

#/ngc/projects2/gm/people/mauqua/dengen/results/statistics/$line.depth_of_coverage

# remove previous file
rm /ngc/projects2/gm/people/mauqua/dengen/results/average_coverage_depth.txt

input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
while IFS= read -r line
do

  coverage_depth=$(cat /ngc/projects2/gm/people/mauqua/dengen/results/statistics/$line.depth_of_coverage | cut -d"=" -f2)  
   
   echo $coverage_depth >> /ngc/projects2/gm/people/mauqua/dengen/results/average_coverage_depth.txt

done < "$input"



