
******************** People who first appeared in the 1997 survey ***********************************
quietly {
*drop if highdgryr51997 <1995 | highdgryr51997 >= 1997 & highdgryr51993 !=. & highdgryr51995 !=.
*see above for Restricted Use Data

*Drops anyone who got a higher degree in STEM after this survey
foreach v of varlist highdgryr5* {
	drop if degreetypechange1997 == "Highest Degree Type Changed Within STEM" & (`v' > highdgryr51997)
} 

gen surv97exit97 =.

replace surv97exit97 = 0 if (jobcode1997 != "Social and related scientists" & jobcode1997 != "Non-S and E Occupations" & jobcode1997 != "Logical Skip")
replace surv97exit97 = 1 if (jobcode1997 == "Social and related scientists" | jobcode1997 == "Non-S and E Occupations") | degreetypechange1997 == "Highest Degree Type Changed Outside of STEM"
replace surv97exit97 = 2 if jobcode1997 == "Logical Skip"
replace surv97exit97 = 3 if jobcode1997 == ""

label define surv97exit97label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv97exit97 surv97exit97label


*Drop anyone who didn't respond to the first survey 97 survey
drop if surv97exit97 == 3

noisily tab surv97exit97 gender1997, col
noisily tab surv97exit97 race1997 if race1997 != 6, col
noisily tab surv97exit97 birthplace1997 if birthplace1997 != 2, col
noisily tab surv97exit97 sciencegroup1997 if sciencegroup1997 !=7, col

*Drop anyone who wasn't working in STEM the first 97 survey 
drop if (jobcode1997 == "Social and related scientists" | jobcode1997 == "Non-S and E Occupations") | degreetypechange1997 == "Highest Degree Type Changed Outside of STEM"

gen surv97exit99 =.

replace surv97exit99 = 0 if (jobcode1999 != "Social and related scientists" & jobcode1999 != "Non-S and E Occupations"& jobcode1999 != "Logical Skip")
replace surv97exit99 = 1 if (jobcode1999 == "Social and related scientists" | jobcode1999 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"
replace surv97exit99 = 2 if jobcode1999 == "Logical Skip"
replace surv97exit99 = 3 if jobcode1999 == ""

label define surv97exit99label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv97exit99 surv97exit99label

noisily tab surv97exit99 gender1997, col
noisily tab surv97exit99 race1997 if race1997 != 6, col
noisily tab surv97exit99 birthplace1997  if birthplace1997 != 2 ,col
noisily tab surv97exit99 sciencegroup1997 if sciencegroup1997 !=7, col

noisily tab surv97exit99 gender1997 if surv97exit99 != 3, col
noisily tab surv97exit99 race1997 if surv97exit99 != 3 & race1997 != 6, col
noisily tab surv97exit99 birthplace1997 if surv97exit99 != 3 & birthplace1997 != 2, col
noisily tab surv97exit99 sciencegroup1997 if surv97exit99 != 3 & sciencegroup1997 !=7, col

gen surv97exit01 =.

replace surv97exit01 = 0 if (jobcode2001 != "Social and related scientists" & jobcode2001 != "Non-S and E Occupations" & jobcode2001 != "Logical Skip")
replace surv97exit01 = 1 if (jobcode2001 == "Social and related scientists" | jobcode2001 == "Non-S and E Occupations") | degreetypechange2001 == "Highest Degree Type Changed Outside of STEM"
replace surv97exit01 = 2 if jobcode2001 == "Logical Skip"
replace surv97exit01 = 3 if jobcode2001 == ""

label define surv97exit01label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv97exit01 surv97exit01label

noisily tab surv97exit01 gender1997, col
noisily tab surv97exit01 race1997 if race1997 != 6, col
noisily tab surv97exit01 birthplace1997  if birthplace1997 != 2 ,col
noisily tab surv97exit01 sciencegroup1997 if sciencegroup1997 !=7, col

gen surv97exit03 =.

replace surv97exit03 = 0 if (jobcode2003 != "Social and related scientists" & jobcode2003 != "Non-S and E Occupations" & jobcode2003 != "Logical Skip" )
replace surv97exit03 = 1 if (jobcode2003 == "Social and related scientists" | jobcode2003 == "Non-S and E Occupations") | degreetypechange2003 == "Highest Degree Type Changed Outside of STEM"
replace surv97exit03 = 2 if jobcode2003 == "Logical Skip"
replace surv97exit03 = 3 if jobcode2003 == ""

label define surv97exit03label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv97exit03 surv97exit03label

noisily tab surv97exit03 gender1997, col
noisily tab surv97exit03 race1997 if race1997 != 6, col
noisily tab surv97exit03 birthplace1997  if birthplace1997 != 2 ,col
noisily tab surv97exit03 sciencegroup1997 if sciencegroup1997 !=7, col

gen surv97exit06 =.

replace surv97exit06 = 0 if (jobcode2006 != "Social and related scientists" & jobcode2006 != "Non-S and E Occupations" & jobcode2006 != "Logical Skip")
replace surv97exit06 = 1 if (jobcode2006 == "Social and related scientists" | jobcode2006 == "Non-S and E Occupations") | degreetypechange2006 == "Highest Degree Type Changed Outside of STEM"
replace surv97exit06 = 2 if jobcode2006 == "Logical Skip"
replace surv97exit06 = 3 if jobcode2006 == ""

label define surv97exit06label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv97exit06 surv97exit06label

noisily tab surv97exit06 gender1997, col
noisily tab surv97exit06 race1997 if race1997 != 6, col
noisily tab surv97exit06 birthplace1997  if birthplace1997 != 2 ,col
noisily tab surv97exit06 sciencegroup1997 if sciencegroup1997 !=7, col

gen surv97exit08 =.

replace surv97exit08 = 0 if (jobcode2008 != "Social and related scientists"  & jobcode2008 != "Non-S and E Occupations" & jobcode2008 != "Logical Skip")
replace surv97exit08 = 1 if (jobcode2008 == "Social and related scientists" | jobcode2008 == "Non-S and E Occupations") | degreetypechange2008 == "Highest Degree Type Changed Outside of STEM"
replace surv97exit08 = 2 if jobcode2008 == "Logical Skip"
replace surv97exit08 = 3 if jobcode2008 == ""

label define surv97exit08label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv97exit08 surv97exit08label

noisily tab surv97exit08 gender1997, col	
noisily tab surv97exit08 race1997 if race1997 != 6, col
noisily tab surv97exit08 birthplace1997 if birthplace1997 != 2 ,col
noisily tab surv97exit08 sciencegroup1997 if sciencegroup1997 !=7, col


gen surv97exit10 =.

replace surv97exit10 = 0 if (jobcode2010 != "Social and related scientists" & jobcode2010 != "Non-S and E Occupations" & jobcode2010 != "Logical Skip" )
replace surv97exit10 = 1 if (jobcode2010 == "Social and related scientists" | jobcode2010 == "Non-S and E Occupations") | degreetypechange2010 == "Highest Degree Type Changed Outside of STEM"
replace surv97exit10 = 2 if jobcode2010 == "Logical Skip"
replace surv97exit10 = 3 if jobcode2010 == ""

label define surv97exit10label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv97exit10 surv97exit10label

noisily tab surv97exit10 gender1997, col
noisily tab surv97exit10 race1997 if race1997 != 6, col
noisily tab surv97exit10 birthplace1997  if birthplace1997 != 2, col
noisily tab surv97exit10 sciencegroup1997 if sciencegroup1997 !=7, col

gen surv97exit13 =.

replace surv97exit13 = 0 if (jobcode2013 != "Social and related scientists" & jobcode2013 != "Non-S and E Occupations" & jobcode2013 != "Logical Skip")
replace surv97exit13 = 1 if (jobcode2013 == "Social and related scientists" | jobcode2013 == "Non-S and E Occupations") | degreetypechange2013 == "Highest Degree Type Changed Outside of STEM"
replace surv97exit13 = 2 if jobcode2013 == "Logical Skip"
replace surv97exit13 = 3 if jobcode2013 == ""

label define surv97exit13label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv97exit13 surv97exit13label

noisily tab surv97exit13 gender1997, col
noisily tab surv97exit13 race1997 if race1997 != 6, col
noisily tab surv97exit13 birthplace1997  if birthplace1997 != 2 ,col
noisily tab surv97exit13 sciencegroup1997 if sciencegroup1997 !=7, col

}
