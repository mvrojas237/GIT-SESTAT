******************** People who first appeared in the 1999 survey ***********************************
quietly {

*drop if highdgryr51999 <1995 | highdgryr51999 >= 1999 & highdgryr51993 !=. & highdgryr51995 !=. & highdgryr51997 !=.
*see above for Restricted Use Data
*Drops anyone who got a higher degree in STEM after this survey
foreach v of varlist highdgryr5* {
	drop if degreetypechange1999 == "Highest Degree Type Changed Within STEM" & (`v' > highdgryr51999)
} 

gen surv99exit99 =.

replace surv99exit99 = 0 if (jobcode1999 != "Social and related scientists" & jobcode1999 != "Non-S and E Occupations"& jobcode1999 != "Logical Skip") 
replace surv99exit99 = 1 if (jobcode1999 == "Social and related scientists" | jobcode1999 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"
replace surv99exit99 = 2 if jobcode1999 == "Logical Skip"
replace surv99exit99 = 3 if jobcode1999 == ""

label define surv99exit99label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv99exit99 surv99exit99label

*Drop anyone who didn't respond to the first survey 99 survey
drop if surv99exit99 == 3

noisily tab surv99exit99 gender1999, col
noisily tab surv99exit99 race1999 if race1999 != 6, col
noisily tab surv99exit99 birthplace1999 if birthplace1999 != 2, col
noisily tab surv99exit99 sciencegroup1999 if sciencegroup1999 !=7, col

*Drop anyone who wasn't working in STEM the first 99 survey 
drop if (jobcode1999 == "Social and related scientists" | jobcode1999 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"

gen surv99exit01 =.

replace surv99exit01 = 0 if (jobcode2001 != "Social and related scientists" & jobcode2001 != "Non-S and E Occupations" & jobcode2001 != "Logical Skip")
replace surv99exit01 = 1 if (jobcode2001 == "Social and related scientists" | jobcode2001 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"
replace surv99exit01 = 2 if jobcode2001 == "Logical Skip"
replace surv99exit01 = 3 if jobcode2001 == ""

label define surv99exit01label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv99exit01 surv99exit01label

noisily tab surv99exit01 gender1999, col
noisily tab surv99exit01 race1999 if race1999 != 6, col
noisily tab surv99exit01 birthplace1999 if birthplace1999 != 2, col
noisily tab surv99exit01 sciencegroup1999 if sciencegroup1999 !=7, col

noisily tab surv99exit01 gender1999 if surv99exit01 !=3 , col
noisily tab surv99exit01 race1999 if surv99exit01 !=3 & race1999 != 6, col
noisily tab surv99exit01 birthplace1999 if surv99exit01 !=3 & birthplace1999 != 2, col
noisily tab surv99exit01 sciencegroup1999 if surv99exit01 !=3 & sciencegroup1999 !=7, col

gen surv99exit03 =.

replace surv99exit03 = 0 if (jobcode2003 != "Social and related scientists" & jobcode2003 != "Non-S and E Occupations" & jobcode2003 != "Logical Skip")
replace surv99exit03 = 1 if (jobcode2003 == "Social and related scientists" | jobcode2003 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"
replace surv99exit03 = 2 if jobcode2003 == "Logical Skip"
replace surv99exit03 = 3 if jobcode2003 == ""

label define surv99exit03label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv99exit03 surv99exit03label

noisily tab surv99exit03 gender1999, col
noisily tab surv99exit03 race1999 if race1999 != 6, col
noisily tab surv99exit03 birthplace1999 if birthplace1999 != 2, col
noisily tab surv99exit03 sciencegroup1999 if sciencegroup1999 !=7, col

gen surv99exit06 =.

replace surv99exit06 = 0 if (jobcode2006 != "Social and related scientists" & jobcode2006 != "Non-S and E Occupations" & jobcode2006 != "Logical Skip")
replace surv99exit06 = 1 if (jobcode2006 == "Social and related scientists" | jobcode2006 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"
replace surv99exit06 = 2 if jobcode2006 == "Logical Skip"
replace surv99exit06 = 3 if jobcode2006 == ""

label define surv99exit06label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv99exit06 surv99exit06label

noisily tab surv99exit06 gender1999, col
noisily tab surv99exit06 race1999 if race1999 != 6, col
noisily tab surv99exit06 birthplace1999 if birthplace1999 != 2, col
noisily tab surv99exit06 sciencegroup1999 if sciencegroup1999 !=7, col

gen surv99exit08 =.

replace surv99exit08 = 0 if (jobcode2008 != "Social and related scientists" & jobcode2008 != "Non-S and E Occupations" & jobcode2008 != "Logical Skip")
replace surv99exit08 = 1 if (jobcode2008 == "Social and related scientists" | jobcode2008 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"
replace surv99exit08 = 2 if jobcode2008 == "Logical Skip"
replace surv99exit08 = 3 if jobcode2008 == ""

label define surv99exit08label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv99exit08 surv99exit08label

noisily tab surv99exit08 gender1999, col
noisily tab surv99exit08 race1999 if race1999 != 6, col
noisily tab surv99exit08 birthplace1999 if birthplace1999 != 2, col
noisily tab surv99exit08 sciencegroup1999 if sciencegroup1999 !=7, col

gen surv99exit10 =.

replace surv99exit10 = 0 if (jobcode2010 != "Social and related scientists" & jobcode2010 != "Non-S and E Occupations" & jobcode2010 != "Logical Skip")
replace surv99exit10 = 1 if (jobcode2010 == "Social and related scientists" | jobcode2010 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"
replace surv99exit10 = 2 if jobcode2010 == "Logical Skip"
replace surv99exit10 = 3 if jobcode2010 == ""

label define surv99exit10label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv99exit10 surv99exit10label

noisily tab surv99exit10 gender1999, col
noisily tab surv99exit10 race1999 if race1999 != 6, col
noisily tab surv99exit10 birthplace1999 if birthplace1999 != 2, col
noisily tab surv99exit10 sciencegroup1999 if sciencegroup1999 !=7, col

gen surv99exit13 =.

replace surv99exit13 = 0 if (jobcode2013 != "Social and related scientists" & jobcode2013 != "Non-S and E Occupations" & jobcode2013 != "Logical Skip")
replace surv99exit13 = 1 if (jobcode2013 == "Social and related scientists" | jobcode2013 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"
replace surv99exit13 = 2 if jobcode2013 == "Logical Skip"
replace surv99exit13 = 3 if jobcode2013 == ""

label define surv99exit13label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv99exit13 surv99exit13label

noisily tab surv99exit13 gender1999, col
noisily tab surv99exit13 race1999 if race1999 != 6, col
noisily tab surv99exit13 birthplace1999 if birthplace1999 != 2, col
noisily tab surv99exit13 sciencegroup1999 if sciencegroup1999 !=7, col
}
