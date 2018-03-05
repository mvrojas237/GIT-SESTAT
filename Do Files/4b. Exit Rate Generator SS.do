
quietly {


*GET RID OF STEM NON-SS
* ONLY LOOK AT THOSE WORKING IN STEM THE FIRST YEAR WHEN CALCULATING 2-YEAR EXIT RATES

*Create the data set for the survival curves
* long data set
* co-horts of people for each year
* only people who STARTED in STEM (start at 2-year exit rates)  

/*


Cox proportional hazards model  -- LOOK UP 
command = stcox
but first data set must be an st data set 
use time variant covariants (like marriage things that change, education, family changes)

*/

	*Need these labels to assign for each subyear 
	label define surveylabel 0 "Working in SS" 1 "Not Working in SS" 2 "Not Working" 3 "Missing"

	*foreach subyear of numlist 1993 1995 1997 1999 2001 2003 2006 2008 2010 2013 {
	foreach subyear of numlist 1993 1995 {
		*Ignore years before the current survey year
		
		local year = year[1]
		
		if `subyear' < `year' {
			continue 
		}
		
		local shortyear = substr("`year'", 3,2)
		local shortsubyear = substr("`subyear'", 3,2)
		local surveyvar = "surv" + "`shortyear'" + "exit" + "`shortsubyear'"
		local jobcode = "jobcode" + "`subyear'"

		gen `surveyvar' =.

		replace `surveyvar' = 0 if (`jobcode' != "Non-S and E Occupations" & `jobcode' != "Logical Skip")
		replace `surveyvar' = 1 if (`jobcode' == "Non-S and E Occupations")
		replace `surveyvar' = 2 if `jobcode' == "Logical Skip"
		replace `surveyvar' = 3 if `jobcode' == "" 
		
		label values `surveyvar' surveylabel

		*Drop anyone who didn't respond to the first survey
		drop if `surveyvar' == 3 & `subyear' == `year'

		local gender = "gender" + "`year'"
		local race = "race" + "`year'"
		local usborn = "usborn" + "`year'"
		local sciencegroup = "sciencegroup" + "`year'"
		local dummystem = "dummystem" + "`year'"
		local dgrtype = "highdgrtype" + "`year'"
		
		noisily tab `surveyvar' `gender', nofreq col
		noisily tab `surveyvar' `race' if `race' != 6 & `race' != 4 , nofreq col
		noisily tab `surveyvar' `usborn' if `usborn' !=2, nofreq col
		noisily tab `surveyvar' `dgrtype', nofreq col
		
		*Tab categories without the missing people
		if `subyear' == `year' + 2 | `subyear' == `year' + 3 {
			noisily tab `surveyvar' `gender' if `surveyvar' != 3, nofreq col
			noisily tab `surveyvar' `race' if `race' != 6 & `race' != 4 & `surveyvar' != 3, nofreq col
			noisily tab `surveyvar' `usborn' if `usborn' !=2 &`surveyvar' != 3, nofreq col
			noisily tab `surveyvar' `dgrtype' if `surveyvar' != 3, nofreq col
		}

	}

}

