
#######################
## Ancestry Calculation with GRAF
#######################

# load module 

module load singularity/4.0.2

#input="dengen_list_of_samples.txt"
input="has_vcfs.txt"
while IFS= read -r line
do
  echo "$line"
  
  if [ -e results/ancestry/$line ]; then
    echo "File exists"
else
    ## check if file exists at filesystem level, symlinked file  
    du -sh /ngc/projects2/gm/data/hierarchies/hg38/filetype/variants/snv/"$line"_snv_germline_raw.haplotype_caller.vcf.gz
     
    cp /ngc/projects2/gm/data/hierarchies/hg38/filetype/variants/snv/"$line"_snv_germline_raw.haplotype_caller.vcf.gz /ngc/projects2/gm/people/mauqua/dengen/tmp/

singularity exec --bind /ngc/projects2/gm/people/mauqua/dengen/tmp/:/mnt graf.sif /usr/share/./grafpop /mnt/"$line"_snv_germline_raw.haplotype_caller.vcf.gz results/ancestry/$line

# rm copy
rm /ngc/projects2/gm/people/mauqua/dengen/tmp/"$line"_snv_germline_raw.haplotype_caller.vcf.gz

    #singularity exec --bind /ngc/projects2/gm/data/archive/2022/variants/snv/:/mnt graf.sif /usr/share/./grafpop /mnt/"$line"_snv_germline_raw.haplotype_caller.vcf.gz results/ancestry/$line
    #singularity exec --bind /ngc/projects2/gm/data/hierarchies/hg38/filetype/variants/snv/:/mnt graf.sif /usr/share/./grafpop /mnt/"$line"_snv_germline_raw.haplotype_caller.vcf.gz results/ancestry/$line

#du -sh /ngc/projects2/gm/data/hierarchies/hg38/filetype/variants/snv/"$line"_snv_germline_raw.haplotype_caller.vcf.gz


fi 

done < "$input"


# /ngc/projects2/gm/data/hierarchies/hg38/filetype/variants/snv/00adofouf-110474921316-Normal_Blood_noinfo-WGS_v1_IlluminaDNAPCRFree_RHGM11232-240327_A01961_AH7YVTDSXC-EXT_LABKA_NGCWGS-NGCWGS15599_snv_germline_raw.haplotype_caller.vcf.gz


