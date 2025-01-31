######################
## Join Ancestry
######################

#!/bin/bash

#########
## Parses results
#########

#input="/ngc/projects2/gm/people/mauqua/dengen/dengen_list_of_samples.txt"
input="/ngc/projects2/gm/people/mauqua/dengen/has_vcfs.txt"


rm /ngc/projects2/gm/people/mauqua/dengen/results/dengen_ancestry
rm /ngc/projects2/gm/people/mauqua/dengen/dengen_ancestry_graf
rm /ngc/projects2/gm/people/mauqua/dengen/dengen_ancestry_graf.png

while IFS= read -r line
do  
  if [ -e /ngc/projects2/gm/people/mauqua/dengen/results/ancestry/"$file" ]; then
     cat /ngc/projects2/gm/people/mauqua/dengen/results/ancestry/"$line" | grep -v "#" >> /ngc/projects2/gm/people/mauqua/dengen/results/dengen_ancestry

  else 
      echo "File does not exist"
  fi 

done < "$input"

cat /ngc/projects2/gm/people/mauqua/dengen/ancestry_header /ngc/projects2/gm/people/mauqua/dengen/results/dengen_ancestry > /ngc/projects2/gm/people/mauqua/dengen/dengen_ancestry_graf


#################
## PLOT 
##################

# load module

module load singularity/4.0.2

singularity exec graf.sif bash -c "cd /usr/share/ && perl PlotGrafPopResults.pl /ngc/projects2/gm/people/mauqua/dengen/dengen_ancestry_graf /ngc/projects2/gm/people/mauqua/dengen/dengen_ancestry_graf.png"


