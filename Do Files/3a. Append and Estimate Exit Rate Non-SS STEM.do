/*

This file appends all the cleaned up data from the survey years of 1993-2013 and classifies them as STEM exiters or not. It ensures that each 
id included is started with their *actual* highest degree observation, and deletes those observations that were never STEM. It creates the important 
STEM dummy variable.
It then runs the code that provides charts with the STEM exit rates of different demographics.
_________________________________________________________________________________________________________________________
Notes:

- IMPORTANT: This code categorizes all social sciences as NON-STEM, and health and medical jobs and degrees as STEM.*****
See "3b. Append and Estimate Exit Rate SS Stem" for the code that categorizes social sciences as STEM

- What I Mean by Finding *actual* highest degree*:
	Some people who were sampled again recieved a higher degree later. Therefore their "highest degree" is not actually the highest degree stated
	for their first observations. 

*/

clear 
set more off
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston\SESTAT Data Work"


*quietly {
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

sort id yrofsurvey
*Creating a stemdgr variable for those whose highest degree in the survey year was STEM or not; 1 means STEM degree
gen stemdgr =.
label var stemdgr "Highest Degree in STEM Dummy"
replace stemdgr = 0 if (highdgrmajor >=7 & highdgrmajor <= 11) | highdgrmajor == 18 | highdgrmajor == 19
replace stemdgr = 1 if stemdgr != 0 & highdgrmajor !=.
label define stemdgr 0 "Non-STEM Degree" 1 "STEM Degree"
label values stemdgr stemdgr

*Sort by id and year of highest degree; sorts numbers from lowest to highest. 
gsort +id +highdgryr5
* Now each observation of an id has the actual highest degree, so we can check for inconsistencies
by id: egen actualhigh = max(highdgryr5)
label var actualhigh "An individual's actual highest degree, which may have been completed in a later study"
*We need these variables to know who we need to get rid of (e.g., if someone always had a non-stem degree, then they should be dropped)
by id: egen allstemdgr = min(stemdgr)
by id: egen oncestemdgr = max(stemdgr)

label var allstemdgr "Always Had a STEM Degree"
label define allstemdgr 0 "Had a Non-STEM Degree at Least Once" 1 "Always Had a STEM Degree" 
label define oncestemdgr 0 "Always Had a Non-STEM Degree" 1 "Had a STEM Degree at Least Once" 
label values allstemdgr allstemdgr
label values oncestemdgr oncestemdgr

*drop people who only ever had non-stemdgr degrees; include is a temporary variable
gen include =1 
by id: replace include = 0 if oncestemdgr == 0
*drop earlier (non-stem) degree observations of people who once had a non-stem dgr and then switched to STEM degrees
by id: replace include = 0 if highdgryr5 != actualhigh & stemdgr == 0 & (_n == 1 | (include[_n-1] == 0 & _n != 1))
drop if include == 0
drop include
*Since we've dropped people who started off with non-stem degrees and then switched to STEM, we need to update this variable - some people now only have STEM degrees since we deleted their previous nonstem degrees
drop allstemdgr
by id: egen allstemdgr = min(stemdgr)
*Create dgrexit dummy, 1 indicates that they got a higher degree in non-STEM.
by id: gen dgrexit = 1 if stemdgr == 0 & _n!=1
replace dgrexit = 0 if dgrexit != 1
*mark the exit year of those who had a stemdgr degree and then switched to non-stemdgr higher degree. 
*If they still have a STEM job despite the degree change, the "replace stemexityear" commnand below overrides this
by id: gen stemexityear = highdgryr5 if dgrexit == 1
label var stemexityear "Year of Exit From STEM"

*Need to note whether someone's degree changed from their previous obsevation. 
by id: gen dgrchange = 1 if highdgryr5 != highdgryr5[_n-1] & _n != 1
replace dgrchange = 0 if dgrchange !=1
label var dgrchange "A Higher Degree Has Been Obtained Since Last Observation"
label define dgrchange 0 "No Degree Change From Previous Observation" 1 "Degree Change from the Previous Observation"
label values dgrchange dgrchange

*Now create the important instem variable; instem == 1 if they are in the field of STEM (through degree or job)
gen instem =.
label var instem "Within STEM through Job or Degree"
replace instem = 0 if jobcode == 4 | jobcode == 7 | jobcode == 8 | stemdgr == 0
*Note that having a STEM job overrides having switched to a non-STEM degree; someone could be assigned 0 in the line above for a nonstem-stem degree change but retain a oncestemdgr job - not an exiter
replace instem = 1 if (jobcode == 1 | jobcode == 2 | jobcode == 3 | jobcode == 5 | jobcode == 6) 
label define instem 1 "Within STEM" 0 "Not within STEM"
label values instem instem

*Priority categorization: if you have a STEM job or not. This should trump whether you got a higher degree in non-stem
by id: egen allstemjob = min(instem)
by id: egen oncestemjob = max(instem)  
label variable allstemjob "Always Had a STEM Job"
label variable oncestemjob "Had a STEM Job at Least Once"
label define allstemjob 0 "Had a Non-STEM Job at Least Once" 1 "Always Had a STEM Job" 
label define oncestemjob 0 "Always Had a Non-STEM Job" 1 "Had a STEM Job at Least Once" 
label values allstemjob nonstemjob
label values oncestemjob stemjob

*if you always had a STEM job, you should not count as an exit, even if you switched to a higher degree in non-stem. 
* E.g., computer science degrees and job and then a management degree and still maintains compsci job. See id: 100026389 for example
by id: replace stemexityear =. if allstemjob == 1 

* A more detailed summary of people's stem career status
gen stemworkstat =.
label var stemworkstat "Indicates Details of STEM Employment/Non-Employment Status"
replace stemworkstat = 0 if instem == 1
replace stemworkstat = 1 if jobcode == 4 | jobcode == 7
replace stemworkstat = 2 if (dgrexit ==1 | jobcode == 8) & noworkstud == 1
replace stemworkstat = 3 if jobcode == 8 & noworkstud != 1
label define stemworkstat 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working But in School" 3 "Not Working"
label values stemworkstat stemworkstat

by id: replace stemexityear = yrofsurvey if instem == 0
replace stemexityear = -1 if stemexityear ==. 
label define stemexityearlabel -1 "No STEM Exit"
label values stemexityear stemexityearlabel

sort id yrofsurvey
order id yrofsurvey highdgryr5 instem stemdgr stemexityear jobcode female 
sort id yrofsurvey

save "Data Files\longalldataSESTATnonSS.dta", replace

ds id yrofsurvey, not
reshape wide `r(varlist)', i(id) j(yrofsurvey)

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










