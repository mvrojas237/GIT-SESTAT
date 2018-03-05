******************** People who first appeared in the 2013 survey ***********************************
quietly {

*Drops anyone who got a higher degree in STEM after this survey
foreach v of varlist highdgryr5* {
	drop if degreetypechange2013 == "Highest Degree Type Changed Within STEM" & (`v' > highdgryr52013)
}

gen surv13exit13 =.

replace surv13exit13 = 0 if (jobcode2013 != "Social and related scientists" & jobcode2013 != "Non-S and E Occupations" & jobcode2013 != "Logical Skip")
replace surv13exit13 = 1 if (jobcode2013 == "Social and related scientists" | jobcode2013 == "Non-S and E Occupations") | degreetypechange2013 == "Highest Degree Type Changed Outside of STEM"
replace surv13exit13 = 2 if jobcode2013 == "Logical Skip"
replace surv13exit13 = 3 if jobcode2013 == ""

label define surv13exit13label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv13exit13 surv13exit13label

noisily tab surv13exit13 gender2013, col
noisily tab surv13exit13 race2013 if race2013 != 6, col
noisily tab surv13exit13 birthplace2013 if birthplace2013 != 2, col
noisily tab surv13exit13 sciencegroup2013 if sciencegroup2013 !=7, col
}
