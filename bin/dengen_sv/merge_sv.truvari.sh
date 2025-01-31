#################
## Merge SV 
#################

## Load Module 

module load truvari/4.3.2
module load bcftools/1.20
module load tabix/1.2.1

## Define SV tools
tools=(manta delly tiddit)

rm /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file

## Read Sample 

input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
while IFS= read -r line
do
  echo "$line"
  
  # create temporary file
  for tool in ${tools[@]}; do
     echo "$line"| sed "s|^|/ngc/projects2/gm/people/mauqua/dengen/data/sv/|g" | sed "s|$|_cnv_germline_raw."$tool".vcf.gz|g" >> /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file

  # file

     target=$(echo "$line"| sed "s|^|/ngc/projects2/gm/people/mauqua/dengen/data/sv/|g" | sed "s|$|_cnv_germline_raw."$tool".vcf.gz|g")
     source=$(echo "$line"| sed "s|^|/ngc/projects2/gm/data/archive/2022/variants/cnv/|g" | sed "s|$|_cnv_germline_raw."$tool".vcf.gz|g")
 
     target_index=$(echo "$line"| sed "s|^|/ngc/projects2/gm/people/mauqua/dengen/data/sv/|g" | sed "s|$|_cnv_germline_raw."$tool".vcf.gz.tbi|g")
     source_index=$(echo "$line"| sed "s|^|/ngc/projects2/gm/data/archive/2022/variants/cnv/|g" | sed "s|$|_cnv_germline_raw."$tool".vcf.gz.tbi|g")


   #echo "$source"
   #echo "$target"
   cp "$source" "$target"
   cp "$source_index" "$target_index"
   

  done

  #cat /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file
  
  # use truvari to merge 

bcftools merge -m none --file-list /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file --force-samples | bgzip > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/"$line".merge.vcf.gz

tabix /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/"$line".merge.vcf.gz

truvari collapse -i /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/"$line".merge.vcf.gz -o /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/"$line".truvari.vcf.gz
     
  rm /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file

done < "$input"


