/* 
This do-file uses the original raw data files and renames the desired variables to usable names, labels the variables appropriately, 
and then cleans up individual observations. 

The desired variables are under different names and sometimes have different number categorizations for different years, so there is a 
renaming for each section: 1993-1999, 2001, 2003-2008, and 2010-2013. Make sure to include the desired variable in the "keep" command 
below the if statements

When adding new variables, ensure that you modify *each* if statement with the appropriate respective variable. Look at the original 
raw data source codebooks in the documentation for reference. Make sure to add to future "reshape" commands in do files (append and estimate, 
*/
 
set more off 
* Rename variables to usable names; variable names differ for different years
if yrofsurvey == 1993 {
	gen hrswk = ""
	gen mgroth = ""
	gen wkswkp = ""
	gen chtotpb =. 
	*total number of children is the sum of the number of children within ranges
	replace chtotpb = ch1217p + ch18pb + ch611pb + ch6pb 
	tostring chtotpb, replace
	gen ch1217in = "Y" if ch1217p > 0 & ch1217p != 98
	replace ch1217in = "L" if ch1217p == 98
	replace ch1217in = "N" if ch1217in == ""
	gen ch611in = "Y" if ch611p > 0 & ch611p != 98
	replace ch611in = "L" if ch611p == 98
	replace ch611in = "N" if ch611in == ""
	gen ch6in = "Y" if ch6pb > 0 & ch6pb != 98
	replace ch6in = "L" if ch6pb == 98
	replace ch6in = "N" if ch6in == ""
	gen ch25 = ""
	gen ch2in95= ""
	gen ch18in = "Y" if ch18pb > 0 & ch18pb != 98
	replace ch18in = "L" if ch18pb == 98
	replace ch18in = "N" if ch18in == ""

}
if yrofsurvey != 1993 & yrofsurvey != 1995 {
	gen expftpb =.
	gen expptpb =.
}
if (yrofsurvey < 2000) {
	*FOR 1993-1999 - inital variable list
			
	gen age = (yrofsurvey - biryrp) if biryrp != 9999 // 9999 means the birth year is missing
	rename actcap compact 
	rename actrdt multipleact
	rename actded developact
	rename actmgt manageact 
	rename actres researchact 
	rename actrd researchdevelopact
	rename acttch teachact 
	rename bthus usborn
	if yrofsurvey != 1999 {
		rename chchg changecareer 
		rename chcon changecon 
		rename chfam changefam 
		rename chlay changelay 
		rename chloc changeloc 
		rename chot changeother 
		rename chpay changepay 
		rename chret changeret 
		rename chsch changeschool 
	}
	else {
		gen changecareer = ""
		gen changecon = ""
		gen changefam = ""
		gen changelay = "" 
		gen changeloc = "" 
		gen changeother = "" 
		gen changepay = "" 
		gen changeret = "" 
		gen changeschool = "" 
	}
	*rename ch1217in child1218
	rename ch2in95 child2
	rename ctzusin uscitizen
	rename dgrdg highdgrtype
	rename dgrmedp highdgrmajor
	rename fptind workstat
	rename gender female
	rename hday5 highdgryr5
	rename hddgrus dgrlochigh
	rename hrswk hrswkp
	rename lfstat employed
	rename mrdg recentdgrtype
	rename mrdgrus dgrlocrecent
	rename mr5yr recentdgryr5	
	rename mrmemg rdmajor2
	rename mrmedp rdmajor
	rename nrchg reasoncareer
	rename nrcon reasoncondition  
	rename nrfam reasonfam
	rename nrloc reasonloc
	rename nrocna reasonnojob
	rename nrot reasonother
	rename nrpay reasonpay
	rename nrrea num1reason
	rename nwfam noworkfam 
	rename nwlay noworklay
	rename nwnond noworknoneed 
	rename nwocna noworknojob
	rename nwot noworkother
	rename nwstu noworkstud
	rename ocprpb jobcode2
	rename ocprmg jobcode
	rename racethp race
	rename refid id 
	rename salarp salary
	rename wrkg working
	
	

} 

if yrofsurvey > 1999 & yrofsurvey != 2013 {
	gen changecareer = ""
	gen changecon = ""
	gen changefam = ""
	gen changelay = ""
	gen changeloc = ""
	gen changeother = ""
	gen changepay = ""
	gen changeret = ""
	gen changeschool = ""
}
if yrofsurvey == 2001 {

	rename actcap compact 
	rename actrdt multipleact
	rename actded developact
	rename actmgt manageact 
	rename actrd researchdevelopact
	rename actres researchact
	rename acttch teachact 
	rename agep age 
	rename bthus usborn
	rename chtotpb numchild1
	rename chu2 child2
	rename ctzusin uscitizen
	rename dgrdg highdgrtype 
	rename dgrmedp highdgrmajor
	gen dgrlochigh = ""
	gen dgrlocrecent = ""
	if surid != "2" gen facten = ""
	rename fptind workstat
	rename gender female
	if surid != "2" gen govsup = ""
	rename hday5 highdgryr5		
	gen dgrloc = ""
	rename lfstat employed
	rename mrdg recentdgrtype
	gen numchild2 =""
	rename mr5yr recentdgryr5	
	if surid == "2" rename mrmedp rdmajor
	else rename mrmedp rdmajor
	if surid == "2" rename mrmemg rdmajor2
	else rename mrmemg rdmajor2
	rename nrchg reasoncareer
	rename nrcon reasoncondition 
	rename nrfam reasonfam
	rename nrloc reasonloc
	rename nrocna reasonnojob
	rename nrot reasonother
	rename nrpay reasonpay
	rename nrrea num1reason
	rename nwfam noworkfam 
	rename nwlay noworklay
	rename nwnond noworknoneed 
	rename nwocna noworknojob
	rename nwot noworkother
	rename nwstu noworkstud 
	rename ocprpb jobcode2
	rename racethp race			
	rename refid id 
	rename salarp salary
	rename wrkg working
	rename ocprmg jobcode
	rename wtsurvy weight 		

}

if (yrofsurvey == 2003 | yrofsurvey == 2006 | yrofsurvey == 2008) {

	rename actcap compact 
	rename actrdt multipleact
	rename actded developact
	rename actmgt manageact 
	rename actres researchact
	rename actrd researchdevelopact
	rename acttch teachact 
	rename agep age
	rename bthus usborn
	rename chtotpb numchild2
	gen numchild1 =""
	rename chu2 child2
	rename ctzusin uscitizen
	rename dgrdg highdgrtype 
	gen facten = ""
	if yrofsurvey != 2003 gen fptind = ""
	rename fptind workstat
	rename gender female
	rename hd03y5p highdgryr5
	gen dgrlochigh = ""
	gen dgrlocrecent = ""
	rename lfstat employed
	rename mrdg recentdgrtype
	rename mr03y5p recentdgryr5
	rename ndgmedp highdgrmajor
	rename nmrmemg rdmajor2
	rename nmrmedp rdmajor
	rename nocprmg jobcode
	rename nocprpb jobcode2
	rename nrchg reasoncareer
	rename nrcon reasoncondition 
	rename nrfam reasonfam
	rename nrloc reasonloc
	rename nrocna reasonnojob
	rename nrot reasonother
	rename nrpay reasonpay
	rename nrrea num1reason
	rename nwfam noworkfam 
	rename nwlay noworklay
	rename nwnond noworknoneed 
	rename nwocna noworknojob
	rename nwotp noworkother
	rename nwstu noworkstud 
	rename racethmp race
	rename refid id 
	rename salarp salary
	rename wrkg working
	
	if yrofsurvey == 2006 {
		gen mgroth = ""
		gen mgrsoc = ""
		gen mgrnat = ""
	}
	
	*Labeling jobcodes
	replace jobcode = "Computer and mathematical scientists" if jobcode == "1"
	replace jobcode = "Biological, agricultural and other life scientists" if jobcode == "2"
	replace jobcode = "Physical and related scientists" if jobcode == "3"
	replace jobcode = "Social and related scientists" if jobcode == "4"
	replace jobcode = "Engineers" if jobcode == "5"
	replace jobcode = "S and E related occupations" if jobcode == "6"
	replace jobcode = "Non-S and E Occupations" if jobcode == "7"
	replace jobcode = "Logical Skip" if jobcode == "8"
	
	replace highdgrmajor = "1" if highdgrmajor == "19889S"
	replace highdgrmajor = "2" if highdgrmajor == "22639S"
	replace highdgrmajor = "3" if highdgrmajor == "39889S" | highdgrmajor == "29889S"
	replace highdgrmajor = "4" if highdgrmajor == "318730"
	replace highdgrmajor = "5" if highdgrmajor == "33878S"
	replace highdgrmajor = "6" if highdgrmajor == "39899S"
	replace highdgrmajor = "7" if highdgrmajor == "41929S"
	replace highdgrmajor = "8" if highdgrmajor == "42929S"
	replace highdgrmajor = "9" if highdgrmajor == "43899S"
	replace highdgrmajor = "10" if highdgrmajor == "44999S"
	replace highdgrmajor = "11" if highdgrmajor == "45939S"
	replace highdgrmajor = "12" if highdgrmajor == "527250"
	replace highdgrmajor = "13" if highdgrmajor == "537260"
	replace highdgrmajor = "14" if highdgrmajor == "547280"
	replace highdgrmajor = "15" if highdgrmajor == "567350"
	replace highdgrmajor = "16" if highdgrmajor == "58799S"
	replace highdgrmajor = "17" if highdgrmajor == "61199S"
	replace highdgrmajor = "18" if highdgrmajor == "61999S" | highdgrmajor == "61999S" | highdgrmajor == "71999S"
	replace highdgrmajor = "19" if highdgrmajor == "79999S" 
	replace highdgrmajor = "20" if highdgrmajor == "69999S" 	
}

if yrofsurvey == 2008 | yrofsurvey == 2010 { 
	gen surid = ""
}
if yrofsurvey == 2010 | yrofsurvey == 2013 {
		
	rename actcap compact 
	rename actrdt multipleact
	rename actded developact
	rename actmgt manageact 
	rename actres researchact
	rename actrd researchdevelopact
	rename acttch teachact 
	rename agep age 
	rename bthus usborn
	if yrofsurvey == 2013 {
		rename chchg changecareer 
		rename chcon changecon 
		rename chfam changefam 
		rename chlay changelay 
		rename chloc changeloc 
		rename chot changeother 
		rename chpay changepay 
		rename chret changeret 
		rename chsch changeschool
		rename hddgrus dgrlochigh
		rename mrdgrus dgrlocrecent
	}
	if yrofsurvey == 2010 gen dgrlochigh = ""
	if yrofsurvey == 2010 gen dgrlocrecent = ""
	rename chtotpb numchild2
	rename chu2 child2
	gen numchild1 =""
	rename nmrmedp rdmajor
	rename ctzusin uscitizen
	rename dgrdg highdgrtype 
	gen dgrloc = ""
	gen facten = ""
	rename gender female
	rename hd03y5p highdgryr5
	rename lfstat employed
	rename mrdg recentdgrtype
	rename mr03y5p recentdgryr5
	rename nmrmemg rdmajor2
	rename ndgmedp highdgrmajor
	rename nrchg reasoncareer
	rename nrcon reasoncondition 
	rename nrfam reasonfam
	rename nrloc reasonloc
	rename nrocna reasonnojob
	rename nrot reasonother
	rename nrpay reasonpay
	rename nrrea num1reason
	rename nwfam noworkfam 
	rename nwlay noworklay
	rename nwnond noworknoneed 
	rename nwocna noworknojob
	rename nwstu noworkstud 
	rename nwotp noworkother
	rename n2ocprmg jobcode
	rename n2ocprpb jobcode2
	rename racethmp race
	rename refid id 
	rename salarp salary
	rename wrkg working
	gen workstat = ""

	
	*Labeling jobcodes
	replace jobcode = "Computer and mathematical scientists" if jobcode == "1"
	replace jobcode = "Biological, agricultural and other life scientists" if jobcode == "2"
	replace jobcode = "Physical and related scientists" if jobcode == "3"
	replace jobcode = "Social and related scientists" if jobcode == "4"
	replace jobcode = "Engineers" if jobcode == "5"
	replace jobcode = "S and E related occupations" if jobcode == "6"
	replace jobcode = "Non-S and E Occupations" if jobcode == "7"
	replace jobcode = "Logical Skip" if jobcode == "8"
	
	replace highdgrmajor = "1" if highdgrmajor == "19889S"
	replace highdgrmajor = "2" if highdgrmajor == "22639S"
	replace highdgrmajor = "3" if highdgrmajor == "29889S"
	replace highdgrmajor = "4" if highdgrmajor == "318730"
	replace highdgrmajor = "5" if highdgrmajor == "33878S"
	replace highdgrmajor = "6" if highdgrmajor == "39899S"
	replace highdgrmajor = "7" if highdgrmajor == "41929S"
	replace highdgrmajor = "8" if highdgrmajor == "42929S"
	replace highdgrmajor = "9" if highdgrmajor == "43899S"
	replace highdgrmajor = "10" if highdgrmajor == "44999S"
	replace highdgrmajor = "11" if highdgrmajor == "45939S"
	replace highdgrmajor = "12" if highdgrmajor == "527250"
	replace highdgrmajor = "13" if highdgrmajor == "537260"
	replace highdgrmajor = "14" if highdgrmajor == "547280"
	replace highdgrmajor = "15" if highdgrmajor == "567350"
	replace highdgrmajor = "16" if highdgrmajor == "58799S"
	replace highdgrmajor = "17" if highdgrmajor == "61199S"
	replace highdgrmajor = "18" if highdgrmajor == "61999S" | highdgrmajor == "61999S" | highdgrmajor == "71999S"
	replace highdgrmajor = "19" if highdgrmajor == "79999S" 
	replace highdgrmajor = "20" if highdgrmajor == "69999S" 	

}



* Common to all years (basically)
rename ch121*in childteen
rename ch1*in childlegal
rename ch25 child25
rename ch611in child611
rename ch6in child6
rename chun12 child12
rename emsecpb empsect
rename expftpb experfull
rename expptpb experpart
rename hrswkp hrswork
rename lookwk lookwrk
rename mgroth needother
rename mgrsoc needss
rename mgrnat needstem
rename ocedrlp jobrelate
rename supwk supervisor
rename surid survid
rename wkswkp jobweeks 

* There are a lot of variables that we don't need; we want just these:
keep age changecareer changecon changefam changelay changeloc changeother changeret changeschool changepay child12 child2 child25 child6 child611 childlegal childteen compact ///
developact dgrlochigh dgrlocrecent employed empsect experfull experpart facten female govsup highdgrmajor highdgrtype highdgryr5 hrswork id jobcode jobcode2 jobrelate jobweeks lookwrk ///
manageact minrty multipleact needother needss needstem noworkfam noworklay noworknojob noworknoneed noworkother noworkstud num1reason race rdmajor2 reasoncareer ///
reasoncondition reasonfam reasonloc reasonnojob reasonother reasonpay rdmajor recentdgrtype recentdgryr5 researchact researchdevelopact salary supervisor survid ///
teachact usborn uscitizen weight working workstat yrofsurvey 

label var age "Age"
label var allstemdgr "All the IDs' observations have STEM degrees dummy" 
label var changecareer "Reasons for Changing Employers/Occupations Between April 1993 and April 1995: Career change"
label var changecon "Reasons for Changing Employers/Occupations Between April 1993 and April 1995: Working Conditions"
label var changefam "Reasons for Changing Employers/Occupations Between April 1993 and April 1995: Family"
label var changelay "Reasons for Changing Employers/Occupations Between April 1993 and April 1995: Laid Off"
label var changeloc "Reasons for Changing Employers/Occupations Between April 1993 and April 1995: Job Location"
label var changeoth "Reasons for Changing Employers/Occupations Between April 1993 and April 1995: Other"
label var changepay "Reasons for Changing Employers/Occupations Between April 1993 and April 1995: Pay/Promotion"
label var changeret "Reasons for Changing Employers/Occupations Between April 1993 and April 1995: Retired"
label var changeschool "Reasons for Changing Employers/Occupations Between April 1993 and April 1995: School"
label var childteen "Children between ages 12-18 (pre 2001: 12-17 living in household) dummy"
label var childlegal "Children older than 19 (pre 2003: 18 living in household) dummy"
label var child25 "Children between ages 2-5 (pre 2001: living in household) dummy"
label var child611 "Children between ages 6-11 (pre 2001: living in household) dummy"
label var child6 "Children under 6 (pre 2001: living in household) dummy"
label var child12 "Children under 12 (pre 2001: living in household) dummy"
label var child2 "Children under 2 (pre 2001: living in household) dummy"
label var compact "Activity, Computer Applications"
label var developact "Activity, Development and Design"
label var dgrlochigh "Location of School Awarding Highest Degree (USA/Non-USA code)"
label var dgrlocrecent "Location of School Awarding Most Recent Degree (USA/Non-USA code)"
label var employed "Employment Status"
label var empsect "Employment Sector"
label var experfull "Years of Professional Work Experience: Full-Time"
label var experpart "Years of Professional Work Experience: Part-Time"
label var facten "Faculty Rank and Tenure Status"
label var female "Female Dummy" 
label var govsup "Federal Government Support Indicator"
label var highdgrmajor "Field of Major for Highest Degree"
label var highdgrtype "Type of Certificate or Degree, Highest Degree"
label var highdgryr5 "Year of Highest Degree (5-year intevals)"
label var hrswork "Hours worked weekly at principal job"
label var id "Reference/ID Number"
label var jobcode "Job Code for Principal Job (Recorded for Public Use)"
label var jobcode2 "Job Code for Principal Job, Further Broken Down"
label var jobrelate "Extent that Priciple Job Relates to Degree"
label var jobweeks "Principal Job Weeks Salary Based On (Recoded for public use)"
label var lookwrk "Not working, looking for work"
label var manageact "Activity, Management/sales"
label var minrty "Minority Indicator"
label var multipleact "Primary/secondary work activity on principal job: basic research/applied research/development/design/teaching"
label var needstem "Job required technical expertise at the bachelor's level or higher: eng, comp sci, math, nat sciences"
label var needother "Job required technical expertise at the bachelor's level or higher: Other fields [e.g. health/business]"
label var needss "Job required technical expertise at the bachelor's level or higher: social sciences"
label var noworkfam "Reasons for Not Working: Family"
label var noworklay "Reasons for Not Working: Layoff" 
label var noworknojob "Reasons for Not Working: No Suitiable Job Available"
label var noworknoneed "Reasons for Not Working: Not Need/Want work"
label var noworkother "Reasons for Not Working: other"
label var noworkstud "Reasons for Not Working: Student"
label var num1reason "Most important Reasons for Work Outside of Field" 
label var race "Race/Ethnicity"
label var rdmajor2 "Field of Major for Most Recent Degree: Major Group Classification"
label var reasoncareer "Reasons for Work Outside of Field: Career Change"
label var reasoncondition "Reasons for Work Outside of Field: Workding Conditions"
label var reasonfam "Reasons for Work Outside of Field: Family"
label var reasonloc "Reasons for Work Outside of Field: Location"
label var reasonnojob "Reasons for Work Outside of Field: No Suitable Job"
label var reasonother "Reasons for Work Outside of Field: Other"
label var reasonpay "Reasons for Work Outside of Field: Pay/Promotion"
label var rdmajor2 "Field of Major for Highest Degree (Major Group)"
label var rdmajor "Field of Major for Highest Degree"
label var recentdgrtype "Type of Degree, Most Recent Degree"
label var recentdgryr5 "Year of Most Recent Degree (5-year intervals)"
label var researchact "Activity, Research (Basic and/or Applied)"
label var researchdevelopact "Activity, Research and Development"
label var salary "Salary (Annualized for Public Use)"
label var supervisor "Supervised Others in Principal Job Dummy"
label var survid "Survey ID"
label var teachact "Activity, Teaching"
label var usborn "Born in the U.S."
label var uscitizen "U.S. Citizenship Status"
label var weight "SESTAT Weight"
label var working "Working for Pay During Reference Week"
label var workstat "Full-time or Part-Time Status During Reference Week: pre-2006"
label var yrofsur "Year Survey Conducted"

*Add notes about missing variables, etc
notes age: Missing Variables: For whatever reason, 1997 has a few missing birthyears
foreach var of varlist change* {
	notes `var': Missing Variables: The variable does not exist 1999-2010. For whatever reason, 1993-1997 have missing values, including deliberate exclusions because of confidentiality. 
}
notes child2: Missing Variables: The variable does not exist for 1993 (either in exact or dummy form).
notes child25: Missing Variables: The variable does not exist for 1993 (either in exact or dummy form).
notes dgrlochigh: Missing Variables: The variable is restricted use access for 2001-2010. For whatever reason, 1999 has a missing value.
notes dgrlocrecent: Missing Variables: The variable is restricted use access for 2001-2010. For whatever reason, 1999 has a missing value.
notes experfull: Missing Variables: The variable only exists for 1993 and 1995.
notes experpart: Missing Variables: The variable only exists for 1993 and 1995.
notes facten: Missing Variables: The variable is public access for 1993-2001, private for 2003, and does not exist afterwards. 
notes govsup: Missing Variables: Variable does not exist for the 2001 NSCG and NSRCG, and for whatever reason, a few missing values for SDR.
notes highdgrmajor: For whatever reason, a couple values are missing in 1995-1999.
notes hrswork: Missing Variables: Variable does not exist for 1993. 
notes jobweeks: Missing Variables: Variable does not exist for 1993.
notes needother: Missing Variables: Variable does not exist for 1993 or 2006.
notes needss: Missing Variables: Variable does not exist for 2006.
notes needstem: Missing Variables: Variable does not exist for 2006.
notes salary: Missing Variables: For whatever reason, 1993 has missing values 1995-1999. 
notes survid: Missing Variables: The survid variable does not exist for 2010, but the SDR participants can be identified by their doctorial degree. The ///
rest of the observations have missing values, as there does not exist a way to distinguish between the two surveys.
notes stemdgr: For whatever reason, a couple values are missing in 1995-1999.
notes survid: Note: The NSRCG was not conducted in 2013, and the NSCG was not conducted in 2001 DOUBLE CHECK THIS.
notes workstat: Note: part-time is working fewer than 35 hours a week. The variable does not exist post 2003, but was constructed based on hours worked (hrswork variable).
notes yrofsurvey: Note: The 2001 raw data, unlike all other years, was split into two: The SDR and NSRCG. Some variables only exist in one survey data file.


*Creating value labels
replace dgrlochigh = "1" if dgrlochigh == "Y"
replace dgrlochigh = "0" if dgrlochigh == "N"
replace dgrlochigh = "" if dgrlochigh == "M"
destring dgrlochigh, replace
label define dgrlochighlabel 0 "Non-U.S." 1 "U.S."
label values dgrlochigh dgrlochighlabel

replace dgrlocrecent = "1" if dgrlocrecent == "Y"
replace dgrlocrecent = "0" if dgrlocrecent == "N"
replace dgrlocrecent = "" if dgrlocrecent == "M"
destring dgrlocrecent, replace
label define dgrlocrecentlabel 1 "Non-U.S." 2 "U.S."
label values dgrlocrecent dgrlocrecentlabel

replace empsect = "-1" if empsect == "L"
destring empsect, replace
label define empsectlabel -1 "Logical Skip" 1 "2-Year College or Other School Sy" 2 "4-Year College or Medical Institution" 3 "Government" 4 "Business/Industry"
label values empsect empsectlabel

replace facten = "-1" if facten == "L"
replace facten = "-2" if facten == "X"
destring facten, replace
label define factenlabel -2 "Survey Exclusion/Confidentiality" -1 "Logical Skip" 1 "Rank and Tenured/On Tenure Track" 2 "Rank and Not on Tenure Track" ///
3 "Rank/Tenure NA or RANK NA/Tenured" 4 "Rank N/A and Not on tenure track/"
label values facten factenlabel


replace govsup = "-1" if govsup == "L"
replace govsup = "-2" if govsup == "X"
replace govsup = "1" if govsup == "Y"
replace govsup = "2" if govsup == "N"
destring govsup, replace
label define govsuplabel -2 "Survey Exclusion/Confidentiality" -1 "Logical Skip" 1 "Yes" 2 "No"
label values govsup govsuplabel

if (yrofsurvey <= 2001) {

	*Recoding degree types
	replace highdgrmajor = "1" if highdgrmajor == "19889S" 
	replace highdgrmajor = "2" if highdgrmajor == "22639S" 
	replace highdgrmajor = "3" if highdgrmajor == "29889S" 
	replace highdgrmajor = "4" if highdgrmajor == "318730"
	replace highdgrmajor = "5" if highdgrmajor == "33878S"
	replace highdgrmajor = "6" if highdgrmajor == "39889S"
	replace highdgrmajor = "7" if highdgrmajor == "41929S"
	replace highdgrmajor = "9" if highdgrmajor == "43899S"
	replace highdgrmajor = "10" if highdgrmajor == "44999S"
	replace highdgrmajor = "11" if highdgrmajor == "45939S"
	replace highdgrmajor = "12" if highdgrmajor == "527250"
	replace highdgrmajor = "13" if highdgrmajor == "537260"
	replace highdgrmajor = "14" if highdgrmajor == "547280"
	replace highdgrmajor = "15" if highdgrmajor == "567350"
	replace highdgrmajor = "16" if highdgrmajor == "58799S"
	replace highdgrmajor = "18" if highdgrmajor == "61999S" | highdgrmajor == "61999S"
	replace highdgrmajor = "19" if highdgrmajor == "69999S" 
	replace highdgrmajor = "." if highdgrmajor == "999999"
	
	destring highdgrmajor, replace

	
	replace jobcode = "Computer and mathematical scientists" if jobcode == "1"
	replace jobcode = "Biological, agricultural and other life scientists" if jobcode == "2"
	replace jobcode = "Physical and related scientists" if jobcode == "3"
	replace jobcode = "Social and related scientists" if jobcode == "4"
	replace jobcode = "Engineers" if jobcode == "5"
	*replace jobcode = "S and E related occupations" if jobcode == "6" * only post 2001
	replace jobcode = "Non-S and E Occupations" if jobcode == "6"  /* becomes 7 post 2001 */
	replace jobcode = "Logical Skip" if jobcode == "8"

}


label define highdgrmajorlabel 1 "Computer and Mathematical Science" 2 "Biological Sciences" 3 "Other Life & Related Sciences" 4 "Chemistry, except Biochemistry" ///
5 "Physics and Astronomy" 6 "Other Physical & Related Sciences" 7 "Economics" 8 "Political and Related Sciences" 9 "Psychology" 10 "Sociology & Anthropology" ///
11 "Other Social Sciences" 12 "Chemical Engineering" 13 "Civil Engineering" 14 "Electrical, Electronics and Communications engineering" 15 "Mechanical Engineering" ///
16 "Other Engineering" 17 "Health-related Fields" 18 "Management & Administration" 19 "Other Non-Science & Engineering" 20 "Other Science & Engineering-related"
destring highdgrmajor, replace
label values highdgrmajor highdgrmajorlabel

destring highdgrtype, replace
label define highdgrtypelabel 1 "Bachelor's" 2 "Master's" 3 "Doctorate" 4 "Professional"
label values highdgrtype highdgrtypelabel

*After 1999, hrswork categorizes work hours only in 4 categories as described in label (not the true number of hours)
destring hrswork, replace
replace hrswork = -1 if hrswork == 98
replace hrswork = 1 if hrswork <=20 & yrofsurvey < 2001
replace hrswork = 2 if hrswork >=21 & hrswork <= 35 & yrofsurvey < 2001
replace hrswork = 3 if hrswork >=36 & hrswork <= 40 & yrofsurvey < 2001
replace hrswork = 4 if hrswork >=41 & yrofsurvey < 2001
label define hrsworklabel 1 "20 or less" 2 "21-35" 3 "36-40" 4 "Greater than 40" -1 "Logical Skip"
label values hrswork hrsworklabel

replace jobcode = "1" if jobcode == "Computer and mathematical scientists" 
replace jobcode = "2" if jobcode == "Biological, agricultural and other life scientists"
replace jobcode = "3" if jobcode == "Physical and related scientists"
replace jobcode = "4" if jobcode == "Social and related scientists"
replace jobcode = "5" if jobcode == "Engineers" 
replace jobcode = "6" if jobcode == "S and E related occupations"
replace jobcode = "7" if jobcode == "Non-S and E Occupations"
replace jobcode = "8" if jobcode == "Logical Skip"
destring jobcode, replace
label define jobcodelabel 1 "Computer and mathematical scientists"  2 "Biological, agricultural and other life scientists" ///
3 "Physical and related scientists" 4 "Social and related scientists" 5 "Engineers" 6 "S and E related occupations" 7 "Non-S and E Occupations" 8 "Logical Skip"
label values jobcode jobcodelabel


replace jobcode2 = "-1" if jobcode2 == "999989"
replace jobcode2 = "1" if jobcode2 == "18296S"
replace jobcode2 = "2" if jobcode2 == "19289S"
replace jobcode2 = "3" if jobcode2 == "22220S"
replace jobcode2 = "4" if jobcode2 == "28288S"
replace jobcode2 = "5" if jobcode2 == "29399S"
replace jobcode2 = "6" if jobcode2 == "311930"
replace jobcode2 = "7" if jobcode2 == "33330S"
replace jobcode2 = "8" if jobcode2 == "38299S"
replace jobcode2 = "9" if jobcode2 == "39399S"
replace jobcode2 = "10" if jobcode2 == "41410S" | jobcode2 == "412320"
replace jobcode2 = "11" if jobcode2 == "43430S" | jobcode2 == "432360"
replace jobcode2 = "12" if jobcode2 == "48299S"
replace jobcode2 = "13" if jobcode2 == "49399S"	| jobcode2 == "48399S"
replace jobcode2 = "14" if jobcode2 == "50500S"
replace jobcode2 = "15" if jobcode2 == "520850"
replace jobcode2 = "16" if jobcode2 == "530860"
replace jobcode2 = "17" if jobcode2 == "540890"
replace jobcode2 = "18" if jobcode2 == "560940" | jobcode2 == "79999S"
replace jobcode2 = "19" if jobcode2 == "582800" | jobcode2 == "79999S"
replace jobcode2 = "20" if jobcode2 == "611410" | jobcode2 == "711410"
replace jobcode2 = "21" if jobcode2 == "61199S" | jobcode2 == "71199S"
replace jobcode2 = "22" if jobcode2 == "63599S" | jobcode2 == "73599S"
replace jobcode2 = "23" if jobcode2 == "69999S" | jobcode2 == "79999S"
replace jobcode2 = "24" if jobcode2 == "61199S"
replace jobcode2 = "25" if jobcode2 == "62199S"
replace jobcode2 = "26" if jobcode2 == "63199S"
replace jobcode2 = "27" if jobcode2 == "65199S"
destring jobcode2, replace
label define jobcode2label -1 "Logical Skip" 1 "Postsecondary Teacheres-Computer and" 2 "Computer Scientists and Mathematicians" 3 "Biological and Medical Scientists" ///
4 "Postsecondary Teachers-Life Relat" 5 "Other Life and Related Scientists" 6 "Chemists, except Biochemists" 7 "Physicists and astronomers" 8 "Postsecondary Teachers-Physical &" ///
9 "Other Physical & Related Scientis" 10 "Economists" 11 "Psychologists" 12 "Postsecondary Teachers-Social & R" 13 "Other Social Scientists" 14 "Other Engineers" ///
15 "Chemical Engineers" 16 "Civil Engineers" 17 "Electrical and Electronics Engine" 18 "Mechanical Engineers" 19 "Postsecondary Teachers - Engineer" ///
20 "Top and Mid-Level Managers, Executives" 21 "Other Management Related Occupati" 22 "Teachers, except S&E Postsecondar" 23 "Other non-science and engineering" ///
24 "Health-related occupations" 25 "S and E Managers" 26 "S and E pre-college teachers" 27 "S and E Pre-college Teachers"
label values jobcode2 jobcode2label

replace jobrelate = "-1" if jobrelate == "L"
destring jobrelate, replace
label define jobrelatelabel -1 "Logical Skip" 1 "Closely related" 2 "Somewhat related" 3 "Not related"
label values jobrelate jobrelatelabel

replace jobweeks = "-1" if jobweeks == "L"
destring jobweeks, replace
label define jobweekslabel -1 "Logical Skip" 
label values jobweeks jobweekslabels

replace num1reason = "8" if num1reason == "L"
destring num1reason, replace
label define num1reasonlabel 1 "Pay, promotion opportunities " 2 "Working conditions [hours, equip.]" 3 "Job location" 4 "Change in career or professional" ///
5 "Family-related reasons" 6 "Job in doctoral degree field not" 7 "Job location" 8 "Other reason for not working" 
label values num1reason num1reasonlabel 

destring race, replace
gen racetemp =.
replace racetemp = 1 if race == 2 | race == 5
replace racetemp = 2 if race == 1 | race == 4
replace racetemp = 3 if race == 7
replace racetemp = 4 if race == 6
replace race = racetemp
drop racetemp
label define racelabel 1 "White" 2 "Asian" 3 "Under-represented minorities" 4 "Other"
label values race racelabel

replace rdmajor = "" if rdmajor == "999999"
replace rdmajor = "1" if rdmajor == "19889S"
replace rdmajor = "2" if rdmajor == "22639S"
replace rdmajor = "3" if rdmajor == "29889S"
replace rdmajor = "4" if rdmajor == "318730"
replace rdmajor = "5" if rdmajor == "33878S"
replace rdmajor = "6" if rdmajor == "39889S" | rdmajor == "39899S"
replace rdmajor = "7" if rdmajor == "41929S"
replace rdmajor = "8" if rdmajor == "43899S"
replace rdmajor = "9" if rdmajor == "44999S"
replace rdmajor = "10" if rdmajor == "42929S"
replace rdmajor = "11" if rdmajor == "45939S" | rdmajor == "412320"
replace rdmajor = "12" if rdmajor == "527250" | rdmajor == "432360"
replace rdmajor = "13" if rdmajor == "537260"
replace rdmajor = "14" if rdmajor == "547280"	| rdmajor == "48399S"
replace rdmajor = "15" if rdmajor == "567350"
replace rdmajor = "16" if rdmajor == "58799S"
replace rdmajor = "17" if rdmajor == "61999S" | rdmajor == "71999S"
replace rdmajor = "18" if rdmajor == "69999S" | rdmajor == "79999S"
replace rdmajor = "19" if rdmajor == "61199S"
destring rdmajor, replace
label define rdmajorlabel 1 "Computer and Mathematical Science" 2 "Biological Sciences" 3 "Other Life & Related Sciences" ///
4 "Chemistry, except Biochemistry" 5 "Physics and Astronomy" 6 "Other Physical & Related Sciences" 7 "Economics" 8 "Psychology" ///
9 "Sociology & Anthropology" 10 "Political and Related Sciences" 11 "OTHER Social Sciences" 12 "Chemical Engineering" ///
13 "Civil Engineering" 14 "Electrical, Electronics and Commu" 15 "Mechanical Engineering" 16 "Other Engineering" ///
17 "Management & Administration" 18	 "Other Non-Science & Engineering" 19 "Health-Related Fields"
label values rdmajor rdmajorlabel

destring rdmajor2, replace
label define rdmajor2label 1 "Computer and Mathematical Science" 2 "Life and Related Sciences" 3 "Physical and related sciences" ///
4 "Social and Related Sciences " 5 "Engineering" 6 "Non-S&E degrees"
label values rdmajor2 rdmajorlabel


destring recentdgrtype, replace
label define recentdgrtypelabel 1 "Bachelor's" 2 "Master's" 3 "Doctorate" 4 "Professional" 5 "Other"
label values recentdgrtype recentdgrtypelabel

*According to the code book, missing 
replace recentdgryr5 =. if recentdgryr5 == 9999

* Salary is missing if == 999999, according to codebook, and logical skip if 999998
replace salary =. if salary == 999999
replace salary =-1 if salary == 9999998	
*labels for only one value do not exist in stata, so using a note instead
label define salary -1 "Logical Skip"
label values salary salary

gen sciencegroup =.
replace sciencegroup = 1 if highdgrmajor == 2 | highdgrmajor == 4 | highdgrmajor == 3
replace sciencegroup = 2 if highdgrmajor >=12 | highdgrmajor <= 16
replace sciencegroup = 3 if highdgrmajor == 1
replace sciencegroup = 4 if highdgrmajor == 5 | highdgrmajor == 6
replace sciencegroup = 5 if highdgrmajor == 17
replace sciencegroup = 6 if highdgrmajor == 20
replace sciencegroup = 7 if highdgrmajor == 7 | highdgrmajor == 8 | highdgrmajor == 9 | highdgrmajor == 10 | highdgrmajor == 11
label define sciencegrouplabel 1 "Life Sciences" 2 "Engineering" 3 "Computer and Math Sciences" 4 "Physical Sciences" ///
5 "Health Related Fields" 6 "Other Science and Engineering" 7 "Social Sciences"
label values sciencegroup sciencegrouplabel
label var sciencegroup "5 Group STEM Classification"
notes sciencegroup: Missing Variables: Years where recipients recieve a higher degree in a non-STEM field count as missing, except for a couple of values ///

label define survidlabel 1 "NSCG" 2 "SDR" 3 "NSRCG"
replace survid = "1" if survid == "NSCG"
replace survid = "2" if survid == "SDR" | highdgrtype == 3
replace survid = "3" if survid == "NSRCG"
destring survid, replace
label values survid survidlabel


* This for-loop converts string categorical and dummy variables into integer variables for ease of use
foreach var of varlist change* child* compact developact employed female lookwrk manageact minrty multipleact need* nowork* reason* researchact ///
researchdevelopact supervisor teachact usborn uscitizen working { 

	replace `var' = "1" if `var' == "Y" | `var' == "Yes" | `var' == "F" | `var' == "1"
	replace `var' = "0" if `var' == "N" | `var' == "No" | `var' == "M" | `var' == "2"
	replace `var' = "-1" if `var' == "L" | `var' == "3" | `var' == "Not In Labor Force"
	replace `var' = "" if `var' == "M" | `var' == "X" // "M" means missing and "X" means survey exclusion/confidentiality
	destring `var', replace
	
	local l = "`var'" + "label"
	label define  `l' 1 "Yes" 0 "No" -1 "Logical Skip" 
	label values `var' `l'

}

/* for exploring for errors
foreach var of varlist compact developact employed female manageact minrty multipleact nowork* reason* researchact ///
researchdevelopact teachact usborn uscitizen working { 

	tab `var', missing

}
*/


*We're only examining obs. who graduated on or after 1990
drop if highdgryr5 < 1990

*Part time is working fewer than 35 hours a week
replace workstat = "-1" if workstat == "L"
destring workstat, replace
replace workstat = -1 if hrswork == -1 & workstat ==.
replace workstat = 1 if hrswork > 2 & workstat ==.
replace workstat = 2 if (hrswork == 1 | hrswork == 2) & workstat ==.
label define workstatlabel -1 "Logical Skip" 1 "Full-Time" 2 "Part-Time"
label values workstat workstatlabel

order id yrofsurvey highdgryr5 jobcode female age compact developact employed highdgrmajor highdgrtype manageact minrty multipleact noworkfam noworklay noworknojob ///
noworknoneed noworkother noworkstud num1reason race reasoncareer reasoncondition reasonfam reasonloc reasonnojob reasonother reasonpay recentdgrtype recentdgryr5 ///
researchact salary teachact usborn uscitizen weight working  
