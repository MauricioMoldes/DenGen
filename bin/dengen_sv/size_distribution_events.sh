##########################
## SV DISTRIBUTION OF SV EVENTS
##########################

#echo "SAMPLE"   "SIZE" "SV"

#input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
#while IFS= read -r line
#do
#  echo "$line"

#cat /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/"$line".vcf |
#grep -v "#"  | cut -f8 | cut -d";" -f3,4 | sed s/SVLEN=//g |  sed s/SVTYPE=//g | sed s/-//g | sed 's/;/\t/g' >> /ngc/projects2/gm/people/mauqua/dengen/results/size_distributon_events

#done < "$input"


##############
## SAMPLE
##############

cat /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/$1.vcf  | grep -v "#"  | cut -f8 | cut -d";" -f3,4 | sed s/SVLEN=//g |  sed s/SVTYPE=//g | sed s/-//g | sed 's/;/\t/g' | sed "s/^/$1\t/g" > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/size_distribution_events_no_header
cat /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/data/size_distribution_events.header /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/size_distribution_events_no_header > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/size_distribution_events


