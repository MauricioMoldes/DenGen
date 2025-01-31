
#########################################
## Calculate M-F,gender ratio based on filename 
#########################################

#input="/ngc/projects2/gm/people/mauqua/dengen/bin/filepaths_200_cohort_vcfs.txt"
#input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_list_of_samples.txt"
input="has_vcfs.txt" 
while IFS= read -r line
do
  #filename=$(echo "$line" | sed "s|/ngc/projects2/gm/data/archive/2022/variants/snv/||g") 
  filename=$(echo "$line")   
  birth_year_two_digits=$(echo "$filename" | head -c2)
  gender=$(echo "$filename" | head -c9 | tail -c1)
  
  # Get the current year and extract the last two digits
  current_year=$(date +%Y)
  current_year_two_digits=$(date +%y)
  
  # Calculate the full birth year based on the two-digit input
  if [ "$birth_year_two_digits" -le "$current_year_two_digits" ]; then
     birth_year="20$birth_year_two_digits"
  else
     birth_year="19$birth_year_two_digits"
  fi

  # Calculate the age
  age=$((current_year - birth_year))  
  
  # sample type
  
  sample_type=$(echo "$filename" | cut -d"-" -f3)     

  echo "$filename" "$age" "$gender" "$sample_type" >> dengen_statistics
  
## 74unbubuf
## the first 2 chars is the year of birth
## the middle 6 letters repreent a word that can be vocalized
## the last char is gender

done < "$input"

##############
## Calculate DenGen population statistics
##############

cat dengen_statistics | cut -d" " -f2,3 | awk '
BEGIN {
    print "Gender\tAge\tValue"
}
{
    age=$1; gender=$2
    if (age <= 10) range="0-10"
    else if (age <= 20) range="11-20"
    else if (age <= 30) range="21-30"
    else if (age <= 40) range="31-40"
    else if (age <= 50) range="41-50"
    else if (age <= 60) range="51-60"
    else if (age <= 70) range="61-70"
    else if (age <= 80) range="71-80"
    else if (age <= 90) range="81-90"
    else if (age <= 100) range="91-100"
    counts[gender"\t"range]++
}
END {
    for (key in counts) print key "\t" counts[key]
}' > dengen_population_age_gender
