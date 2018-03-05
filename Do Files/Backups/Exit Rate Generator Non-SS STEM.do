
quietly {
	
	local year = year[1]
	local degreetypechange = "degreetypechange" + "`year'"
	local highdgryr5year = "highdgryr5" + "`year'"
	
	*Need these labels to assign for each subyear 
	label define surveylabel 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"

	*foreach subyear of numlist 1993 1995 1997 1999 2001 2003 2006 2008 2010 2013 {
	foreach subyear of numlist 1993 1995 1997 1999 2001 2003 2006 2008 2010 2013 {
		*Ignore years before the current survey year	
	
		if `subyear' < `year' {
			continue 
		}
		
		local year = year[1]
		local degreetypechange = "degreetypechange" + "`year'"
		local highdgryr5year = "highdgryr5" + "`year'"
		*local subyear = "1993"
		
		local shortyear = substr("`year'", 3,2)
		local shortsubyear = substr("`subyear'", 3,2)
		local surveyvar = "surv" + "`shortyear'" + "exit" + "`shortsubyear'"
		local jobcode = "jobcode" + "`subyear'"
		local stemexityear = "stemexityear" + "`subyear'"
		local stemexitdgryear = "stemexitdgryear" + "`subyear'"
		
		gen `surveyvar' =.
		label variable `surveyvar' "Original Survey and Consequential Exit Year"

		replace `surveyvar' = 0 if (`jobcode' != 4 & `jobcode' != 7 & `jobcode' != 8)
		replace `surveyvar' = 1 if (`jobcode' == 4 | `jobcode' == 7) | `stemexitdgryear' == `highdgryr5year'
		replace `surveyvar' = 2 if `jobcode' == 8
		replace `surveyvar' = 3 if `jobcode' ==.
		
		*use this to see when they exited. Don't replace the year if they already showed an exit 
		replace `stemexityear' = `subyear' if `surveyvar' != 0 & `surveyvar' != 3 & stemexityear == 0

		label values `surveyvar' surveylabel

		*Drop anyone who didn't respond to the first survey
		drop if `surveyvar' == 3 & `subyear' == `year'
		

		local female = "female" + "`year'"
		local race = "race" + "`year'"
		local birthplace = "birthplace" + "`year'"
		local sciencegroup = "sciencegroup" + "`year'"
		local dummystem = "dummystem" + "`year'"
		local dgrtype = "highdgrtype" + "`year'"

		noisily tab `surveyvar' `female', col 
		noisily tab `surveyvar' `race' if `race' != 6 & `race' != 4, col 
		noisily tab `surveyvar' `birthplace' if `birthplace' !=2, col 
		noisily tab `surveyvar' `sciencegroup' if `sciencegroup' !=7, col 

		noisily tab `surveyvar' `dgrtype' , col 
		
		*Tab categories without the missing people
		if `subyear' == `year' + 2 | `subyear' == `year' + 3 {
			noisily tab `surveyvar' `female' if `surveyvar' != 3, col 
			noisily tab `surveyvar' `race' if `race' != 6 & `race' != 4 & `surveyvar' != 3, col 
			noisily tab `surveyvar' `birthplace' if `birthplace' !=2 &`surveyvar' != 3, col 
			noisily tab `surveyvar' `sciencegroup' if `surveyvar' != 3 & `sciencegroup' !=7, col 
			noisily tab `surveyvar' `dgrtype' if `surveyvar' != 3, col 
		}

	}

}

