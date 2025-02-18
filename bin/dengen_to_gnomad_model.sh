#######################################################
## Processing DenGen samples into gnomad like samples
#######################################################

#sample="/ngc/projects/gm/data/hierarchies/hg38/filetype/variants/snv/00crstivm-103918010210-Normal_Blood_noinfo-WGS_v1_IlluminaDNAPCRFree_RHGM01904-221005_A01961_BH35L5DSX5-EXT_LABKA_NGCWGS-NGCWGS05717_snv_germline_annot.haplotype_caller.vcf.gz"


sample="00crstivm-103918010210-Normal_Blood_noinfo-WGS_v1_IlluminaDNAPCRFree_RHGM01904-221005_A01961_BH35L5DSX5-EXT_LABKA_NGCWGS-NGCWGS05717"

#####################
## VEP 
#####################

# load module 
module load tools perl/5.24.0 htslib/1.10.2 bcftools/1.14 ensembl-vep/104.3

mkdir -p /ngc/projects2/gm/people/mauqua/dengen/results/vep/"$sample"

vep --input_file /ngc/projects/gm/data/hierarchies/hg38/filetype/variants/snv/"$sample"_snv_germline_annot.haplotype_caller.vcf.gz --fork 10 --offline --cache --buffer_size 10000 --config /ngc/projects/gm/pipelines/code_repository/ngs/5.5.34/workflow/variants/annotate/config/vep_snv_hg38.cfg --fasta /ngc/shared/resources/h.sapiens/hg38/genomes/GCA_000001405.15_GRCh38_no_alt_analysis_set/20210411/GCA_000001405.15_GRCh38_no_alt_analysis_set_maskedGRC_exclusions.fasta --gff /ngc/projects/gm/data/resources/ngs/hg38/annotations/vep_custom/hg38_210604.gff.gz --refseq --exclude_predicted --format vcf --everything --no_escape --failed 1 --distance 1500 --stats_text --stats_file /ngc/projects2/gm/people/mauqua/dengen/results/vep/"$sample"/stats.tsv --warning_file /ngc/projects2/gm/people/mauqua/dengen/results/vep/"$sample"/warnings.txt --output_file STDOUT --vcf --force  | bcftools filter --exclude 'ALT="*"' --output-type z  > /ngc/projects2/gm/people/mauqua/dengen/results/vep/"$sample"/"$sample".vep.gz; 


#tabix -p vcf /scratch/52760512.i-07-moab1.eth.clb/ktqysbyxjc/79rdegtaf-110584529484-Normal_Blood_noinfo-WGS_v1_IlluminaDNAPCRFreeUDPv3_RHGM17933-250212_LH00793_B22K5TFLT4-EXT_LABKA_NGCWGS-NGCWGS22665_snv_germline.haplotype_caller.vcf.gz;  






