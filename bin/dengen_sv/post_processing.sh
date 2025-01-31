##########################
## Post-Processing steps
##########################


##########################
## Filter PASS flag
##########################

## Already done at calling

##########################
## Filter decoy sequences variants
##########################

# Already done at calling

##########################
## Filter Genotype unknown or ref-ref
##########################

# TODO

##########################
## Filter Read depth 10 < SV < 1000
##########################

# TODO

##########################
## Filter size 50 bases < SV < 10.000 base pairs
##########################

cat ../data/$1/analysis/$i.decoy.vcf | grep "#" > ../data/$1/analysis/$i.header
cat ../data/$1/analysis/$i.decoy.vcf | grep -v "#" > ../data/$1/analysis/$i.decoy.variants


  input="../data/$1/analysis/$i.decoy.variants"
  while IFS= read -r line
  do

    sv_type=$(echo "$line" | cut -f8 | cut -d";" -f3,4 | sed s/SVLEN=//g |  sed s/SVTYPE=//g |  sed s/-//g | cut -d";" -f2)
    sv_size=$(echo "$line" | cut -f8 | cut -d";" -f3,4 | sed s/SVLEN=//g |  sed s/SVTYPE=//g |  sed s/-//g | cut -d";" -f1)

    if [[ $sv_type != "TRA" ]]; then
        if  (($sv_size >= 50 && $sv_size <= 10000)); then
                        echo "$line" >> ../data/$1/analysis/$i.decoy.bases.vcf
        fi
    else
        echo "$line" >> ../data/$1/analysis/$i.decoy.bases.vcf
    fi
  done < "$input"

  cat ../data/$1/analysis/$i.header ../data/$1/analysis/$i.decoy.bases.vcf > ../data/$1/analysis/$i.decoy.size.vcf

  rm ../data/$1/analysis/$i.header
  rm ../data/$1/analysis/$i.decoy.variants
  rm ../data/$1/analysis/$i.decoy.bases.vcf


