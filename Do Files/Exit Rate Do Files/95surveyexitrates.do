******************** People who first appeared in the 1995 survey ***********************************
quietly {
*drop if highdgryr51995 <1990 | highdgryr51995 >= 1995 & highdgryr51993 !=.
*drop if highdgryr51995 <1993 | highdgryr51995 >= 1995 & highdgryr51993 ==. <---this is what it would be if we had the real data. But we don't, so we're including 1990 as directed


*Drops anyone who got a higher degree in STEM after this survey
foreach v of varlist highdgryr5* {
	drop if degreetypechange1995 == "Highest Degree Type Changed Within STEM" & (`v' > highdgryr51995)
} 

gen surv95exit95 =.

replace surv95exit95 = 0 if (jobcode1995 != "Social and related scientists" & jobcode1995 != "Non-S and E Occupations" & jobcode1995 != "Logical Skip")
replace surv95exit95 = 1 if (jobcode1995 == "Social and related scientists" | jobcode1995 == "Non-S and E Occupations" ) | degreetypechange1995 == "Highest Degree Type Changed Outside of STEM"
replace surv95exit95 = 2 if jobcode1995 == "Logical Skip"
replace surv95exit95 = 3 if jobcode1995 == ""

*Drop anyone who didn't respond to the first survey 95 survey
drop if surv95exit95 == 3

label define surv95exit95label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv95exit95 surv95exit95label

noisily tab surv95exit95 gender1995, col
noisily tab surv95exit95 race1995 if race1995 !=6, col
noisily tab surv95exit95 birthplace1995 if birthplace1995 != 2, col
noisily tab surv95exit95 sciencegroup1995 if sciencegroup1995 !=7, col

*Drop anyone who wasn't working in STEM the first 95 survey 
drop if (jobcode1995 == "Social and related scientists" | jobcode1995 == "Non-S and E Occupations" ) | degreetypechange1995 == "Highest Degree Type Changed Outside of STEM"

gen surv95exit97 =.

replace surv95exit97 = 0 if (jobcode1997 != "Social and related scientists" & jobcode1997 != "Non-S and E Occupations" & jobcode1997 != "Logical Skip")
replace surv95exit97 = 1 if (jobcode1997 == "Social and related scientists" | jobcode1997 == "Non-S and E Occupations") | degreetypechange1997 == "Highest Degree Type Changed Outside of STEM"
replace surv95exit97 = 2 if jobcode1997 == "Logical Skip"
replace surv95exit97 = 3 if jobcode1997 == ""

label define surv95exit97label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv95exit97 surv95exit97label

noisily tab surv95exit97 gender1995, col
noisily tab surv95exit97 race1995 if race1995 !=6, col
noisily tab surv95exit97 birthplace1995 if birthplace1995 != 2, col
noisily tab surv95exit97 sciencegroup1995 if sciencegroup1995 !=7, col

noisily tab surv95exit97 gender1995 if surv95exit97 != 3, col 
noisily tab surv95exit97 race1995 if surv95exit97 != 3 & race1995 != 6, col 
noisily tab surv95exit97 birthplace1995 if surv95exit97 != 3 & birthplace1995 != 2, col
noisily tab surv95exit97 sciencegroup1995 if surv95exit97 !=3 & sciencegroup1995 !=7, col

gen surv95exit99 =.

replace surv95exit99 = 0 if (jobcode1999 != "Social and related scientists" & jobcode1999 != "Non-S and E Occupations" & jobcode1999 != "Logical Skip") 
replace surv95exit99 = 1 if (jobcode1999 == "Social and related scientists" | jobcode1999 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"
replace surv95exit99 = 2 if jobcode1999 == "Logical Skip"
replace surv95exit99 = 3 if jobcode1999 == ""

label define surv95exit99label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv95exit99 surv95exit99label

noisily tab surv95exit99 gender1995, col
noisily tab surv95exit99 race1995 if race1995 !=6, col
noisily tab surv95exit99 birthplace1995 if birthplace1995 != 2, col
noisily tab surv95exit99 sciencegroup1995 if sciencegroup1995 !=7, col

gen surv95exit01 =.

replace surv95exit01 = 0 if (jobcode2001 != "Social and related scientists" & jobcode2001 != "Non-S and E Occupations" & jobcode2001 != "Logical Skip") 
replace surv95exit01 = 1 if (jobcode2001 == "Social and related scientists" | jobcode2001 == "Non-S and E Occupations") | degreetypechange2001 == "Highest Degree Type Changed Outside of STEM"
replace surv95exit01 = 2 if jobcode2001 == "Logical Skip"
replace surv95exit01 = 3 if jobcode2001 == ""

label define surv95exit01label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv95exit01 surv95exit01label

noisily tab surv95exit01 gender1995, col
noisily tab surv95exit01 race1995 if race1995 !=6, col
noisily tab surv95exit01 birthplace1995 if birthplace1995 != 2, col
noisily tab surv95exit01 sciencegroup1995 if sciencegroup1995 !=7, col

gen surv95exit03 =.

replace surv95exit03 = 0 if (jobcode2003 != "Social and related scientists" & jobcode2003 != "Non-S and E Occupations" & jobcode2003 != "Logical Skip" )
replace surv95exit03 = 1 if (jobcode2003 == "Social and related scientists" | jobcode2003 == "Non-S and E Occupations") | degreetypechange2003 == "Highest Degree Type Changed Outside of STEM"
replace surv95exit03 = 2 if jobcode2003 == "Logical Skip"
replace surv95exit03 = 3 if jobcode2003 == ""

label define surv95exit03label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv95exit03 surv95exit03label

noisily tab surv95exit03 gender1995, col
noisily tab surv95exit03 gender1995, col
noisily tab surv95exit03 race1995 if race1995 !=6, col
noisily tab surv95exit03 birthplace1995 if birthplace1995 != 2, col
noisily tab surv95exit03 sciencegroup1995 if sciencegroup1995 !=7, col

gen surv95exit06 =.

replace surv95exit06 = 0 if (jobcode2006 != "Social and related scientists" & jobcode2006 != "Non-S and E Occupations" & jobcode2006 != "Logical Skip")
replace surv95exit06 = 1 if (jobcode2006 == "Social and related scientists" | jobcode2006 == "Non-S and E Occupations") | degreetypechange2006 == "Highest Degree Type Changed Outside of STEM"
replace surv95exit06 = 2 if jobcode2006 == "Logical Skip"
replace surv95exit06 = 3 if jobcode2006 == ""

label define surv95exit06label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv95exit06 surv95exit06label

noisily tab surv95exit06 gender1995, col
noisily tab surv95exit06 gender1995, col
noisily tab surv95exit06 race1995 if race1995 !=6, col
noisily tab surv95exit06 birthplace1995 if birthplace1995 != 2, col
noisily tab surv95exit06 sciencegroup1995 if sciencegroup1995 !=7, col

gen surv95exit08 =.

replace surv95exit08 = 0 if (jobcode2008 != "Social and related scientists" & jobcode2008 != "Non-S and E Occupations" & jobcode2008 != "Logical Skip" )
replace surv95exit08 = 1 if (jobcode2008 == "Social and related scientists" | jobcode2008 == "Non-S and E Occupations") | degreetypechange2008 == "Highest Degree Type Changed Outside of STEM"
replace surv95exit08 = 2 if jobcode2008 == "Logical Skip"
replace surv95exit08 = 3 if jobcode2008 == ""

label define surv95exit08label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv95exit08 surv95exit08label

noisily tab surv95exit08 gender1995, col
noisily tab surv95exit08 gender1995, col
noisily tab surv95exit08 race1995 if race1995 !=6, col
noisily tab surv95exit08 birthplace1995 if birthplace1995 != 2, col
noisily tab surv95exit08 sciencegroup1995 if sciencegroup1995 !=7, col

gen surv95exit10 =.

replace surv95exit10 = 0 if (jobcode2010 != "Social and related scientists" & jobcode2010 != "Non-S and E Occupations" & jobcode2010 != "Logical Skip" )
replace surv95exit10 = 1 if (jobcode2010 == "Social and related scientists" | jobcode2010 == "Non-S and E Occupations") | degreetypechange2010 == "Highest Degree Type Changed Outside of STEM"
replace surv95exit10 = 2 if jobcode2010 == "Logical Skip"
replace surv95exit10 = 3 if jobcode2010 == ""

label define surv95exit10label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv95exit10 surv95exit10label

noisily tab surv95exit10 gender1995, col	
noisily tab surv95exit10 gender1995, col
noisily tab surv95exit10 race1995 if race1995 !=6, col
noisily tab surv95exit10 birthplace1995 if birthplace1995 != 2, col
noisily tab surv95exit10 sciencegroup1995 if sciencegroup1995 !=7, col

gen surv95exit13 =.

replace surv95exit13 = 0 if (jobcode2013 != "Social and related scientists" & jobcode2013 != "Non-S and E Occupations" & jobcode2013 != "Logical Skip")
replace surv95exit13 = 1 if (jobcode2013 == "Social and related scientists" | jobcode2013 == "Non-S and E Occupations") | degreetypechange2013 == "Highest Degree Type Changed Outside of STEM"
replace surv95exit13 = 2 if jobcode2013 == "Logical Skip"
replace surv95exit13 = 3 if jobcode2013 == ""

label define surv95exit13label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv95exit13 surv95exit13label

noisily tab surv95exit13 gender1995, col	
noisily tab surv95exit13 race1995 if race1995 !=6, col
noisily tab surv95exit13 birthplace1995 if birthplace1995 != 2, col
noisily tab surv95exit13 sciencegroup1995 if sciencegroup1995 !=7, col

}
