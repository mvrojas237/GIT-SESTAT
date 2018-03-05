******************** People who first appeared in the 2003 survey ***********************************
quietly {

*drop if highdgryr52003 <2000 | highdgryr52003 >= 2005 & highdgryr51993 !=. & highdgryr51995 !=. & highdgryr51997 !=. & highdgryr51999 !=. & highdgryr52001 !=.
*see above for Restricted Use Data
*Drops anyone who got a higher degree in STEM after this survey
foreach v of varlist highdgryr5* {
	drop if degreetypechange2003 == "Highest Degree Type Changed Within STEM" & (`v' > highdgryr52003)
} 

gen surv03exit03 =.

replace surv03exit03 = 0 if (jobcode2003 != "Social and related scientists" & jobcode2003 != "Non-S and E Occupations" & jobcode2003 != "Logical Skip" )
replace surv03exit03 = 1 if (jobcode2003 == "Social and related scientists" | jobcode2003 == "Non-S and E Occupations") | degreetypechange2003 == "Highest Degree Type Changed Outside of STEM"
replace surv03exit03 = 2 if jobcode2003 == "Logical Skip"
replace surv03exit03 = 3 if jobcode2003 == ""

label define surv03exit03label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv03exit03 surv03exit03label

*Drop anyone who didn't respond to the first survey 01 survey
drop if surv03exit03 == 3

noisily tab surv03exit03 gender2003, col
noisily tab surv03exit03 race2003 if race2003 != 6, col
noisily tab surv03exit03 birthplace2003 if birthplace2003 != 2, col
noisily tab surv03exit03 sciencegroup2003 if sciencegroup2003 !=7, col

*Drop anyone who wasn't working in STEM the first 2003 survey 
drop if surv03exit03 == 1

gen surv03exit06 =.

replace surv03exit06 = 0 if (jobcode2006 != "Social and related scientists" & jobcode2006 != "Non-S and E Occupations" & jobcode2006 != "Logical Skip")
replace surv03exit06 = 1 if (jobcode2006 == "Social and related scientists" | jobcode2006 == "Non-S and E Occupations") | degreetypechange2006 == "Highest Degree Type Changed Outside of STEM"
replace surv03exit06 = 2 if jobcode2006 == "Logical Skip"
replace surv03exit06 = 3 if jobcode2006 == ""

label define surv03exit06label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv03exit06 surv03exit06label

noisily tab surv03exit06 gender2003, col
noisily tab surv03exit06 race2003 if race2003 != 6, col
noisily tab surv03exit06 birthplace2003 if birthplace2003 != 2, col
noisily tab surv03exit06 sciencegroup2003 if sciencegroup2003 !=7, col

noisily tab surv03exit06 gender2003 if surv03exit06 != 3, col
noisily tab surv03exit06 race2003 if surv03exit06 != 3 & race2003 != 6, col
noisily tab surv03exit06 birthplace2003 if surv03exit06 != 3 & birthplace2003 != 2, col
noisily tab surv03exit06 sciencegroup2003 if surv03exit06 != 3 & sciencegroup2003 !=7, col

gen surv03exit08 =.

replace surv03exit08 = 0 if (jobcode2008 != "Social and related scientists" & jobcode2008 != "Non-S and E Occupations" & jobcode2008 != "Logical Skip")
replace surv03exit08 = 1 if (jobcode2008 == "Social and related scientists" | jobcode2008 == "Non-S and E Occupations") | degreetypechange2008 == "Highest Degree Type Changed Outside of STEM"
replace surv03exit08 = 2 if jobcode2008 == "Logical Skip"
replace surv03exit08 = 3 if jobcode2008 == ""

label define surv03exit08label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv03exit08 surv03exit08label

noisily tab surv03exit08 gender2003, col
noisily tab surv03exit08 race2003 if race2003 != 6, col
noisily tab surv03exit08 birthplace2003 if birthplace2003 != 2, col
noisily tab surv03exit08 sciencegroup2003 if sciencegroup2003 !=7, col

gen surv03exit10 =.

replace surv03exit10 = 0 if (jobcode2010 != "Social and related scientists" & jobcode2010 != "Non-S and E Occupations" & jobcode2010 != "Logical Skip" )
replace surv03exit10 = 1 if (jobcode2010 == "Social and related scientists" | jobcode2010 == "Non-S and E Occupations") | degreetypechange2010 == "Highest Degree Type Changed Outside of STEM"
replace surv03exit10 = 2 if jobcode2010 == "Logical Skip"
replace surv03exit10 = 3 if jobcode2010 == ""

label define surv03exit10label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv03exit10 surv03exit10label

noisily tab surv03exit10 gender2003, col
noisily tab surv03exit10 race2003 if race2003 != 6, col
noisily tab surv03exit10 birthplace2003 if birthplace2003 != 2, col
noisily tab surv03exit10 sciencegroup2003 if sciencegroup2003 !=7, col

gen surv03exit13 =.

replace surv03exit13 = 0 if (jobcode2013 != "Social and related scientists" & jobcode2013 != "Non-S and E Occupations" & jobcode2013 != "Logical Skip")
replace surv03exit13 = 1 if (jobcode2013 == "Social and related scientists" | jobcode2013 == "Non-S and E Occupations") | degreetypechange2013 == "Highest Degree Type Changed Outside of STEM"
replace surv03exit13 = 2 if jobcode2013 == "Logical Skip"
replace surv03exit13 = 3 if jobcode2013 == ""

label define surv03exit13label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv03exit13 surv03exit13label

noisily tab surv03exit13 gender2003, col
noisily tab surv03exit13 race2003 if race2003 != 6, col
noisily tab surv03exit13 birthplace2003 if birthplace2003 != 2, col
noisily tab surv03exit13 sciencegroup2003 if sciencegroup2003 !=7, col

}
