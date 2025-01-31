
#!/bin/bash
input="/ngc/projects2/gm/people/xinsun/2.dengen/cb_DenGen/HT/filepaths_200_cohort_gvcfs.txt"
while IFS= read -r line
do
  echo "$line"
  du -sh -L "$line" 
done < "$input"

