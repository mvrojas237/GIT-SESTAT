/*
This file appends all the cleaned up data from the survey years of 1993-2013 and runs the code that provides charts with the STEM exit rates of different demographics.
It ensures that each id included is started with their *actual* highest degree observation, and deletes those observations that were never STEM. It creates the important 
STEM dummy variable.

NOTE: This code categorizes all social sciences as NON-STEM, and health and medical jobs and degrees as STEM. 
See "Append and Estimate Exit Rate SS Stem" for the code that categorizes social sciences as STEM

changecareer changecon changefam changelay changeloc changeother changeret changeschool changepay child12 child2 child25 child6 child611 childlegal childteen compact developact dgrlochigh dgrlocrecent employed empsect experfull experpart facten female govsup highdgrmajor highdgrtype highdgryr5 hrswork id jobcode jobcode2 jobrelate jobweeks lookwrk rdmajor2 workstat supervisor rdmajor

*/
clear 
set more off
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston\SESTAT Data Work"


quietly {
*You don't have to keep running this over and over; that's why it's commented out in green (takes a long time to run)	
use "Data Files\cleanedup93.dta"
append using "Data Files\cleanedup95.dta", force
append using "Data Files\cleanedup97.dta", force
append using "Data Files\cleanedup99.dta", force
append using "Data Files\cleanedup2001.dta", force
append using "Data Files\cleanedup2003.dta", force
append using "Data Files\cleanedup2006.dta", force
append using "Data Files\cleanedup2008.dta", force
append using "Data Files\cleanedup2010.dta", force
append using "Data Files\cleanedup2013.dta", force

***Dropping the people that had nonSTEM degree first

*Creating a stemdgrdummy variable for those whose highest degree in the survey year was STEM or not; 1 means STEM degree
gen stemdgrdummy =.
replace stemdgrdummy = 0 if (highdgrmajor >=7 & highdgrmajor <= 11) | highdgrmajor == 18 | highdgrmajor == 19
replace stemdgrdummy = 1 if stemdgrdummy != 0
label variable stemdgrdummy "Highest Degree in STEM Dummy"

/*
Find *actual* highest degree*:
Some people who were sampled again recieved a higher degree later. Therefore their "highest degree" is not actually the highest degree stated
for their first observations. 

Therefore, we need to delete all instances up until their actual highest degree, unless they originally had a STEM degree and then switched to 
a higher Non-STEM degree -- in that case, such a switch is an exit.

This code works by sorting observations by id and highest degree year, then marking all observations of an id as having a degree change if one 
exists, and then dealing them appropriately.
*/

******* First take care of people with degree changes who ONLY had STEM degrees. Delete prior instances of STEM degrees **********

/*Sort by id and year of highest degree; sorts numbers from lowest to highest. degreechange is a dummy: 1 if a person got a higher degree in **STEM** specifically
It doesn't matter if they had a non-STEM first */
gsort +id +highdgryr5
gen degreechange = 0
gen mustdrop = 0

*If the observation above it has the same id but a lower degree, then we need to mark a highest degree change. The higher degree should be in STEM for us to care
replace degreechange = 1 if (id == id[_n-1]) & highdgryr5 > highdgryr5[_n-1] & stemdgrdummy == 1 
replace degreechange = degreechange[_n-1] if id == id[_n-1] & stemdgrdummy == 1 & stemdgrdummy[_n-1] == 1
/*run through data again and make each id observation consistent; now sort degree from actual highest degree to lowest. If the observation before it has the same
id, but this (earlier) observation had a stem degree, we want to mark them as having had a degree change*/
gsort +id -highdgryr5 +yrofsurvey
replace degreechange = degreechange[_n-1] if id == id[_n-1] & stemdgrdummy == 1 

/*Must drop earlier observations if a person recieved a higher degree. So drop if the person before it has the same id and there did exist a degree change.
or it's been determined already that the previous observation had an incorrect highest degree */
replace mustdrop = 1 if id == id[_n-1] & degreechange == 1 & (highdgryr5 < highdgryr5[_n-1] | mustdrop[_n-1] == 1)
drop if mustdrop == 1
drop mustdrop degreechange

********** Now we deal with people who recieved a higher degree in non-STEM after originally recieving a STEM degree: a STEM exit *******
* Reset degree changes from previous code
gen stemexityear = 0
label variable stemexityear "Year of Exit From STEM"
gsort +id +highdgryr5

*If the observation above it had a STEM degree but the current observation does not, there was an exit
replace stemexityear = highdgryr5 if (id == id[_n-1]) & stemdgrdummy[_n-1] == 1 & stemdgrdummy == 0
*Make all observations consistent; stemexityear should be the same for the same id observations
gsort id -stemexityear
replace stemexityear = stemexityear[_n-1] if id == id[_n-1]


******** Drop all occurances of people who never had a STEM degree

drop if stemdgrdummy == 0 | stemexityear != 0
*****************************************************

*Now create the important stemdummy variable; stedummy == 1 if they are working in STEM
gen stemdummy =.
replace stemdummy = 1 if (jobcode == 1 | jobcode == 2 | jobcode == 3 | jobcode == 5 | jobcode == 6)
replace stemdummy = 0 if (jobcode == 4 | jobcode == 7) | stemexityear != 0

* A more detailed summary of people's exits
gen whystemexit =.
replace whystemexit = 0 if stemdummy == 1
replace whystemexit = 1 if stemexityear != 0
replace whystemexit = 2 if jobcode == 8
replace whystemexit = 3 if jobcode == 4 | jobcode == 7
label define whystemexitlabel 0 "Working in STEM" 1 "Received Higher Degree in Non-STEM" 2 "Not Working" 3 "Not Working in STEM"
label values whystemexit whystemexitlabel


order id yrofsurvey highdgryr5 stemdummy stemdgrdummy stemexityear jobcode female 

save "Data Files\longalldataSESTATnonSS.dta", replace

reshape wide age changecareer changecon changefam changelay changeloc changeother changepay changeret changeschool child12 child2 child25 child6 child611 childlegal ///
childteen compact developact dgrlochigh dgrlocrecent employed empsect experfull experpart facten female govsup highdgrmajor ///
highdgrtype highdgryr5 hrswork jobcode jobcode2 jobrelate jobweeks lookwrk manageact minrty multipleact needother needss ///
needstem noworkfam noworklay noworknojob noworknoneed noworkother noworkstud num1reason race rdmajor rdmajor2 reasoncareer reasoncondition reasonfam reasonloc ///
reasonnojob reasonother reasonpay recentdgrtype recentdgryr5 researchact researchdevelopact salary sciencegroup stemdgrdummy stemdummy stemexityear supervisor ///
survid teachact usborn uscitizen weight whystemexit working workstat, i(id) j(yrofsurvey)

save "Data Files\widealldataSESTATnonSS.dta", replace
}
*/

clear 
set more off
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston\SESTAT Data Work"


* 1993 SURVEY
*Estimates exit rates for people who first appeared in the 1993 survey 
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr51993 !=1990 
gen year = "1993"
do "Do Files\4a. Exit Rate Generator Non-SS STEM.do"
destring year, replace
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey93exitratesHD.dta", replace 

*Most Recent Degree can be found in a backup file...they're pretty annoying and we probably won't use them
***********************************

* 1995 SURVEY
*Estimates exit rates for people who first appeared in the 1995 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
gen year = "1995"
drop if highdgryr51995 !=1990 | female1993 !=.
drop *1993
do "Do Files\4a. Exit Rate Generator Non-SS STEM.do"
destring year, replace
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey95exitratesHD.dta", replace

***********************************

* 1997 SURVEY
*Estimates exit rates for people who first appeared in the 1997 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr51997 !=1995 | female1993 !=. | female1995 !=.
drop *1993 *1995
gen year = "1997"
do "Do Files\4a. Exit Rate Generator Non-SS STEM.do"
destring year, replace
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey97exitratesHD.dta", replace

***********************************

* 1999 SURVEY
*Estimates exit rates for people who first appeared in the 1999 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr51999 != 1995 | female1993 !=. | female1995 !=. | female1997 !=. 
drop *1993 *1995 *1997
gen year = "1999"
do "Do Files\4a. Exit Rate Generator Non-SS STEM.do"
destring year, replace
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey99exitratesHD.dta", replace

***********************************

* 2001 SURVEY
*Estimates exit rates for people who first appeared in the 2001 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
gen year = "2001"
drop if highdgryr52001 !=2000 | female1993 !=. | female1995 !=. | female1997 !=. | female1999 !=.
drop *1993 *1995 *1997 *1999
do "Do Files\4a. Exit Rate Generator Non-SS STEM.do"
destring year, replace
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey01exitratesHD.dta", replace

***********************************

* 2003 SURVEY
*Estimates exit rates for people who first appeared in the 2003 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr52003 !=2001 | female1993 !=. | female1995 !=. | female1997 !=. | female1999 !=. | female2001 !=.
drop *1993 *1995 *1997 *1999 *2001
gen year = "2003"
do "Do Files\4a. Exit Rate Generator Non-SS STEM.do"
destring year, replace
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey03exitratesHD.dta", replace

***********************************

* 2006 SURVEY
*Estimates exit rates for people who first appeared in the 2006 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr52006 != 2001 | female1993 !=. | female1995 !=. | female1997 !=. | female1999 !=. | female2001 !=. | female2003 !=.
drop *1993 *1995 *1997 *1999 *2001 *2003
gen year = "2006"
do "Do Files\4a. Exit Rate Generator Non-SS STEM.do"
destring year, replace
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey06exitratesHD.dta", replace

***********************************

* 2008 SURVEY
*Estimates exit rates for people who first appeared in the 2008 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr52008 != 2006 | female1993 !=. | female1995 !=. | female1997 !=. | female1999 !=. | female2001 !=. | female2003 !=. | female2006 !=.
drop *1993 *1995 *1997 *1999 *2001 *2003 *2006
gen year = "2008"
do "Do Files\4a. Exit Rate Generator Non-SS STEM.do"
destring year, replace
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey08exitratesHD.dta", replace


***********************************

* 2010 SURVEY
*Estimates exit rates for people who first appeared in the 2010 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr52010 != 2006 | female1993 !=. | female1995 !=. | female1997 !=. | female1999 !=. | female2001 !=. | female2003 !=. | female2006 !=. | female2008 !=.
drop *1993 *1995 *1997 *1999 *2001 *2003 *2006 *2008
gen year = "2010"
do "Do Files\4a. Exit Rate Generator Non-SS STEM.do"
destring year, replace
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey10exitratesHD.dta", replace

***********************************

* 2013 SURVEY
*Estimates exit rates for people who first appeared in the 2013 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr52013 != 2011 | female1993 !=. | female1995 !=. | female1997 !=. | female1999 !=. | female2001 !=. | female2003 !=. | female2006 !=. | female2008 !=. | female2010 !=.
drop *1993 *1995 *1997 *1999 *2001 *2003 *2006 *2008 *2010
gen year = "2013"
do "Do Files\4a. Exit Rate Generator Non-SS STEM.do"
destring year, replace
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey13exitratesHD.dta", replace

***********************************










