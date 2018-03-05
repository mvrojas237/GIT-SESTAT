clear
set more off
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston\SESTAT Data Work"


*********Follow 1993 Cohorts*******

use "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey93exitratesHD.dta"
do "Do Files\Porportional Hazard Data Generator.do"
save "Data Files\Proportional Hazards\Non-Social Science\1993 cohorts nonSS.dta", replace

*********Follow 1995 Cohorts*******
 
use "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey95exitratesHD.dta"
do "Do Files\Porportional Hazard Data Generator.do"
save "Data Files\Proportional Hazards\Non-Social Science\1995 cohorts nonSS.dta", replace


*********Follow 1997 Cohorts*******
 

use "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey97exitratesHD.dta"
do "Do Files\Porportional Hazard Data Generator.do"
save "Data Files\Proportional Hazards\Non-Social Science\1997 cohorts nonSS.dta", replace

*********Follow 1999 Cohorts******* 

use "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey99exitratesHD.dta"
do "Do Files\Porportional Hazard Data Generator.do"
save "Data Files\Proportional Hazards\Non-Social Science\1999 cohorts nonSS.dta", replace


*********Follow 2001 Cohorts*******

use "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey01exitratesHD.dta"
do "Do Files\Porportional Hazard Data Generator.do"
save "Data Files\Proportional Hazards\Non-Social Science\2001 cohorts nonSS.dta", replace



*********Follow 2003 Cohorts*******
 
use "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey03exitratesHD.dta"
do "Do Files\Porportional Hazard Data Generator.do"
save "Data Files\Proportional Hazards\Non-Social Science\2003 cohorts nonSS.dta", replace



*********Follow 2006 Cohorts*******
use "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey06exitratesHD.dta"
do "Do Files\Porportional Hazard Data Generator.do"
save "Data Files\Proportional Hazards\Non-Social Science\2006 cohorts nonSS.dta", replace


*********Follow 2008 Cohorts*******
 
use "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey08exitratesHD.dta"
do "Do Files\Porportional Hazard Data Generator.do"
save "Data Files\Proportional Hazards\Non-Social Science\2008 cohorts nonSS.dta", replace


*********Follow 2010 Cohorts*******
 
use "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey10exitratesHD.dta"
do "Do Files\Porportional Hazard Data Generator.do"
save "Data Files\Proportional Hazards\Non-Social Science\2010 cohorts nonSS.dta", replace


*********Follow 2013 Cohorts*******
 
use "Data Files\Following Grads\Non-Social Science STEM\Highest Degree\survey13exitratesHD.dta"
do "Do Files\Porportional Hazard Data Generator.do"
save "Data Files\Proportional Hazards\Non-Social Science\2013 cohorts nonSS.dta", replace


********* Append all Cohorts *********
cd "Data Files\Proportional Hazards\Non-Social Science"

use "1993 cohorts nonSS.dta"
append using "1995 cohorts nonSS.dta"
append using "1997 cohorts nonSS.dta"
append using "1999 cohorts nonSS.dta"
append using "2001 cohorts nonSS.dta"
append using "2003 cohorts nonSS.dta"
append using "2006 cohorts nonSS.dta"
append using "2008 cohorts nonSS.dta"
append using "2010 cohorts nonSS.dta"
append using "2013 cohorts nonSS.dta"


order id yrofsurvey female	dummystemjob stemexityear stemexitdgryear stemyears

save "all cohorts long.dta", replace 





