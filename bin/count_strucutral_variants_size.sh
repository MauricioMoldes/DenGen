
#####################
## Count strucutral variants Manta
#####################

echo "SAMPLE SIZE SV" >> /ngc/projects2/gm/people/mauqua/dengen/results/all.sv


input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
while IFS= read -r line
do
  echo "$line"
cat /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/"$line".vcf | grep -v "#"  | cut -f8 | cut -d";" -f3,4 | sed s/SVLEN=//g |  sed s/SVTYPE=//g | sed s/-//g | sed 's/;/\t/g' | sed "s/^/$1\t/g" >> /ngc/projects2/gm/people/mauqua/dengen/results/all.sv

done < "$input"


