******************** People who first appeared in the 2008 survey ***********************************
quietly {

*Drops anyone who got a higher degree in STEM after this survey
foreach v of varlist highdgryr5* {
	drop if degreetypechange2008 == "Highest Degree Type Changed Within STEM" & (`v' > highdgryr52008)
}

*drop if highdgryr52008 <2006 | highdgryr52008 >= 2010 & highdgryr51993 !=. & highdgryr51995 !=. & highdgryr51997 !=. & highdgryr51999 !=. & highdgryr52001 !=. & highdgryr52003 !=. & highdgryr52006 !=.
*see above for Restricted Use Data

gen surv08exit08 =.

replace surv08exit08 = 0 if (jobcode2008 != "Social and related scientists" & jobcode2008 != "Non-S and E Occupations"  & jobcode2008 != "Logical Skip")
replace surv08exit08 = 1 if (jobcode2008 == "Social and related scientists" | jobcode2008 == "Non-S and E Occupations") | degreetypechange2008 == "Highest Degree Type Changed Outside of STEM"
replace surv08exit08 = 2 if jobcode2008 == "Logical Skip"
replace surv08exit08 = 3 if jobcode2008 == ""

label define surv08exit08label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv08exit08 surv08exit08label

*Drop anyone who didn't respond to the first survey 08 survey
drop if surv08exit08 == 3

noisily tab surv08exit08 gender2008, col
noisily tab surv08exit08 race2008 if race2008 != 6, col
noisily tab surv08exit08 birthplace2008 if birthplace2008 != 2, col
noisily tab surv08exit08 sciencegroup2008 if sciencegroup2008 !=7, col


*Drop anyone who wasn't working in STEM the first 2008 survey 
drop if surv08exit08 == 1

gen surv08exit10 =.
	
replace surv08exit10 = 0 if (jobcode2010 != "Social and related scientists" & jobcode2010 != "Non-S and E Occupations" & jobcode2010 != "Logical Skip" )
replace surv08exit10 = 1 if (jobcode2010 == "Social and related scientists" | jobcode2010 == "Non-S and E Occupations") | degreetypechange2010 == "Highest Degree Type Changed Outside of STEM"
replace surv08exit10 = 2 if jobcode2010 == "Logical Skip"
replace surv08exit10 = 3 if jobcode2010 == ""

label define surv08exit10label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv08exit10 surv08exit10label

noisily tab surv08exit10 gender2008, col
noisily tab surv08exit10 race2008 if race2008 != 6, col
noisily tab surv08exit10 birthplace2008 if birthplace2008 != 2, col
noisily tab surv08exit10 sciencegroup2008 if sciencegroup2008 !=7, col

noisily tab surv08exit10 gender2008 if surv08exit10 != 3, col 
noisily tab surv08exit10 race2008 if surv08exit10 != 3 & race2008 != 6, col 
noisily tab surv08exit10 birthplace2008 if surv08exit10 != 3 & birthplace2008 != 2, col 
noisily tab surv08exit10 sciencegroup2008 if surv08exit10 != 3 & sciencegroup2008 !=7, col

gen surv08exit13 =.

replace surv08exit13 = 0 if (jobcode2013 != "Social and related scientists" & jobcode2013 != "Non-S and E Occupations" & jobcode2013 != "Logical Skip")
replace surv08exit13 = 1 if (jobcode2013 == "Social and related scientists" | jobcode2013 == "Non-S and E Occupations") | degreetypechange2013 == "Highest Degree Type Changed Outside of STEM"
replace surv08exit13 = 2 if jobcode2013 == "Logical Skip"
replace surv08exit13 = 3 if jobcode2013 == ""

label define surv08exit13label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv08exit13 surv08exit13label

noisily tab surv08exit13 gender2008, col
noisily tab surv08exit13 race2008 if race2008 != 6, col
noisily tab surv08exit13 birthplace2008 if birthplace2008 != 2, col
noisily tab surv08exit13 sciencegroup2008 if sciencegroup2008 !=7, col


}
