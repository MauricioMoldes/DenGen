#################
## Ancestry Wrapper 
################

#!/bin/bash

# Define variables
input_list="dengen_list_of_samples.txt"       # File containing the list of input files
threads=80                       # Number of parallel processes (cores)


# Process files in parallel
cat "$input_list" | xargs -n 1 -P "$threads" -I {} bash ancestry_calculation.sh {}

echo "All files processed!"


