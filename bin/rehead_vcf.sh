
####################################
##
####################################

module load bcftools/1.20

input="1000_genomes_grch38.target.paths.tbi.filenames"
while IFS= read -r line
do
  echo "$line"
  filename=$(basename -- "$line")
  extension="${filename##*.}"
  filename="${filename%.*.*}"
  bcftools reheader -f ../data/1000genomes_grch38/GRCh38_full_analysis_set_plus_decoy_hla.fa.fai -o ../data/1000genomes_grch38/$filename.reheader.vcf.gz ../data/1000genomes_grch38/$filename.vcf.gz
 
done < "$input"

