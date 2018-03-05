******************** People who first appeared in the 2006 survey ***********************************
quietly {
*drop if (highdgryr52006 <2005 | highdgryr52006 >= 2006)
*see above for Restricted Use Data
*Drops anyone who got a higher degree in STEM after this survey
foreach v of varlist highdgryr5* {
	drop if degreetypechange2006 == "Highest Degree Type Changed Within STEM" & (`v' > highdgryr52006)
}

gen surv06exit06 =.

replace surv06exit06 = 0 if (jobcode2006 != "Social and related scientists" & jobcode2006 != "Non-S and E Occupations" & jobcode2006 != "Logical Skip")
replace surv06exit06 = 1 if (jobcode2006 == "Social and related scientists" | jobcode2006 == "Non-S and E Occupations") | degreetypechange2006 == "Highest Degree Type Changed Outside of STEM"
replace surv06exit06 = 2 if jobcode2006 == "Logical Skip"
replace surv06exit06 = 3 if jobcode2006 == ""

label define surv06exit06label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv06exit06 surv06exit06label

*Drop anyone who didn't respond to the first survey 06 survey
drop if surv06exit06 == 3

noisily tab surv06exit06 gender2006, col
noisily tab surv06exit06 race2006 if race2006 != 6, col
noisily tab surv06exit06 birthplace2006 if birthplace2006 != 2, col
noisily tab surv06exit06 sciencegroup2006 if sciencegroup2006 !=7, col

*Drop anyone who wasn't working in STEM the first 2006 survey 

gen surv06exit08 =.

replace surv06exit08 = 0 if (jobcode2008 != "Social and related scientists" & jobcode2008 != "Non-S and E Occupations" & jobcode2008 != "Logical Skip")
replace surv06exit08 = 1 if (jobcode2008 == "Social and related scientists" | jobcode2008 == "Non-S and E Occupations") | degreetypechange2008 == "Highest Degree Type Changed Outside of STEM"
replace surv06exit08 = 2 if jobcode2008 == "Logical Skip"
replace surv06exit08 = 3 if jobcode2008 == ""

label define surv06exit08label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv06exit08 surv06exit08label

noisily tab surv06exit08 gender2006, col
noisily tab surv06exit08 race2006 if race2006 != 6, col
noisily tab surv06exit08 birthplace2006 if birthplace2006 != 2, col
noisily tab surv06exit08 sciencegroup2006 if sciencegroup2006 !=7, col

noisily tab surv06exit08 gender2006 if surv06exit08 != 3, col
noisily tab surv06exit08 race2006 if surv06exit08 != 3 & race2006 != 6, col
noisily tab surv06exit08 birthplace2006 if surv06exit08 != 3 & birthplace2006 != 2, col
noisily tab surv06exit08 sciencegroup2006 if surv06exit08 != 3 & sciencegroup2006 !=7, col

gen surv06exit10 =.

replace surv06exit10 = 0 if (jobcode2010 != "Social and related scientists" & jobcode2010 != "Non-S and E Occupations" & jobcode2010 != "Logical Skip" )
replace surv06exit10 = 1 if (jobcode2010 == "Social and related scientists" | jobcode2010 == "Non-S and E Occupations") | degreetypechange2010 == "Highest Degree Type Changed Outside of STEM"
replace surv06exit10 = 2 if jobcode2010 == "Logical Skip"
replace surv06exit10 = 3 if jobcode2010 == ""

label define surv06exit10label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv06exit10 surv06exit10label

noisily tab surv06exit10 gender2006, col
noisily tab surv06exit10 race2006 if race2006 != 6, col
noisily tab surv06exit10 birthplace2006 if birthplace2006 != 2, col
noisily tab surv06exit10 sciencegroup2006 if sciencegroup2006 !=7, col

gen surv06exit13 =.

replace surv06exit13 = 0 if (jobcode2013 != "Social and related scientists" & jobcode2013 != "Non-S and E Occupations" & jobcode2013 != "Logical Skip")
replace surv06exit13 = 1 if (jobcode2013 == "Social and related scientists" | jobcode2013 == "Non-S and E Occupations") | degreetypechange2013 == "Highest Degree Type Changed Outside of STEM"
replace surv06exit13 = 2 if jobcode2013 == "Logical Skip"
replace surv06exit13 = 3 if jobcode2013 == ""

label define surv06exit13label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv06exit13 surv06exit13label

noisily tab surv06exit13 gender2006, col
noisily tab surv06exit13 race2006 if race2006 != 6, col
noisily tab surv06exit13 birthplace2006 if birthplace2006 != 2, col
noisily tab surv06exit13 sciencegroup2006 if sciencegroup2006 !=7, col

}
