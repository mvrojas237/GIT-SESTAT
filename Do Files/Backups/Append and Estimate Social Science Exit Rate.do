clear 
set more off
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston Summer 2017\All Dropbox Files\SESTAT Data Work"

/*
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

*First, drop people who did not start off in SS. Dummy variable categorizes them as SS or Non-SS
gen ssdummy =.
replace ssdummy = 1 if (highdgrmajor == "Economics" | highdgrmajor == "Psychology" | highdgrmajor == "Sociology & Anthropology" ///
| highdgrmajor == "Other Social Sciences" | highdgrmajor == "Political and Related Sciences") 

replace ssdummy = 0 if (highdgrmajor != "Economics" & highdgrmajor != "Psychology" & highdgrmajor != "Sociology & Anthropology" ///
& highdgrmajor != "Other Social Sciences" & highdgrmajor != "Political and Related Sciences") 


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

*No use for these anymore
drop degreetypechange mustdrop ssdummy


save "Data Files\longalldataSESTATsocialscience.dta", replace

reshape wide working gender sciencegroup highdgryr5 highdgrtype highdgrmajor minrty jobcode race uscitizen weight compact developact ///
manageact researchact jobactivity teachact emplstat noworknoneed noworkstud reasoncareer reasonloc reasonnojob ///
reasonother reasonpay reasoncondition salary recentdgryr5 recentdgrtype birthplace age noworkfam noworklay ///
noworknojob noworkother reasonfam num1reason ssexityear, i(id) j(yrofsurvey)

save "Data Files\widealldataSESTATsocialscience.dta", replace
*/

clear
set more off
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston Summer 2017\All Dropbox Files\SESTAT Data Work"

clear 
set more off
* 1993 SURVEY
*Estimates exit rates for people who first appeared in the 1993 survey 
*Highest Degree
use "Data Files\widealldataSESTATsocialscience.dta"
gen year = "1993"
drop if highdgryr51993 !=1990
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Highest Degree\survey93exitratesHDSS.dta", replace 

*Most Recent Degree
use "Data Files\widealldataSESTATsocialscience.dta"
gen year = "1993"
drop if recentdgryr51993 !=1990 
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Most Recent Degree\survey93exitratesMRDSS.dta", replace 

***********************************
* 1995 SURVEY
*Estimates exit rates for people who first appeared in the 1995 survey
clear 
set more off
*Highest Degree
use "Data Files\widealldataSESTATsocialscience.dta"
gen year = "1995"
drop if highdgryr51995 !=1990
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Highest Degree\survey95exitrates.dta", replace


*Most Recent Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if recentdgryr51995 !=1990 
gen year = "1995"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Most Recent Degree\survey95exitratesMRDSS.dta", replace 

***********************************
* 1997 SURVEY
*Estimates exit rates for people who first appeared in the 1997 survey
clear 
set more off
*Highest Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if highdgryr51997 !=1995
gen year = "1997"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Highest Degree\survey97exitratesHDSS.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if recentdgryr51997 !=1995
gen year = "1997"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Most Recent Degree\survey97exitratesMRDSS.dta", replace 

***********************************
* 1999 SURVEY
*Estimates exit rates for people who first appeared in the 1999 survey
clear 
set more off
*Highest Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if highdgryr51999 != 1995
gen year = "1999"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Highest Degree\survey99exitratesHDSS.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if recentdgryr51999 !=1995
gen year = "1999"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Most Recent Degree\survey99exitratesMRDSS.dta", replace 

***********************************
* 2001 SURVEY
*Estimates exit rates for people who first appeared in the 2001 survey
clear 
set more off
*Highest Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if highdgryr52001 !=2000
gen year = "2001"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Highest Degree\survey01exitratesHDSS.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if recentdgryr52001 !=2000
gen year = "2001"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Most Recent Degree\survey01exitratesMRDSS.dta", replace 

***********************************
* 2003 SURVEY
*Estimates exit rates for people who first appeared in the 2003 survey
clear 
set more off
*Highest Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if highdgryr52003 !=2001
gen year = "2003"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Highest Degree\survey03exitratesHDSS.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if recentdgryr52003 !=2001
gen year = "2003"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Most Recent Degree\survey03exitratesMRDSS.dta", replace 

***********************************
* 2006 SURVEY
*Estimates exit rates for people who first appeared in the 2006 survey
clear 
set more off
*Highest Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if highdgryr52006 != 2001
gen year = "2006"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Highest Degree\survey06exitratesHDSS.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if recentdgryr52006 !=2001
gen year = "2006"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Most Recent Degree\survey06exitratesMRDSS.dta", replace 

***********************************
* 2008 SURVEY
*Estimates exit rates for people who first appeared in the 2008 survey
clear 
set more off
*Highest Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if highdgryr52008 !=2006
gen year = "2008"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Highest Degree\survey08exitratesHDSS.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if recentdgryr52008 !=2006
gen year = "2008"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Most Recent Degree\survey08exitratesMRDSS.dta", replace 

***********************************
* 2010 SURVEY
*Estimates exit rates for people who first appeared in the 2010 survey
clear 
set more off
*Highest Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if highdgryr52010 != 2006
gen year = "2010"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Highest Degree\survey10exitratesHDSS.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if recentdgryr52010 !=2006
gen year = "2010"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Most Recent Degree\survey10exitratesMRDSS.dta", replace 

***********************************
* 2013 SURVEY
*Estimates exit rates for people who first appeared in the 2013 survey
clear 
set more off

*Highest Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if highdgryr52013 != 2011
gen year = "2013"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Highest Degree\survey13exitratesHDSS.dta", replace

*Most Recent Degree
use "Data Files\widealldataSESTATsocialscience.dta"
drop if recentdgryr52013 !=2011
gen year = "2013"
do "Do Files\Exit Rate Generator SS.do"
save "Data Files\Following Grads\Social Science\Most Recent Degree\survey13exitratesMRDSS.dta", replace 

***********************************










