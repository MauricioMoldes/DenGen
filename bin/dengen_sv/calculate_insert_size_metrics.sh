
####################
## Calculate insert size metrics
####################

# Load GATK

module load oracle_jdk/21.0.2 gatk/4.6.0.0 apache-arrow/11.0.0_CPP intel/perflibs/2020_update4 gcc/9.4.0 R/4.4.0


input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
while IFS= read -r line
do

  source=$(echo "$line"| sed "s|^|/ngc/projects/gm/data/hierarchies/hg38/filetype/alignments/|g" | sed "s|$|.cram|g")
  echo "Processing $source file..."

gatk CollectInsertSizeMetrics \
      I=$source \
      O=/ngc/projects2/gm/people/mauqua/dengen/results/statistics/$line.insert_size_metrics.txt \
      H=/ngc/projects2/gm/people/mauqua/dengen/results/statistics/$line.insert_size_histogram.pdf \
      M=0.5 \
      R=/ngc/shared/resources/h.sapiens/hg38/genomes/GCA_000001405.15_GRCh38_no_alt_analysis_set/20210411/GCA_000001405.15_GRCh38_no_alt_analysis_set_maskedGRC_exclusions.fasta


done < "$input"

