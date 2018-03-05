clear
set more off

cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston\SESTAT Data Work"
use "Data Files\Proportional Hazards\Non-Social Science\allcohortslong.dta"

/*stset necessary to run stcox. Declares the dataset usable for stcox, defines which variable is the survival time 
which in this case is how many years they were in stem. 
- stemyears tells us how many years they were in stem or *until they stopped responding to the survey* 
- failure option defines what an exit is -- in this case, not having a stem job. 
- id option tells stata that data with the same id in the variable id are the same subject NOT SURE WHY NOT WORKING
- origin(#) option 	defines when to start the analysis.
https://www.stata.com/manuals13/ststset.pdf#ststset
*/ 

gsort id yrofsur


*Convert years to months
gen survmonth = 18 if (cohortyear == 1993 & yrofsurvey == 1993) | (cohortyear == 2013 & yrofsurvey == 2013)
replace survmonth = 30 if (cohortyear == 1995 & yrofsurvey == 1995) | (cohortyear == 2006 & yrofsurvey == 2006)
replace survmonth = 12 if (cohortyear == 1997 & yrofsurvey == 1997) | (cohortyear == 2003 & yrofsurvey == 2003) | (cohortyear == 2008 & yrofsurvey == 2008)
replace survmonth = 24 if (cohortyear == 1999 & yrofsurvey == 1999) | (cohortyear == 2010 & yrofsurvey == 2010)
replace survmonth = 6 if cohortyear == 2001 & yrofsurvey == 2001
	
by id: replace survmonth = (yrofsurvey - yrofsurvey[_n-1])*12 + survmonth[_n-1] if survmonth ==. 
save "Data Files\Proportional Hazards\Non-Social Science\coxallcohortslong1.dta", replace

* This is the list of variables that are constant for all observations...fill command?
*ds female cohortyear yrofsurvey actualhigh minrty race usborn
* Must convert snapshot data into time series: https://www.stata.com/manuals13/stsnapspan.pdf#stsnapspan
snapspan id survmonth instem, generate(survmonth0) replace
*Declare data to be survival data
stset survmonth, failure(instem==0) id(id)


stcox female, robust
stcox minrty, robust

save "Data Files\Proportional Hazards\Non-Social Science\coxallcohortslong.dta", replace


cd "Documents\Survival Graphs"
sts graph, saving(general, replace)
sts graph, cumhaz saving(generalcumhaz, replace)
sts graph, by(female) saving(female, replace)
sts graph, by(female) cumhaz saving(femalecumhaz, replace)
sts graph, by(race) saving(race, replace)
sts graph, by(race) cumhaz saving(racecumhaz, replace)
sts graph, by(minrty) saving(minrty, replace)
sts graph, by(minrty) cumhaz saving(minrtycumhaz, replace)
sts graph, by(sciencegroup) saving(sciencegroup, replace)
sts graph, by(sciencegroup) cumhaz saving(sciencegroupcumhaz, replace)
sts graph, by(highdgrtype) saving(highdgrtype, replace)
sts graph, by(highdgrtype) cumhaz saving(highdgrtypecumhaz, replace)
sts graph, by(uscitizen) saving(uscitizen, replace)
sts graph, by(uscitizen) cumhaz saving(uscitizencumhaz, replace)

graph combine general.gph generalcumhaz.gph female.gph femalecumhaz.gph race.gph racecumhaz.gph minrty.gph minrtycumhaz.gph sciencegroup.gph ///
sciencegroupcumhaz.gph highdgrtype.gph highdgrtypecumhaz.gph uscitizen.gph uscitizencumhaz.gph, colfirst col(1) ///
xsize(1.5) ysize(20) iscale(*2) saving(all, replace)

graph export all.pdf, replace



* https://www.stata.com/manuals13/ststcox.pdf
*Understand more how stata deals with gaps in observations
* Figure out how to run regression from year before 
* stem exit year is average of window -- everybody should start with the same exit year 
