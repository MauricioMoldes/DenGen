#####################
## Count strucutral variants Manta
#####################

input="/ngc/projects2/gm/people/mauqua/dengen/bin/dengen_2211_list.paths.manta.sv"

echo "FILENAME COUNT SV" > dengen_2211_sv_count

while IFS= read -r line
do
   
  # INS, DEL, DUP
 sv=$(zcat "$line" | grep -v "#" | grep -v "SVTYPE=BND" | cut -f8 | cut -d";" -f2 | cut -d"=" -f2 |  sort | uniq -c | xargs ) 
  sv_del_count=$(echo "$sv" | cut -d" " -f1)
  sv_dup_count=$(echo "$sv" | cut -d" " -f3)
  sv_ins_count=$(echo "$sv" | cut -d" " -f5)
  
    echo "$line" "DEL" "$sv_del_count" >> dengen_2211_sv_count
    echo "$line" "DUP" "$sv_dup_count" >> dengen_2211_sv_count
    echo "$line" "INS" "$sv_ins_count" >> dengen_2211_sv_count

  # some dengen files are annotated for SV or have been run with a previous manta version, the cut off for inv annotation is 1.4   

 if [[ $sv == *"INV"* ]]; then
	sv_ins_count=$(echo "$sv" | cut -d" " -f7)
        echo "$line" "INV" "$sv" >> dengen_2211_sv_count
   else
	# INV , count number of events with 4 breakpoints, associated with INV events 
 	inv=$(zcat "$line" | grep -v "#" | cut -f8 | grep -o 'EVENT=MantaBND:[^;]*' | sort | uniq -c | grep "4 " | wc -l)
  
  echo "$line" "INV" "$inv" >> dengen_2211_sv_count	
  fi

done < "$input"


echo "SAMPLE TOTAL SV" >> dengen_2211_sv_count_all


del=$(cat dengen_2211_sv_count | grep "DEL" |  awk '{ total += $3 } END { print total/NR }')

echo "ALL" "DEL" "$del" >> dengen_2211_sv_count_all

dup=$(cat dengen_2211_sv_count | grep "DUP" |  awk '{ total += $3 } END { print total/NR}')

echo "ALL" "DUP" "$dup" >> dengen_2211_sv_count_all

ins=$(cat dengen_2211_sv_count | grep "INS" |  awk '{ total += $3 } END { print total/NR }')

echo "ALL" "INS" "$ins" >> dengen_2211_sv_count_all

inv=$(cat dengen_2211_sv_count | grep "INV" |  awk '{ total += $3 } END { print total/NR }')

echo "ALL" "INV" "$inv" >> dengen_2211_sv_count_all

