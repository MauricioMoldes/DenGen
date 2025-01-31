
###################
## Check if file exists
###################

input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_2211_list.paths.annot"
while IFS= read -r line
do
  if [ ! -f "$line" ]; then
    echo "$line"
  fi
done < "$input"

