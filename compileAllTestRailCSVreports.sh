# DESCRIPTION
# Calls compileTestRunReport for every .csv file in the current PATH.
gfind . -maxdepth 1 -iname \*.csv > all_csvs.txt

while read filename
do
  # some toopid machine require ./ at start:
  ./compileTestRailCSVreport.sh $filename
done < all_csvs.txt

rm all_csvs.txt