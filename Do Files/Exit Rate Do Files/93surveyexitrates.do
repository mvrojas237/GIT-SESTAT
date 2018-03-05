******************** People who first appeared in the 1993 survey ***********************************

quietly {

gen surv93exit93=.

replace surv93exit93 = 0 if (jobcode1993 != "Social and related scientists" & jobcode1993 != "Non-S and E Occupations" & jobcode1993 != "Logical Skip")
replace surv93exit93 = 1 if (jobcode1993 == "Social and related scientists" | jobcode1993 == "Non-S and E Occupations") | degreetypechange1993 == "Highest Degree Type Changed Outside of STEM"
replace surv93exit93 = 2 if jobcode1993 == "Logical Skip"
replace surv93exit93 = 3 if jobcode1993 == "" 

label define surv93exit93label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv93exit93 surv93exit93label

*Drop anyone who didn't respond to the first survey 93 survey
drop if surv93exit93 == 3

noisily tab surv93exit93 gender1993, col
noisily tab surv93exit93 race1993 if race1993 != 6, col
noisily tab surv93exit93 birthplace1993 if birthplace1993 !=2, col
noisily tab surv93exit93 sciencegroup1993 if sciencegroup1993 !=7, col //don't want social scientists
noisily tab surv93exit93 dummystem, col

*drop people who didn't initially work in science in 1993
drop if (jobcode1993 == "Social and related scientists" | jobcode1993 == "Non-S and E Occupations") | degreetypechange1993 == "Highest Degree Type Changed Outside of STEM"

gen surv93exit95 =.

replace surv93exit95 = 0 if (jobcode1995 != "Social and related scientists" & jobcode1995 != "Non-S and E Occupations" & jobcode1995 != "Logical Skip")
replace surv93exit95 = 1 if (jobcode1995 == "Social and related scientists" | jobcode1995 == "Non-S and E Occupations") | degreetypechange1995 == "Highest Degree Type Changed Outside of STEM"
replace surv93exit95 = 2 if jobcode1995 == "Logical Skip"
replace surv93exit95 = 3 if jobcode1995 == ""

label define surv93exit95label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing" 
label values surv93exit95 surv93exit95label

noisily tab surv93exit95 gender1993, col
noisily tab surv93exit95 race1993 if race1993 != 6, col
noisily tab surv93exit95 birthplace1993 if birthplace1993 !=2, col
noisily tab surv93exit95 sciencegroup1993 if sciencegroup1993 !=7, col //don't want social scientists
 
noisily tab surv93exit95 gender1993 if surv93exit95 != 3, col
noisily tab surv93exit95 race1993 if race1993 != 6 & surv93exit95 != 3, col
noisily tab surv93exit95 birthplace1993 if surv93exit95 != 3 & birthplace1993 != 2, col
noisily tab surv93exit95 sciencegroup1993 if surv93exit95 != 3 & sciencegroup1993 !=7, col

gen surv93exit97 =.

replace surv93exit97 = 0 if (jobcode1997 != "Social and related scientists" & jobcode1997 != "Non-S and E Occupations" & jobcode1997 != "Logical Skip")
replace surv93exit97 = 1 if (jobcode1997 == "Social and related scientists" | jobcode1997 == "Non-S and E Occupations") | degreetypechange1997 == "Highest Degree Type Changed Outside of STEM"
replace surv93exit97 = 2 if jobcode1997 == "Logical Skip"
replace surv93exit97 = 3 if jobcode1997 == ""

label define surv93exit97label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv93exit97 surv93exit97label

noisily tab surv93exit97 gender1993, col
noisily tab surv93exit97 race1993 if race1993 != 6, col
noisily tab surv93exit97 birthplace1993 if birthplace1993 !=2, col
noisily tab surv93exit97 sciencegroup1993 if sciencegroup1993 !=7, col

gen surv93exit99 =.

replace surv93exit99 = 0 if (jobcode1999 != "Social and related scientists" & jobcode1999 != "Non-S and E Occupations"& jobcode1999 != "Logical Skip")
replace surv93exit99 = 1 if (jobcode1999 == "Social and related scientists" | jobcode1999 == "Non-S and E Occupations") | degreetypechange1999 == "Highest Degree Type Changed Outside of STEM"
replace surv93exit99 = 2 if jobcode1999 == "Logical Skip"
replace surv93exit99 = 3 if jobcode1999 == ""

label define surv93exit99label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv93exit99 surv93exit99label

noisily tab surv93exit99 gender1993, col
noisily tab surv93exit99 race1993 if race1993 != 6, col
noisily tab surv93exit99 birthplace1993 if birthplace1993 !=2, col
noisily tab surv93exit99 sciencegroup1993 if sciencegroup1993 !=7, col

gen surv93exit01 =.

replace surv93exit01 = 0 if (jobcode2001 != "Social and related scientists" & jobcode2001 != "Non-S and E Occupations" & jobcode2001 != "Logical Skip")
replace surv93exit01 = 1 if (jobcode2001 == "Social and related scientists" | jobcode2001 == "Non-S and E Occupations" ) | degreetypechange2001 == "Highest Degree Type Changed Outside of STEM"
replace surv93exit01 = 2 if jobcode2001 == "Logical Skip"
replace surv93exit01 = 3 if jobcode2001 == ""

label define surv93exit01label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv93exit01 surv93exit01label

noisily tab surv93exit01 gender1993, col
noisily tab surv93exit01 race1993 if race1993 != 6, col
noisily tab surv93exit01 birthplace1993 if birthplace1993 !=2, col
noisily tab surv93exit01 sciencegroup1993 if sciencegroup1993 !=7, col


gen surv93exit03 =.

replace surv93exit03 = 0 if (jobcode2003 != "Social and related scientists" & jobcode2003 != "Non-S and E Occupations" & jobcode2003 != "Logical Skip")
replace surv93exit03 = 1 if (jobcode2003 == "Social and related scientists" | jobcode2003 == "Non-S and E Occupations") | degreetypechange2003 == "Highest Degree Type Changed Outside of STEM"
replace surv93exit03 = 2 if jobcode2003 == "Logical Skip"
replace surv93exit03 = 3 if jobcode2003 == ""

label define surv93exit03label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv93exit03 surv93exit03label

noisily tab surv93exit03 gender1993, col
noisily tab surv93exit03 race1993 if race1993 != 6, col
noisily tab surv93exit03 birthplace1993 if birthplace1993 !=2, col
noisily tab surv93exit03 sciencegroup1993 if sciencegroup1993 !=7, col

gen surv93exit06 =.

replace surv93exit06 = 0 if (jobcode2006 != "Social and related scientists" & jobcode2006 != "Non-S and E Occupations"  & jobcode2006 != "Logical Skip")
replace surv93exit06 = 1 if (jobcode2006 == "Social and related scientists" | jobcode2006 == "Non-S and E Occupations") | degreetypechange2006 == "Highest Degree Type Changed Outside of STEM"
replace surv93exit06 = 2 if jobcode2006 == "Logical Skip"
replace surv93exit06 = 3 if jobcode2006 == ""

label define surv93exit06label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv93exit06 surv93exit06label

noisily tab surv93exit06 gender1993, col
noisily tab surv93exit06 race1993 if race1993 != 6, col
noisily tab surv93exit06 birthplace1993 if birthplace1993 !=2, col
noisily tab surv93exit06 sciencegroup1993 if sciencegroup1993 !=7, col

gen surv93exit08 =.

replace surv93exit08 = 0 if (jobcode2008 != "Social and related scientists" & jobcode2008 != "Non-S and E Occupations" & jobcode2008 != "Logical Skip") 
replace surv93exit08 = 1 if (jobcode2008 == "Social and related scientists" | jobcode2008 == "Non-S and E Occupations") | degreetypechange2008 == "Highest Degree Type Changed Outside of STEM"
replace surv93exit08 = 2 if jobcode2008 == "Logical Skip"
replace surv93exit08 = 3 if jobcode2008 == ""

label define surv93exit08label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv93exit08 surv93exit08label

noisily tab surv93exit08 gender1993, col
noisily tab surv93exit08 race1993 if race1993 != 6, col
noisily tab surv93exit08 birthplace1993 if birthplace1993 !=2, col
noisily tab surv93exit08 sciencegroup1993 if sciencegroup1993 !=7, col

gen surv93exit10 =.

replace surv93exit10 = 0 if (jobcode2010 != "Social and related scientists" & jobcode2010 != "Non-S and E Occupations" & jobcode2010 != "Logical Skip") 
replace surv93exit10 = 1 if (jobcode2010 == "Social and related scientists" | jobcode2010 == "Non-S and E Occupations") | degreetypechange2010 == "Highest Degree Type Changed Outside of STEM"
replace surv93exit10 = 2 if jobcode2010 == "Logical Skip"
replace surv93exit10 = 3 if jobcode2010 == ""

label define surv93exit10label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv93exit10 surv93exit10label

noisily tab surv93exit10 gender1993, col	
noisily tab surv93exit10 race1993 if race1993 != 6, col
noisily tab surv93exit10 birthplace1993 if birthplace1993 !=2, col
noisily tab surv93exit10 sciencegroup1993 if sciencegroup1993 !=7, col

gen surv93exit13 =.

replace surv93exit13 = 0 if (jobcode2013 != "Social and related scientists" & jobcode2013 != "Non-S and E Occupations" & jobcode2013 != "Logical Skip") 
replace surv93exit13 = 1 if (jobcode2013 == "Social and related scientists" | jobcode2013 == "Non-S and E Occupations") | degreetypechange2013 == "Highest Degree Type Changed Outside of STEM"
replace surv93exit13 = 2 if jobcode2013 == "Logical Skip"
replace surv93exit13 = 3 if jobcode2013 == ""

label define surv93exit13label 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working" 3 "Missing"
label values surv93exit13 surv93exit13label

noisily tab surv93exit13 gender1993, col
noisily tab surv93exit13 race1993 if race1993 != 6, col
noisily tab surv93exit13 birthplace1993 if birthplace1993 !=2, col
noisily tab surv93exit13 sciencegroup1993 if sciencegroup1993 !=7, col
}
