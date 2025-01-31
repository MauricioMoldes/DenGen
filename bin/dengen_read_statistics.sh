##########################
## Generate FASTQ REPORT
##########################


## LOAD MODULES
module load jdk/21.0.1 tools perl/5.20.1 fastqc/0.11.8

## LOGIC


input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
while IFS= read -r line
do
  echo "$line"
  fastqc /ngc/projects2/gm/data/hierarchies/filetype/reads/"$line"_R1.fastq.gz /ngc/projects2/gm/data/hierarchies/filetype/reads/"$line"_R2.fastq.gz -o /ngc/projects2/gm/people/mauqua/dengen/results/fastqc/
  
done < "$input"






