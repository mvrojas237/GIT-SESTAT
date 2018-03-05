clear 
set more off
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston Summer 2017\All Dropbox Files\SESTAT Data Work"

import excel "Documents\Test Data.xlsx", firstrow

gen temp =.
replace temp = 1 if ssdummy == "STEM"
replace temp = 0 if ssdummy == "Non-STEM"

drop ssdummy
rename temp ssdummy

********** Mark those who started their degree with Non-SS and then switched to SS, then delete all instances up until their actual highest degree ******
gsort +id +highdgryr5
gen degreetypechange = 0
gen mustdrop = 0
replace degreetypechange = 0
replace degreetypechange = 1 if (id == id[_n-1]) & highdgryr5 != highdgryr5[_n-1] & ssdummy == 1 
replace degreetypechange = degreetypechange[_n-1] if id == id[_n-1]  & ssdummy == 1 & ssdummy[_n-1] != 0
gsort +id -highdgryr5

replace degreetypechange = degreetypechange[_n-1] if id == id[_n-1]  & ssdummy == 0 //run through data again and make each id observation consistent
replace mustdrop = 1 if id == id[_n-1] & degreetypechange == 1 & ssdummy == 0
drop if mustdrop == 1

********** Mark those who started their degree in SS and then switched to Non-SS -- counts as an exit *******
replace degreetypechange = 0
gen ssexityear = 0
gsort +id +highdgryr5
replace ssexityear = highdgryr5 if (id == id[_n-1]) & ssdummy != ssdummy[_n-1]
replace degreetypechange = 1 if (id == id[_n-1]) & ssdummy != ssdummy[_n-1]
gsort +id -degreetypechange -yrofsurvey
replace ssexityear = ssexityear[_n-1] if id == id[_n-1] & ssdummy == 0 //run through data again and make each id observation consistent


********* Drop all occurances of someone who changed their highest degree year, in the same degree type *********
gsort +id +highdgryr5
replace degreetypechange = 0
replace degreetypechange = 1 if id == id[_n-1] & ((highdgryr5 != highdgryr5[_n-1] & ssdummy==ssdummy[_n-1] & ssdummy == 1 & ssexityear == 0) | degreetypechange[_n-1] == 1)
gsort +id -degreetypechange +yrofsurvey
replace mustdrop = 1 if id == id[_n-1] & (degreetypechange[_n-1] == 1 | mustdrop[_n-1] == 1) & degreetypechange != 1
drop if mustdrop == 1

******** Drop all occurances of people who never had a Social Science degree

drop if ssdummy == 0 & ssexityear == 0













****** METHOD 1: DELETE EVERYONE WHOSE *ACTUAL* HIGHEST DEGREE IS NOT SOCIAL SCIENCES ********

*Sorts people by their id and the year they go their highest degree according to each year's suvey. This fixes the problem of people who get a higher degree after a survey
sort id highdgryr5
gen mustdrop = 0
gen degreetypechange = 0

*Mark if there's any kind of degree change
replace degreetypechange = 1 if (id == id[_n-1]) & highdgryr5 != highdgryr5[_n-1]
gsort +id -degreetypechange
*Mark if there's any degree change at any point
replace degreetypechange = degreetypechange[_n-1] if id == id[_n-1]

*Drop any observations of an id before their actual highest degree
gsort +id -highdgryr5
drop if (id == id[_n-1] & degreetypechange == 1 & highdgryr5 < highdgryr5[_n-1]) 

*Alternative
*replace mustdrop = 1 if (id == id[_n-1] & degreetypechange == 1 & highdgryr5 < highdgryr5[_n-1]) | (id == id[_n-1] & mustdrop[_n-1] == 1)
*drop if mustdrop == 1

drop if ssdummy == 0




















