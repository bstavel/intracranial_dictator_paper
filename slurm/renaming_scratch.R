subs=("IR9" "IR16" "IR19" "IR26" "IR28" "IR35" "IR57" "IR39" "GP51" "DA9" "ST40")

for sub in ${subs[@]}
do
  mkdir $sub'/final/'
done


for sub in ${subs[@]}
do
  find $sub -type f -mtime 0  -exec mv {} $sub'/final/' \;
done
  
for sub in ${subs[@]}
do
  cd $sub'/final/'
  rename 's/comb-only/unified_cperm/g' *.csv
  cd ../..
done

for sub in ${subs[@]}
do
  cd $sub'/final/'
  mv *.csv ..
  cd ../..
done


find . -type f -mtime 0  -exec mv {} final/ \;

rename 's/comb-only/unified_cperm/g' *.csv
