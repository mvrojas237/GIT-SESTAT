******************** People who first appeared in the 2010 survey ***********************************
quietly {

*Drops anyone who got a higher degree in STEM after this survey
foreach v of varlist highdgryr5* {
	drop if degreetypechange2010 == "Highest Degree Type Changed Within STEM" & (`v' > highdgryr52010)
}

gen surv10exit10 =.

replace surv10exit10 = 0 if (jobcode2010 != "Social and related scientists" & jobcode2010 != "Non-S and E Occupations" & jobcode2010 != "Logical Skip")
replace surv10exit10 = 1 if (jobcode2010 == "Social and related scientists" | jobcode2010 == "Non-S and E Occupations") | degreetypechange2010 == "Highest Degree Type Changed Outside of STEM"
replace surv10exit10 = 2 if jobcode2010 == "Logical Skip"
replace surv10exit10 = 3 if jobcode2010 == ""

label define surv10exit10label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv10exit10 surv10exit10label

*Drop anyone who didn't respond to the first survey 10 survey
drop if surv10exit10 == 3

noisily tab surv10exit10 gender2010, col
noisily tab surv10exit10 race2010 if race2010 != 6, col
noisily tab surv10exit10 birthplace2010 if birthplace2010 != 2, col
noisily tab surv10exit10 sciencegroup2010 if sciencegroup2010 !=7, col

*Drop anyone who wasn't working in STEM the first 2010 survey 
drop if surv10exit10 == 1

gen surv10exit13 =.

replace surv10exit13 = 0 if (jobcode2013 != "Social and related scientists" & jobcode2013 != "Non-S and E Occupations" & jobcode2013 != "Logical Skip")
replace surv10exit13 = 1 if (jobcode2013 == "Social and related scientists" | jobcode2013 == "Non-S and E Occupations") | degreetypechange2013 == "Highest Degree Type Changed Outside of STEM"
replace surv10exit13 = 2 if jobcode2013 == "Logical Skip"
replace surv10exit13 = 3 if jobcode2013 == ""

label define surv10exit13label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv10exit13 surv10exit13label

noisily tab surv10exit13 gender2010, col
noisily tab surv10exit13 race2010 if race2010 != 6, col
noisily tab surv10exit13 birthplace2010 if birthplace2010 != 2, col
noisily tab surv10exit13 sciencegroup2010 if sciencegroup2010 !=7, col

noisily tab surv10exit13 gender2010 if surv10exit13 != 3, col
noisily tab surv10exit13 race2010 if surv10exit13 != 3 & race2010 != 6, col
noisily tab surv10exit13 birthplace2010 if surv10exit13 != 3 & birthplace2010 != 2, col
noisily tab surv10exit13 sciencegroup2010 if surv10exit13 != 3 & sciencegroup2010 !=7, col

}
