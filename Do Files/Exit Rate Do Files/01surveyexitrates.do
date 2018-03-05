
******************** People who first appeared in the 2001 survey ***********************************
quietly {

*drop if highdgryr52001 <2000 | highdgryr52001 >= 2005 & highdgryr51993 !=. & highdgryr51995 !=. & highdgryr51997 !=. & highdgryr51999 !=.
*see above for Restricted Use Data

*Drops anyone who got a higher degree in STEM after this survey
foreach v of varlist highdgryr5* {
	drop if degreetypechange2001 == "Highest Degree Type Changed Within STEM" & (`v' > highdgryr52001)
} 


gen surv01exit01 =.

replace surv01exit01 = 0 if (jobcode2001 != "Social and related scientists" & jobcode2001 != "Non-S and E Occupations" & jobcode2001 != "Logical Skip")
replace surv01exit01 = 1 if (jobcode2001 == "Social and related scientists" | jobcode2001 == "Non-S and E Occupations") | degreetypechange2001== "Highest Degree Type Changed Outside of STEM"
replace surv01exit01 = 2 if jobcode2001 == "Logical Skip"
drop if jobcode2001 == ""

label define surv01exit01label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv01exit01 surv01exit01label

*Drop anyone who didn't respond to the first survey 01 survey
drop if surv01exit01 == 3

noisily tab surv01exit01 gender2001, col
noisily tab surv01exit01 race2001 if race2001 != 6, col
noisily tab surv01exit01 birthplace2001 if birthplace2001 != 2, col
noisily tab surv01exit01 sciencegroup2001 if sciencegroup2001 !=7, col

*Drop anyone who wasn't working in STEM the first 2001 survey 
drop if surv01exit01 == 1

gen surv01exit03 =.

replace surv01exit03 = 0 if (jobcode2003 != "Social and related scientists" & jobcode2003 != "Non-S and E Occupations" & jobcode2003 != "Logical Skip")
replace surv01exit03 = 1 if (jobcode2003 == "Social and related scientists" | jobcode2003 == "Non-S and E Occupations") | degreetypechange2001 == "Highest Degree Type Changed Outside of STEM"
replace surv01exit03 = 2 if jobcode2003 == "Logical Skip"
replace surv01exit03 = 3 if jobcode2003 == ""

label define surv01exit03label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv01exit03 surv01exit03label

noisily tab surv01exit03 gender2001, col
noisily tab surv01exit03 race2001 if race2001 != 6, col
noisily tab surv01exit03 birthplace2001 if birthplace2001 != 2, col
noisily tab surv01exit03 sciencegroup2001 if sciencegroup2001 !=7, col

noisily tab surv01exit03 gender2001 if surv01exit03 != 3, col
noisily tab surv01exit03 race2001 if surv01exit03 != 3 & race2001 != 6, col
noisily tab surv01exit03 birthplace2001 if surv01exit03 != 3 & birthplace2001 != 2, col
noisily tab surv01exit03 sciencegroup2001 if surv01exit03 != 3 & sciencegroup2001 !=7, col

gen surv01exit06 =.

replace surv01exit06 = 0 if (jobcode2006 != "Social and related scientists" & jobcode2006 != "Non-S and E Occupations" & jobcode2006 != "Logical Skip")
replace surv01exit06 = 1 if (jobcode2006 == "Social and related scientists" | jobcode2006 == "Non-S and E Occupations") | degreetypechange2001 == "Highest Degree Type Changed Outside of STEM"
replace surv01exit06 = 2 if jobcode2006 == "Logical Skip"
replace surv01exit06 = 3 if jobcode2006 == ""

label define surv01exit06label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv01exit06 surv01exit06label

noisily tab surv01exit06 gender2001, col
noisily tab surv01exit06 race2001 if race2001 != 6, col
noisily tab surv01exit06 birthplace2001 if birthplace2001 != 2, col
noisily tab surv01exit06 sciencegroup2001 if sciencegroup2001 !=7, col

gen surv01exit08 =.

replace surv01exit08 = 0 if (jobcode2008 != "Social and related scientists" & jobcode2008 != "Non-S and E Occupations" & jobcode2008 != "Logical Skip")
replace surv01exit08 = 1 if (jobcode2008 == "Social and related scientists" | jobcode2008 == "Non-S and E Occupations") | degreetypechange2001 == "Highest Degree Type Changed Outside of STEM"
replace surv01exit08 = 2 if jobcode2008 == "Logical Skip"
replace surv01exit08 = 3 if jobcode2008 == ""

label define surv01exit08label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv01exit08 surv01exit08label

noisily tab surv01exit08 gender2001, col
noisily tab surv01exit08 race2001 if race2001 != 6, col
noisily tab surv01exit08 birthplace2001 if birthplace2001 != 2, col
noisily tab surv01exit08 sciencegroup2001 if sciencegroup2001 !=7, col

gen surv01exit10 =.

replace surv01exit10 = 0 if (jobcode2010 != "Social and related scientists" & jobcode2010 != "Non-S and E Occupations" & jobcode2010 != "Logical Skip" )
replace surv01exit10 = 1 if (jobcode2010 == "Social and related scientists" | jobcode2010 == "Non-S and E Occupations") | degreetypechange2001 == "Highest Degree Type Changed Outside of STEM"
replace surv01exit10 = 2 if jobcode2010 == "Logical Skip"
replace surv01exit10 = 3 if jobcode2010 == ""

label define surv01exit10label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv01exit10 surv01exit10label

noisily tab surv01exit10 gender2001, col
noisily tab surv01exit10 race2001 if race2001 != 6, col
noisily tab surv01exit10 birthplace2001 if birthplace2001 != 2, col
noisily tab surv01exit10 sciencegroup2001 if sciencegroup2001 !=7, col

gen surv01exit13 =.

replace surv01exit13 = 0 if (jobcode2013 != "Social and related scientists" & jobcode2013 != "Non-S and E Occupations" & jobcode2013 != "Logical Skip")
replace surv01exit13 = 1 if (jobcode2013 == "Social and related scientists" | jobcode2013 == "Non-S and E Occupations") | degreetypechange2001 == "Highest Degree Type Changed Outside of ST	EM"
replace surv01exit13 = 2 if jobcode2013 == "Logical Skip"
replace surv01exit13 = 3 if jobcode2013 == ""

label define surv01exit13label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv01exit13 surv01exit13label

noisily tab surv01exit13 gender2001, col
noisily tab surv01exit13 race2001 if race2001 != 6, col
noisily tab surv01exit13 birthplace2001 if birthplace2001 != 2, col
noisily tab surv01exit13 sciencegroup2001 if sciencegroup2001 !=7, col

}
