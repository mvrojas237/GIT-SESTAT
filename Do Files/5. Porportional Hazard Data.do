clear
set more off
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston\SESTAT Data Work"

*foreach year in 1993 1995 1997 1999 2001 2003 2006 2008 2010 2013 {
foreach yr in 1993 1995 1997 1999 2001 2003 2006 2008 2010 2013 {

	local subyr = mod(`yr',100)
	
	if `subyr' < 10 {
		local subyr = "0" + "`subyr'"
	}

	local exitratedata = "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey" + "`subyr'" + "exitratesHD.dta"

	use "`exitratedata'"
	
	reshape long actualhigh age allstemdgr allstemjob changecareer changecon changefam changelay changeloc changeother changepay changeret changeschool child12 child2 child25 ///
	child6 child611 childlegal childteen compact developact dgrchange dgrexit dgrlochigh dgrlocrecent employed empsect experfull experpart facten female govsup ///
	highdgrmajor highdgrtype highdgryr5 hrswork instem jobcode jobcode2 jobrelate jobweeks lookwrk manageact minrty multipleact needother needss ///
	needstem noworkfam noworklay noworknojob noworknoneed noworkother noworkstud num1reason oncestemdgr oncestemjob race rdmajor2 reasoncareer reasoncondition ///
	reasonfam reasonloc reasonnojob reasonother reasonpay rdmajor recentdgrtype recentdgryr5 researchact researchdevelopact salary ///
	sciencegroup stemdgr stemexityear stemworkstat supervisor survid teachact usborn uscitizen weight ///
	working workstat, i(id) j(yrofsurvey 1993 1995 1997 1999 2001 2003 2006 2008 2010 2013)
	
	drop surv*exit*
	sort id
	gen cohortyear = year[1]
	label variable cohort "Cohort Year"
	drop year
	drop if female ==.

	order id yrofsurvey female stemexityear highdgryr5 highdgrmajor jobcode

	local savedata = "Data Files\Proportional Hazards\Non-Social Science\" + "`yr'" + "cohortsnonSS.dta"
	save "`savedata'", replace

}

********* Append all Cohorts *********
cd "Data Files\Proportional Hazards\Non-Social Science"

use "1993cohortsnonSS.dta"
append using "1995cohortsnonSS.dta"
append using "1997cohortsnonSS.dta"
append using "1999cohortsnonSS.dta"
append using "2001cohortsnonSS.dta"
append using "2003cohortsnonSS.dta"
append using "2006cohortsnonSS.dta"
append using "2008cohortsnonSS.dta"
append using "2010cohortsnonSS.dta"
append using "2013cohortsnonSS.dta"


*Only have original cohort year
sort id yrofsurvey cohortyear
drop if id == id[_n-1] & yrofsurvey == yrofsurvey[_n-1]

order id yrofsurvey cohortyear female stemexityear

save "allcohortslong.dta", replace 





