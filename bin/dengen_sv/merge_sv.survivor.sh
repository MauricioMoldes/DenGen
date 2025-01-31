#################
## Merge SV 
#################

## Load Module 

module load survivor/1.0.7

## Define SV tools
tools=(manta delly)

rm /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file

## Read Sample 

input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
while IFS= read -r line
do
  echo "$line"
  # create temporary file
  for tool in ${tools[@]}; do
     echo "$line"| sed "s|^|/ngc/projects2/gm/people/mauqua/dengen/data/sv/|g" | sed "s|$|_cnv_germline_raw."$tool".vcf|g" >> /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file

     target=$(echo "$line"| sed "s|^|/ngc/projects2/gm/people/mauqua/dengen/data/sv/|g" | sed "s|$|_cnv_germline_raw."$tool".vcf|g")
     source=$(echo "$line"| sed "s|^|/ngc/projects2/gm/data/archive/2022/variants/cnv/|g" | sed "s|$|_cnv_germline_raw."$tool".vcf.gz|g")
 
     #echo "$source"
     #echo "$target"
     zcat "$source" > "$target" 

  done

  cat /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file
  
  # use survivor to merge 
  
#SURVIVOR merge /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file 1000 3 1 0 0 50 /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/"$line".vcf
#SURVIVOR merge /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file 1000 1 1 0 0 50 /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/"$line".all.vcf
SURVIVOR merge /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file 1000 2 1 0 0 50 /ngc/projects2/gm/people/mauqua/dengen/data/sv/"$line".all.vcf

  rm /ngc/projects2/gm/people/mauqua/dengen/bin/temporary_file

done < "$input"





