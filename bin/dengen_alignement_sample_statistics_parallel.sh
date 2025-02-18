#!/bin/bash

input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
output_dir="/ngc/projects2/gm/people/mauqua/dengen/results/dengen_samples_alignment_stats"
mkdir -p "$output_dir"

module load samtools/1.19.2


batch_size=10
mapfile -t samples < "$input"
total_samples=${#samples[@]}

for ((i = 0; i < total_samples; i += batch_size)); do
  for ((j = i; j < i + batch_size && j < total_samples; j++)); do
    line="${samples[j]}"
    samtools stats "/ngc/projects/gm/data/hierarchies/hg38/filetype/alignments/$line.cram" > "$output_dir/$line.stats" &
  done
  wait  # Wait for the batch to finish before starting the next
done
