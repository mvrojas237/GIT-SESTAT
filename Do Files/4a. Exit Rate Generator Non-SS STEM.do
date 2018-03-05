	
/* 

This file largely works by using macros. As the exit rates are most easily obtained in wide data form, each variable of interest like jobcode is a different variable for 
each year, so there will be jobcode1993, jobcode1995, etc. The year of the survey determines what iteration of the variable we should be using, so we can call the variable
by creating a macro that includes the year in the suffix. 

*/


quietly {

	local year = year[1]
	local degreetypechange = "degreetypechange" + "`year'"
	local highdgryr5year = "highdgryr5" + "`year'"
	
	*Need these labels to assign for each subyear 
	label define surveylabel 0 "Not Working in STEM" 1 "Working in STEM" 2 "Logical Skip" -1 "Missing"

	*foreach subyear of numlist 1993 1995 1997 1999 2001 2003 2006 2008 2010 2013 {
	foreach subyear of numlist 1993 1995 1997 1999 2001 2003 2006 2008 2010 2013 {
		*Ignore years before the current survey year	
	
		*We can only find the exit rates on years after the first cohort was sampled. The continue command exits the entire for loop and skips to the next year
		if `subyear' < `year' {
			continue 
		}
		
		local degreetypechange = "degreetypechange" + "`year'"
		local highdgryr5year = "highdgryr5" + "`year'"
		
		local shortyear = substr("`year'", 3,2)
		local shortsubyear = substr("`subyear'", 3,2)
		local surveyvar = "surv" + "`shortyear'" + "exit" + "`shortsubyear'"
		local jobcode = "jobcode" + "`subyear'"
		local stemexityear = "stemexityear" + "`subyear'"
		local instem = "instem" + "`subyear'"
		
		gen `surveyvar' =.
		*label variable `surveyvar' "Original Survey and Possible Exit Year Representing STEM Status"

		
		replace `surveyvar' = 0 if `instem' == 0
		replace `surveyvar' = 1 if `instem' == 1
		replace `surveyvar' = 2 if `jobcode' == 8
		replace `surveyvar' = -1 if `jobcode' ==.
		
		*use this to see when they exited. Don't replace the year if they already showed an exit, as determined in the "Append & Estimate Exit Rate"
		replace `stemexityear' = `subyear' if `surveyvar' != 0 & `surveyvar' != 3 & `stemexityear' == 0

		label values `surveyvar' surveylabel

		*Drop anyone who didn't respond to the first survey
		drop if `surveyvar' == 3 & `subyear' == `year'
		

		local female = "female" + "`year'"
		local race = "race" + "`year'"
		local uscitizen = "uscitizen" + "`year'"
		local sciencegroup = "sciencegroup" + "`year'"
		local dummystem = "dummystem" + "`year'"
		local dgrtype = "highdgrtype" + "`year'"

		*Add nofreq as an option to the tab command if you want to only see the percentages without the number of observations
		noisily tab `surveyvar' `female', col 
		noisily tab `surveyvar' `race' if `race' != 6 & `race' != 4, col 
		noisily tab `surveyvar' `uscitizen' if `uscitizen' !=2, col 
		noisily tab `surveyvar' `sciencegroup' if `sciencegroup' !=7, col 

		noisily tab `surveyvar' `dgrtype' , col 
		
		*Tab categories without the missing people
		if `subyear' == `year' + 2 | `subyear' == `year' + 3 {
			noisily tab `surveyvar' `female' if `surveyvar' != 3, col 
			noisily tab `surveyvar' `race' if `race' != 6 & `race' != 4 & `surveyvar' != 3, col 
			noisily tab `surveyvar' `uscitizen' if `uscitizen' !=2 &`surveyvar' != 3, col 
			noisily tab `surveyvar' `sciencegroup' if `surveyvar' != 3 & `sciencegroup' !=7, col 
			noisily tab `surveyvar' `dgrtype' if `surveyvar' != 3, col 
		}

	}

}

