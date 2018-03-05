*TEST THE EXIT CODE*
clear
set more off
import excel "C:\Users\Maria-Veronica Rojas\Documents\Temporary\Jobs and Career\Anne Preston\SESTAT Data Work\Data Files\testexitcode.xlsx", firstrow clear
sort id yrofsurvey

gen noworkstud =.
*Creating a stemdgr variable for those whose highest degree in the survey year was oncestemdgr or not; 1 means oncestemdgr degree
gen stemdgr =.
replace stemdgr = 0 if highdgrmajor < 1
replace stemdgr = 1 if stemdgr > 0
label define stemdgrlabel 0 "Non-STEM Degree" 1 "STEM Degree"
label values stemdgr stemdgrlabel 

*Sort by id and year of highest degree; sorts numbers from lowest to highest. 
gsort +id +highdgryr5
by id: egen actualhigh = max(highdgryr5)
by id: egen allstemdgr = min(stemdgr)
by id: egen oncestemdgr = max(stemdgr)    	
label define allstemdgr 0 "Had a Non-STEM Degree at Least Once" 1 "Always Had a STEM Degree" 
label define oncestemdgr 0 "Always Had a Non-STEM Degree" 1 "Had a STEM Degree at Least Once" 
label values allstemdgr allstemdgr
label values oncestemdgr oncestemdgr

*drop people who only ever had non-stemdgr degrees
gen include =1 
by id: replace include = 0 if oncestemdgr == 0
*drop earlier (non-stem) degree observations of people who once had a non-stem dgr and then switched to oncestemdgr dgr
by id: replace include = 0 if highdgryr5 != actualhigh & stemdgr == 0 & (_n == 1 | (include[_n-1] == 0 & _n != 1))
drop if include == 0
*Since we've dropped people who started off with non-stem degrees and then switched to STEM, we need to update this variable
drop allstemdgr
by id: egen allstemdgr = min(stemdgr)
*Create dgrexit dummy, 1 indicates that they got a higher degree in non-STEM.
by id: gen dgrexit = 1 if highdgrmajor < 1 & _n!=1
replace dgrexit = 0 if dgrexit != 1
*mark the exit year of those who had a stemdgr degree and then switched to non-stemdgr higher degree
by id: gen stemexityear = highdgryr5 if dgrexit == 1

*Need to note whether someone's degree changed from their previous obsevation
by id: gen dgrchange = 1 if highdgryr5 != highdgryr5[_n-1] & _n != 1
replace dgrchange = 0 if dgrchange !=1
label define dgrchange 0 "No Degree Change From Previous Observation" 1 "Degree Change from the Previous Observation"
label values dgrchange dgrchange

*Now create the important instem variable; instem == 1 if they are working in STEM
gen instem =.
replace instem = 0 if jobcode < 1 | stemdgr < 1
*Note that having a oncestemdgr job overrides having switched to a non-STEM degree; someone could be assigned 0 in the line above for a nonstem-stem degree change but retain a oncestemdgr job - not an exiter
replace instem = 1 if jobcode > 0 
label define instemlabel 1 "Working in STEM" 0 "Not Working in STEM"
label values instem instemlabel

*Priority categorization: if you have a oncestemdgr job or not. This should trump whether you got a higher degree in non-stem
by id: egen allstemjob = min(instem)
by id: egen oncestemjob = max(instem)  
label variable allstemjob "Always Had a STEM Job"
label variable oncestemjob "Had a STEM Job at Least Once"
label define allstemjob 0 "Had a Non-STEM Job at Least Once" 1 "Always Had a STEM Job" 
label define oncestemjob 0 "Always Had a Non-STEM Job" 1 "Had a STEM Job at Least Once" 
label values allstemjob nonstemjob
label values oncestemjob stemjob

*by id: replace include = 0 if oncestemjob == 0 //drop people who only ever had non-stem jobs
*if you always had a oncestemdgr job, you should not count as an exit, even if you switched to a higher degree in non-stem. 
* E.g., computer science degrees and job and then a management degree and still maintains compsci job. See id: 100026389 for example
by id: replace stemexityear =. if allstemjob == 1 

* A more detailed summary of people's exits
gen stemworkstat =.
replace stemworkstat = 0 if instem == 1
replace stemworkstat = 1 if jobcode < 1 
replace stemworkstat = 2 if stemexityear !=. & noworkstud == 1 //currently, the stemexityear variable only records a year if there was an oncestemdgr exit by degree
replace stemworkstat = 3 if jobcode == 8 & (noworkstud != 1)
label define stemworkstatlabel 0 "Working in STEM" 1 "Not Working in STEM" 2 "Not Working But in School" 3 "Not Working"
label values stemworkstat stemworkstatlabel

by id: replace stemexityear = yrofsurvey if instem == 0
replace stemexityear = -1 if stemexityear ==. 
label define stemexityearlabel -1 "No STEM Exit"
label values stemexityear stemexityearlabel

label var actualhigh "An individual's actual highest degree, which may have been completed in a later study"
label var dgrchange "A Higher Degree Has Been Obtained Since Last Observation"
label var instem "Within STEM through Job or Degree"
label var allstemdgr "Always Had a STEM Degree"
label var stemdgr "Highest Degree in STEM Dummy"
label var stemexityear "Year of Exit From STEM"
label var stemworkstat "Indicates Details of STEM Employment/Non-Employment Status"

sort id yrofsurvey
