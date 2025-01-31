
####################################
##
####################################


module load oracle_jdk/21.0.2 gatk/4.1.3.0


gatk MergeVcfs -I /ngc/projects2/gm/people/mauqua/dengen/bin/1000_genomes_grch38.target.paths.reheader.paths -O /ngc/projects2/gm/people/mauqua/dengen/results/1000g_grch38.vcf.gz


