/*
This file takes the raw data file for each year and processes it using the "Raw Data Cleanup" do file (located in the same file as this do file).
*/

clear
set more off
*************
* 1993 - 1999 DATA * 
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston\SESTAT Data Work"

*opens and imports 1993 dataset
import sasxport "Data Files\Raw Data Files\1993-1999 SESTAT (Integrated Survey Data)\1993-1999SESTATpublic\DATA\SESTAT93.XPT", novallabel
gen yrofsurvey = 1993
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\cleanedup93.dta", replace

import sasxport "Data Files\Raw Data Files\1993-1999 SESTAT (Integrated Survey Data)\1993-1999SESTATpublic\DATA\SESTAT95.XPT", novallabel
gen yrofsurvey = 1995
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\cleanedup95.dta", replace

import sasxport "Data Files\Raw Data Files\1993-1999 SESTAT (Integrated Survey Data)\1993-1999SESTATpublic\DATA\SESTAT97.XPT", novallabel
gen yrofsurvey = 1997
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\cleanedup97.dta", replace

import sasxport "Data Files\Raw Data Files\1993-1999 SESTAT (Integrated Survey Data)\1993-1999SESTATpublic\DATA\SESTAT99.XPT", novallabel
gen yrofsurvey = 1999
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\cleanedup99.dta", replace

************** 
* 2001 DATA *

* PART 1: NATIONAL SURVEY OF RECENT COLLEGE GRADUATES
import sasxport "Data Files\Raw Data Files\2001 SESTAT\NSRCG01\NSRCG01.XPT", novallabel
gen yrofsurvey = 2001
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\surveyofgrads2001.dta", replace

* PART 2: SURVEY OF DOCTORATE RECIPIENTS
import sasxport "Data Files\Raw Data Files\2001 SESTAT\SDR01\SDR01.XPT", novallabel
gen yrofsurvey = 2001
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\surveyofdoctorates2001.dta", replace
append using "Data Files\surveyofgrads2001.dta"
save "Data Files\cleanedup2001.dta", replace

**************
* 2003 DATA *

import sasxport "Data Files\Raw Data Files\2003 SESTAT (Integrated Survey Data)\2003SESTATpublic\epse03.XPT", novallabel
gen yrofsurvey = 2003
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\cleanedup2003.dta", replace


*********************
* 2006 DATA * 

import sasxport "Data Files\Raw Data Files\2006 SESTAT (Integrated Survey Data)\2006SESTATpublic\epses06.XPT", novallabel
gen yrofsurvey = 2006
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\cleanedup2006.dta", replace

*********************
* 2008 DATA *

import sasxport "Data Files\Raw Data Files\2008 SESTAT (Integrated Survey Data)\EPSE08.XPT", novallabel
gen yrofsurvey = 2008
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\cleanedup2008.dta", replace

********************
* 2010 DATA *
import sasxport "Data Files\Raw Data Files\2010 SESTAT (Integrated Survey Data)\EPSE10.XPT", novallabel
gen yrofsurvey = 2010
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\cleanedup2010.dta", replace


********************
* 2013 DATA *

import sasxport "Data Files\Raw Data Files\2013 SESTAT (Integrated Survey Data)\EPSE13.XPT", novallabel
gen yrofsurvey = 2013
do "Do Files\2. Raw Data Cleanup.do"
save "Data Files\cleanedup2013.dta", replace
