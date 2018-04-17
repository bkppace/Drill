# DESCRIPTION
# Intended for use against TestRail test report exports. Converts a csv file from parameter $1 into md, then odt format.

# USAGE
# Uncomment the variable(s) at the start of this script that relate to your project. Then invoke this script (it must be in your $PATH) from a directory that has TestRail test run csv exports:
# thisScript.sh
# NOTES: You may need to only export the columns you need from the TestRail test run to csv, e.g. only: Title, Section, Status, and Defects, PLUS the ID column. Reason: if the source file has only as many columns as we want to pull from csvcut, it chokes; also if there are any newlines or commas in any csv field, it chokes (and none of those mentioned fields ever contain newlines--or SHOULDN'T.)

# TO DO
# Make project name parameter (and use it) which, if present, overrides any set PROJECT_NAME variable; OR retrieve that name from TestRail and/or GitHub?
# Change gsed requirement to gsed installed as sed (overriding mac/'nix built-in sed.)
# ~ gfind?


# CODE

# ====
# PROJECT-SPECIFIC GLOBALS; uncomment relevant lines:

PROJECT_NAME="myLIFTER Android"
GitHubPROJECT_NAME="myLifter2-android"

# PROJECT_NAME="MySmartBlinds-Android-2.0"
# GitHubPROJECT_NAME="MySmartBlinds-Android-2.0"

# PROJECT_NAME="MySmartBlinds-iOS"
# GitHubPROJECT_NAME="MySmartBlinds-iOS"

# PROJECT_NAME="GarageSmart Bluetooth Communication Bid"
# GitHubPROJECT_NAME="GarageSmart Bluetooth Communication Bid"

# PROJECT_NAME="GarageSmart Sync Bid"
# GitHubPROJECT_NAME="GarageSmart Sync Bid"

# PROJECT_NAME="Prototype-SmartTrack-iOS"
# GitHubPROJECT_NAME="Prototype-SmartTrack-iOS"

PREPARER_AND_TITLE="Alex Hall, Software Tester"
# END PROJECT-SPECIFIC GLOBALS
# ====

# Variable(s) derived from PROJECT_NAME; note that characters :/ that would cause sed confusion are escaped:
defectsURL="https:\/\/github\.com\/NewVistas\/""$GitHubPROJECT_NAME""\/issues\/"

filename=$1
    # echo $filename

# Strip any starting ./ off $filename--I hate that I'm doing this with sed:
filename=`echo "$filename" | sed 's/\.\/\(.*\)/\1/g'`
# Strip file extension off that:
fileNameNoExt=${filename%.*}
echo fileNameNoExt value is\:
echo $fileNameNoExt

echo ~
# Only convert for this file name if intermediate "$fileNameNoExt".md doesn't exist:
if [ ! -f "$fileNameNoExt".md ]
then
  echo Compiling report from file\:
  echo $filename \(fileNameNoExt $fileNameNoExt\)
  tmp_csv_as_txt_workingFileName=DRUXESaMz_tmp_"$fileNameNoExt"_mainTable.txt
  tmp_md_workingFileName=DRUXESaMz_tmp_"$fileNameNoExt"_mainTable.md
  # Extract only the csv fields we want, into different files as we only want to process text on one of them:
  csvcut -c Title,Section,Status $filename > _tmp_MainTable_SGxfQm5Mj.txt
# "Title","Defects","Section","Status"
  csvcut -c Defects $filename > _tmp_DefectsCol_q3r2z968ff.txt
  # Bold all tests of status "Failed" and "Blocked": also italicize statuses of "Untested":
  gsed -i 's/,Failed/,\*\*Failed\*\*/g' _tmp_MainTable_SGxfQm5Mj.txt
  gsed -i 's/,Blocked/,\*\*Blocked\*\*/g' _tmp_MainTable_SGxfQm5Mj.txt
  gsed -i 's/,Retest/,\*\*Retest\*\*/g' _tmp_MainTable_SGxfQm5Mj.txt
  gsed -i 's/,Untested/,\*Untested\*/g' _tmp_MainTable_SGxfQm5Mj.txt
  # Replace any GitHub issue numbers in the last column to URL(s) to the issue(s), in bold:
  sedCommand="s/^\([0-9]\{1,\}\)\$/\*[\1 (link)]\($defectsURL\1\)\*/g"
  gsed -i "$sedCommand" _tmp_DefectsCol_q3r2z968ff.txt
  # Because Pandoc deletes empty cells, fill empty ones in the last column with a tilde:
  gsed -i 's/^""$/\*~\*/g' _tmp_DefectsCol_q3r2z968ff.txt
  # Join the columns in the two csv files into one file (delimited by a comma) :
  paste -d, _tmp_MainTable_SGxfQm5Mj.txt _tmp_DefectsCol_q3r2z968ff.txt > $tmp_csv_as_txt_workingFileName
  # Convert to a markdown table:
  csvtomd $tmp_csv_as_txt_workingFileName > $tmp_md_workingFileName

  # Change the markdown table alignment from center-aligned to left (removing extraneous dashes also):
  gsed -i 's/|:[-]\{1,\}:/|:-/g' $tmp_md_workingFileName
  # Change the header words:
  gsed -i "1s/.*/| *Test* | *Domain* | *Status* | *GitHub Issue* |/" $tmp_md_workingFileName

  # Create a document header:
  echo "# $PROJECT_NAME Test Report" > cZrD55zz4_tmp_header.md
  echo "Prepared by $PREPARER_AND_TITLE, TESSERACT LAB" >> cZrD55zz4_tmp_header.md
  echo "" >> cZrD55zz4_tmp_header.md
      # Reformat and extract the newest date from the "Tested On" column, and use that in place of what was previously "DATEHERE" in an output temp markdown header:
      # First get that column and remove the column header:
      csvcut -c "Tested On" $filename | tail -n +2 > _tmp_Tested_On_col_q3r2z968ff.txt
      # Reformat to dates that make more sense to computers and Europeans:
      gsed -i 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\) .*/\3-\1-\2/g' _tmp_Tested_On_col_q3r2z968ff.txt
      # Grab "highest" Tested On date from that and put it in a variable:
        testCompleted=`gsort -r _tmp_Tested_On_col_q3r2z968ff.txt | head -n 1`
  echo "## Full test run completed $testCompleted" >> cZrD55zz4_tmp_header.md
      # Count the instances of "passed" and all table data rows, and divide passed by rows to get percent passed, and use all these to fill the details on the following line automatically:
      # GET THE NUMBER of cases:
      # Count the total rows (number of issues) :
      numCases=`wc -l < $tmp_md_workingFileName`
      # substract two from that (the column titles and column alignment definition rows):
      numCases=$(( numCases - 2))
      # GET THE NUMBER of passed test cases:
      numCasesPassed=`grep -c Passed $tmp_md_workingFileName`
      # GET THE PERCENT that passed; note that without scale=1, bc returns 0 (dunno why) :
      percentPassed=`echo "scale=1; $numCasesPassed / $numCases * 100" | bc`
      percentPassed=`echo ${percentPassed%.*}`      # https://stackoverflow.com/a/8356850/1397555
  echo "$numCasesPassed of $numCases tests passed, ""$percentPassed""% passed." >> cZrD55zz4_tmp_header.md
  # Information requirements in all test runs:
  printf "\n- Git commit:\n- Device:\n- Operating system:\n\n" >> cZrD55zz4_tmp_header.md
  
  cat cZrD55zz4_tmp_header.md $tmp_md_workingFileName > "$fileNameNoExt".md
  
  # Convert to semifinal format importable by google docs:
# TO DO: implement a table style that isn't wretchedly non-useful; re: https://github.com/jgm/pandoc/issues/3275#issuecomment-264692160
# ex. command: pandoc --print-default-data-file reference.docx > myref.docx
      # TRIED this command and it failed: pandoc "$fileNameNoExt".md --print-default-data-file tableStyleReference.odt > "$fileNameNoExt".odt
      # DEPRECATED, because html table output and documents look *so* much better:
      # pandoc "$fileNameNoExt".md -o "$fileNameNoExt".odt
  pandoc "$fileNameNoExt".md -o "$fileNameNoExt".html
  
  # Delete temp files:
  rm  _tmp_MainTable_SGxfQm5Mj.txt _tmp_DefectsCol_q3r2z968ff.txt $tmp_csv_as_txt_workingFileName $tmp_md_workingFileName cZrD55zz4_tmp_header.md _tmp_Tested_On_col_q3r2z968ff.txt
          # DEPRECATED, because a read loop skips user prompts:
          # echo 
          # read -p "FINISHED and created "$fileNameNoExt".odt. Open that document [y/n]?" -n 1 -r
          # echo
          # if [[ $REPLY =~ ^[Yy]$ ]]
          # then
          #     open "$fileNameNoExt".odt
          # fi
else
  echo SKIPPING CONVERSION, as intermediate markdown file "$fileNameNoExt".md already exists. To convert the source file $filename, delete the .md intermediate and run this script again.
fi
