
######################
## SIZE DISTRIBITION ACROSS GENOME 
######################

###########
## PROJECT
###########

#cat /ngc/projects2/gm/people/mauqua/dengen/results/size_distributon_events | grep -v "TRA" | tail -n +2 | sort | uniq -c |  sort -nr | sed 's/^ *//g' | sed 's/ /'$'\t''/' >/ngc/projects2/gm/people/mauqua/dengen/results/size_distribution_across_genome

#################
## SAMPLE
#################

cat /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/size_distribution_events | grep -v "TRA" | tail -n +2 | sort | uniq -c |  sort -nr | sed 's/^ *//g' | sed 's/ /'$'\t''/' > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/sv_size_discovered_no_header

cat /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/data/size_count_distribution_events.header /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/sv_size_discovered_no_header >  /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/sv_size_discovered


