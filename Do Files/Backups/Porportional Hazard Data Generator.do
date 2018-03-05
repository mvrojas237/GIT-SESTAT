
quietly {

	reshape long wide age compact developact employed female highdgrmajor highdgrtype highdgryr5 hrswork jobcode jobweeks manageact minrty multipleact ///
	needother needss needstem noworkfam noworklay noworknojob noworknoneed noworkother noworkstud num1reason race reasoncareer reasoncondition reasonloc ///
	reasonnojob reasonother reasonpay recentdgrtype recentdgryr5 researchact researchdevelopact salary sciencegroup stemdgrdummy ///
	reasonfam stemdummy stemexityear surv teachact usborn uscitizen weight working, i(id) j(yrofsurvey)

	
	drop wide
	
	sort id
	local year = year[1]
	
	drop if female == . //they should have this question answered if they appeared in the survey year

	*We'll be appending them to other cohorts, so create their cohort year to be clear
	gen cohortyear = `year'
	label variable cohort "Cohort Year"
	drop year

	*Years in science (before exiting into science...or eventually make if just dropping out of survey?) 
	gen stemyears =.
	label variable stemyears "Years Working in STEM Before Exit"
	replace stemyears = stemexityear - `year' if stemexityear != 0
	
	gen dummystemjob = 1 if jobcode != 4 & jobcode != 7 & jobcode != 8
	replace dummystemjob = 0 if dummystemjob != 1
	label variable dummystemjob "Currently Working in STEM Dummy"

	sort id stemexityear
	replace stemyears = stemyears[_n-1] if id == id[_n-1] & stemyear[_n-1] != . //replace the number of years working in stem until exit for all other newer observations

	order id yrofsurvey female stemyears stemexityear stemexitdgryear highdgryr5 highdgrmajor jobcode

}

