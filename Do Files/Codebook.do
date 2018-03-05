/*
This writes the code for the codebook. I realize there is a STATA codebook command, but it is rather limited. 

*** You need "Distinct" program installed. Simplifies coding a bit
ssc install distinct

*/
clear
set more off
cd "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston\SESTAT Data Work"
use "Data Files\Proportional Hazards\Non-Social Science\coxallcohortslong1.dta"

order *, alpha

erase codebook.txt
foreach var of varlist actualhigh age allstemdgr allstemjob changecareer changecon {
	notes _fetch note1 : `var' 1
	notes _fetch note2 : `var' 2
	quietly {
		log using codebook.txt, text append
		* HEADER if "`var'" == actualhigh 
		noisily disp "_____________________________________________________________________________________________" _newline "`var'" _newline "_____________________________________________________________________________________________"
		
		sum `var', detail
		local type : type `var'
		local range = "[`r(min)'," + "`r(max)']"
		local missing = _N - r(N)
		
		noisily disp _newline _continue "          type: `type'"
		noisily disp _continue "             mean: "
		noisily disp %-10.0fc `r(mean)'
		noisily disp _continue "          range: `range'"
		noisily disp _continue "          standard deviation: "
		noisily disp %-10.0fc `r(sd)'
		noisily disp _continue "          missing: "
		noisily disp %-10.0fc `missing'
		distinct `var'
		if `r(ndistinct)' > 15  {
			noisily disp _newline "          percentiles:     10%     25%     75%     90%"
			noisily disp "                           `r(p10)'      `r(p25)'       `r(p75)'      `r(p90)'"
		} 
		else {
			noisily tab `var', sort
		}
		noisily disp "`note1'"
		noisily disp _newline "`note2'"
		log close
	}	
}

tabout race female using tables.txt, replace ///
c(col row) f(1) style(txt) npos(both) nlab(Sample size) 

/*
erase codebook.txt

foreach var of varlist age changecon {
	notes _fetch note1 : `var' 1
	notes _fetch note2 : `var' 2
	quietly {
		log using codebook.txt, text append
		* HEADER if "`var'" == actualhigh 
		noisily codebook `var', tab(20)
		noisily disp _newline "`note1'"
		noisily disp _newline "`note2'"
		log close
	}	
}
*/
