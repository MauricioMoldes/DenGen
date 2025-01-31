##################
## Number events by sample
##################

# SCRATCH PROJECT 

#echo "SAMPLE"	"TOTAL"	"SV"

#input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
#while IFS= read -r line
#do
#  echo "$line"

#cat /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/"$line".vcf | grep -v "#"  | cut -f8 | cut -d";" -f4 | cut -d "=" -f2 | sort | uniq -c |   sed -e 's/^[[:space:]]*//'  | awk -v OFS="\t" '$1=$1' | sed "s/^/$1\t/g" >> /ngc/projects2/gm/people/mauqua/dengen/results/number_events_sample.txt 

#done < "$input"

# SAMPLE

cat /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv_merged/$1.vcf | grep -v "#"  | cut -f8 | cut -d";" -f4 | cut -d "=" -f2 | sort | uniq -c |   sed -e 's/^[[:space:]]*//'  | awk -v OFS="\t" '$1=$1' | sed "s/^/$1\t/g" > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/number_events_sv_no_header
cat /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/data/number_events_sv.header /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/number_events_sv_no_header > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/number_events_sample.txt




