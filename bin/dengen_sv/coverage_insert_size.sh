###########################
## Coverage and Insert size
###########################

cat /ngc/projects2/gm/people/mauqua/dengen/results/statistics/$1.depth_of_coverage | cut -d"=" -f2 | xargs  > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/depth_coverage
cat /ngc/projects2/gm/people/mauqua/dengen/results/statistics/$1.stats |  grep "insert size average" |  cut -d":" -f2 | xargs  > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/insert_size

echo "$1" > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/sample_id

paste /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/sample_id /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/depth_coverage /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/insert_size  > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/join_depth_coverage_insert_size

cat /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/data/sample_metrics.header /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/join_depth_coverage_insert_size > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/sample_metrics

#rm ../data/$1/analysis/join_depth_coverage_insert_size
#rm ../data/$1/analysis/depth_coverage
#rm ../data/$1/analysis/insert_size
#rm ../data/$1/analysis/$1.flagstat.statistics
#rm ../data/$1/analysis/$1.stats
#rm ../data/$1/analysis/$1.depth_of_coverage
#rm ../data/$1/analysis/sample_id

