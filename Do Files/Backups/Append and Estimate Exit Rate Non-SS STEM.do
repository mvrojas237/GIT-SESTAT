clear 
set more off
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston\SESTAT Data Work"

/*
quietly {
*You don't have to keep running this over and over; that's why it's commented out in green (takes a long time to run)	
use "Data Files\cleanedup93.dta"
append using "Data Files\cleanedup95.dta"
append using "Data Files\cleanedup97.dta"
append using "Data Files\cleanedup99.dta"
append using "Data Files\cleanedup2001.dta"
append using "Data Files\cleanedup2003.dta"
append using "Data Files\cleanedup2006.dta"
append using "Data Files\cleanedup2008.dta"
append using "Data Files\cleanedup2010.dta"
append using "Data Files\cleanedup2013.dta"

*Only looking at people from 1990 and on
drop if highdgryr5 < 1990

*Dropping the people that had nonSTEM degree first

gen stemdummy =.
replace stemdummy = 0 if (highdgrmajor >=7 & highdgrmajor <= 11) | highdgrmajor== 18 | highdgrmajor == 19
replace stemdummy = 1 if stemdummy != 0
label variable stemdummy "Currently Working in STEM Dummy"

********** Delete all instances up until their actual highest degree of those who started their degree with STEM and then switched to Non-STEM *********
gsort +id +highdgryr5
gen degreetypechange = 0
gen mustdrop = 0
replace degreetypechange = 0
replace degreetypechange = 1 if (id == id[_n-1]) & highdgryr5 != highdgryr5[_n-1] & stemdummy == 1 
replace degreetypechange = degreetypechange[_n-1] if id == id[_n-1]  & stemdummy == 1 & stemdummy[_n-1] != 0
gsort +id -highdgryr5

replace degreetypechange = degreetypechange[_n-1] if id == id[_n-1]  & stemdummy == 0 //run through data again and make each id observation consistent
replace mustdrop = 1 if id == id[_n-1] & degreetypechange == 1 & stemdummy == 0
drop if mustdrop == 1

********** Mark the year of those who started their degree in STEM and then switched to Non-STEM -- counts as an exit *******
replace degreetypechange = 0
gen stemexitdgryear = 0
label variable stemexitdgryear "STEM Exit Through Degree"
gen stemexityear = 0 //delete later, testing
label variable stemexityear "Year of Exit From STEM"
gsort +id +highdgryr5
replace stemexitdgryear = highdgryr5 if (id == id[_n-1]) & stemdummy != stemdummy[_n-1]
replace degreetypechange = 1 if (id == id[_n-1]) & stemdummy != stemdummy[_n-1]
gsort +id -degreetypechange -yrofsurvey
replace stemexitdgryear = stemexitdgryear[_n-1] if id == id[_n-1] & stemdummy == 0 //run through data again and make each id observation consistent
replace stemexityear = stemexitdgryear

********* Drop all occurances of someone who changed their highest degree year, in the same degree type *********
gsort +id +highdgryr5
replace degreetypechange = 0
replace degreetypechange = 1 if id == id[_n-1] & ((highdgryr5 != highdgryr5[_n-1] & stemdummy==stemdummy[_n-1] & stemdummy == 1 & stemexitdgryear == 0) | degreetypechange[_n-1] == 1)
gsort +id -degreetypechange +yrofsurvey
replace mustdrop = 1 if id == id[_n-1] & (degreetypechange[_n-1] == 1 | mustdrop[_n-1] == 1) & degreetypechange != 1
drop if mustdrop == 1

******** Drop all occurances of people who never had a STEM degree

drop if stemdummy == 0 & stemexitdgryear == 0

*No use for these anymore
drop degreetypechange mustdrop


save "Data Files\longalldataSESTATnonSS.dta", replace

reshape wide working female sciencegroup highdgryr5 highdgrtype highdgrmajor minrty jobcode race uscitizen weight compact developact ///
manageact researchact multipleact teachact emplstat noworknoneed noworkstud reasoncareer reasonloc reasonnojob ///
reasonother reasonpay reasoncondition salary recentdgryr5 recentdgrtype birthplace age noworkfam noworklay ///
noworknojob noworkother reasonfam num1reason stemdummy stemexityear stemexitdgryear, i(id) j(yrofsurvey)

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
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey93exitratesHD.dta", replace 

*Most Recent Degree
use "Data Files\widealldataSESTATnonSS.dta"
drop if recentdgryr51993 !=1990 
gen year = "1993"
*Don't need to worry about highest degree type changing because we're only looking at the most recent degree
foreach x of var degreetypechange* {
	replace `x' = ""
}
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Most Recent Degree\survey93exitratesMRD.dta", replace 

***********************************

* 1995 SURVEY
*Estimates exit rates for people who first appeared in the 1995 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
gen year = "1995"
drop if highdgryr51995 !=1990
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey95exitratesHD.dta", replace


*Most Recent Degree
use "Data Files\widealldataSESTATnonSS.dta"
drop if recentdgryr51995 !=1990 
gen year = "1995"
*Don't need to worry about highest degree type changing because we're only looking at the most recent degree
foreach x of var degreetypechange* {
	replace `x' = ""
}
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Most Recent Degree\survey95exitratesMRD.dta", replace 

***********************************

* 1997 SURVEY
*Estimates exit rates for people who first appeared in the 1997 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr51997 !=1995
gen year = "1997"
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey97exitratesHD.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATnonSS.dta"
drop if recentdgryr51997 !=1995
gen year = "1997"
*Don't need to worry about highest degree type changing because we're only looking at the most recent degree
foreach x of var degreetypechange* {
	replace `x' = ""
}
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Most Recent Degree\survey97exitratesMRD.dta", replace 

***********************************

* 1999 SURVEY
*Estimates exit rates for people who first appeared in the 1999 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr51999 != 1995
gen year = "1999"
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey99exitratesHD.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATnonSS.dta"
drop if recentdgryr51999 !=1995
gen year = "1999"
*Don't need to worry about highest degree type changing because we're only looking at the most recent degree
foreach x of var degreetypechange* {
	replace `x' = ""
}
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Most Recent Degree\survey99exitratesMRD.dta", replace 

***********************************

* 2001 SURVEY
*Estimates exit rates for people who first appeared in the 2001 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
gen year = "2001"
drop if highdgryr52001 !=2000
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey01exitratesHD.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATnonSS.dta"
drop if recentdgryr52001 !=2000
gen year = "2001"
*Don't need to worry about highest degree type changing because we're only looking at the most recent degree
foreach x of var degreetypechange* {
	replace `x' = ""
}
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Most Recent Degree\survey01exitratesMRD.dta", replace 

***********************************

* 2003 SURVEY
*Estimates exit rates for people who first appeared in the 2003 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr52003 !=2001
gen year = "2003"
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey03exitratesHD.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATnonSS.dta"
drop if recentdgryr52003 !=2001
gen year = "2003"
*Don't need to worry about highest degree type changing because we're only looking at the most recent degree
foreach x of var degreetypechange* {
	replace `x' = ""
}
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Most Recent Degree\survey03exitratesMRD.dta", replace 

***********************************

* 2006 SURVEY
*Estimates exit rates for people who first appeared in the 2006 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr52006 != 2001
gen year = "2006"
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey06exitratesHD.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATnonSS.dta"
drop if recentdgryr52006 !=2001
gen year = "2006"
*Don't need to worry about highest degree type changing because we're only looking at the most recent degree
foreach x of var degreetypechange* {
	replace `x' = ""
}
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Most Recent Degree\survey06exitratesMRD.dta", replace 

***********************************

* 2008 SURVEY
*Estimates exit rates for people who first appeared in the 2008 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr52008 !=2006
gen year = "2008"
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey08exitratesHD.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATnonSS.dta"
drop if recentdgryr52008 !=2006
gen year = "2008"
*Don't need to worry about highest degree type changing because we're only looking at the most recent degree
foreach x of var degreetypechange* {
	replace `x' = ""
}
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Most Recent Degree\survey08exitratesMRD.dta", replace 

***********************************

* 2010 SURVEY
*Estimates exit rates for people who first appeared in the 2010 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr52010 != 2006
gen year = "2010"
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey10exitratesHD.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATnonSS.dta"
drop if recentdgryr52010 !=2006
gen year = "2010"
*Don't need to worry about highest degree type changing because we're only looking at the most recent degree
foreach x of var degreetypechange* {
	replace `x' = ""
}
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Most Recent Degree\survey10exitratesMRD.dta", replace 

***********************************

* 2013 SURVEY
*Estimates exit rates for people who first appeared in the 2013 survey
*Highest Degree
clear 
set more off
use "Data Files\widealldataSESTATnonSS.dta"
drop if highdgryr52013 != 2011
gen year = "2013"
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Highest Degree\survey13exitratesHD.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATnonSS.dta"
drop if recentdgryr52013 !=2011
gen year = "2013"
*Don't need to worry about highest degree type changing because we're only looking at the most recent degree
foreach x of var degreetypechange* {
	replace `x' = ""
}
do "Do Files\Exit Rate Generator Non-SS STEM.do"
save "Data Files\Following grads\Non-Social Science STEM\Most Recent Degree\survey13exitratesMRD.dta", replace 

***********************************










