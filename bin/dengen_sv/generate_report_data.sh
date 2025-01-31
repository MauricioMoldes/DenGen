
#############################
## Folder Structure
#############################

mkdir -p /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1
mkdir -p /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis
mkdir -p /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/results


###########################
## Coverage and Insert size
###########################

echo "Calculate coverage and insert size"

bash coverage_insert_size.sh $1


###########################
## Merge SV
###########################

#echo "Merge SV"

#bash merge_sv.sh $1

######################
## Post-Processing data
#######################

#echo "Post-processing"

#bash post_processing.sh $1


#########################
## Number of events per sample
#########################

echo "number_events_sample"

bash number_events_sample.sh $1

##########################
## Number of events per chromossome
##########################


echo "size_distribution_events"

bash size_distribution_events.sh $1

#########################
## SV Size Number
#########################

echo "size_distribution_across_genome"

bash size_distribution_across_genome.sh $1

######################
## TEMPORARY FOR REPORT 
######################

rm /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/all.txt

cp /ngc/projects2/gm/people/mauqua/dengen/data/sv/"$1"_cnv_germline_raw.delly.vcf /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/"$1"/analysis/delly.vcf

#cp /ngc/projects2/gm/people/mauqua/dengen/data/sv/"$1"_cnv_germline_raw.lumpy.vcf /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/"$1"/analysis/lumpy.vcf

cp /ngc/projects2/gm/people/mauqua/dengen/data/sv/"$1"_cnv_germline_raw.manta.vcf /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/"$1"/analysis/manta.vcf

cp /ngc/projects2/gm/people/mauqua/dengen/data/sv/"$1".all.vcf /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/"$1"/analysis/all.vcf


echo "delly.vcf" >> /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/all.txt   
echo "manta.vcf" >> /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/all.txt
#echo "lumpy.vcf" >> /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/analysis/all.txt


#########################
## GENERATE R MARKDOWN
#########################

sed  "s/sample_template/$1/g" < /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/data/sample_markdown_template.rmd > /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/results/$1.rmd

####################
## GENERATE HTML FROM MARKDOWN
#####################

module load oracle_jdk/21.0.2 gatk/4.6.0.0 apache-arrow/11.0.0_CPP intel/perflibs/2020_update4 gcc/9.4.0 R/4.4.0 pandoc/3.1.9

cd /ngc/projects2/gm/people/mauqua/dengen/results/dengen_sv/$1/results

Rscript -e "Sys.setenv(RSTUDIO_PANDOC='/services/tools/pandoc/3.1.9/bin/pandoc'); rmarkdown::render('$1.rmd')"


