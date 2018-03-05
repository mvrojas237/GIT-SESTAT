
************************************
* FOR 1993 - 2001 
if (yrofsurvey == 1993 | yrofsurvey == 1995 | yrofsurvey == 1997 | yrofsurvey == 1999 | yrofsurvey == 2001) {
	*FOR 1993-1999 - inital variable list
	if (yrofsurvey == 1993 | yrofsurvey == 1995 | yrofsurvey == 1997 | yrofsurvey == 1999) {
		
			rename biryrp birthyr
			label var birthyr "Birth Date: Year"
			
			label var weight "SESTAT Weight"
			
			rename actcap compact 
			label var compact "Activity, Computer Applications"

			rename actrdt multipleact
			label var multipleact "Primary/secondary work activity on principal job: basic research/applied research/development/design/teaching"

			rename actded developact
			label var developact "Activity, Development and Design" 

			rename actmgt manageact 
			label var manageact "Activity, Management/sales"

			rename actres researchact
			label var researchact "Activity, Research (Basic and/or Applied)"

			rename acttch teachact 
			label var teachact "Activity, Teaching"
	
			gen birthplace = 1 if bthus == "Y"
			replace birthplace = 0 if bthus == "N"
			replace birthplace = 2 if bthus == "M"
			label var birthplace "Place of Birth"
			drop bthus
			
			label define birthplacelabel 0 "Born in the US" 1 "Not born in the US" 2 "Missing"
			label values birthplace birthplacelabel 

			rename dgrdg highdgrtype 
			label var highdgrtype "Type of Certificate or Degree, Highest Degree"

			rename ctzusin uscitizen
			label var uscitizen "U.S. Citizenship Status"

			label var gender "Gender" 

			rename lfstat emplstat
			label var emplstat "Employment Status"

			label var minrty "Minority Indicator"

			rename mrdg recentdgrtype
			label var recentdgrtype "Type of Degree, Most Recent Degree"

			rename nrchg reasoncareer
			label var reasoncareer "Reasons for Work Outside of Field: Career Change"

			rename nrcon reasoncondition 
			label var reasoncondition "Reasons for Work Outside of Field: Workding Conditions"

			rename nrfam reasonfam
			label var reasonfam "Reasons for Work Outside of Field: Family"

			rename nrloc reasonloc
			label var reasonloc "Reasons for Work Outside of Field: Location"

			rename nrocna reasonnojob
			label var reasonnojob "Reasons for Work Outside of Field: No Suitable Job"

			rename nrot reasonother
			label var reasonother "Reasons for Work Outside of Field: Other"

			rename nrpay reasonpay
			label var reasonpay "Reasons for Work Outside of Field: Pay/Promotion"

			rename nrrea num1reason
			label var num1reason "Most important Reasons for Work Outside of Field" 

			rename nwfam noworkfam 
			label var noworkfam "Reasons for Not Working: Family"

			rename nwlay noworklay
			label var noworklay "Reasons for Not Working: Layoff" 

			rename nwnond noworknoneed 
			label var noworknoneed "Reasons for Not Working: Not Need/Want work"

			rename nwocna noworknojob
			label var noworknojob "Reasons for Not Working: No Suitiable Job Available"

			rename nwstu noworkstud 
			label var noworkstud "Reasons for Not Working: Student"
			
			rename refid id 
			label var id "Reference/ID Number"
			 
			
			rename nwot noworkother
			label var noworkother "Reasons for Not Working: other"

			rename salarp salary
			label var salary "Salary (Annualized for Public Use)"

			rename wrkg working
			label var working "Working for Pay During Reference Week"

			rename ocprmg jobcode
			label var jobcode "Job Code for Principal Job (Recorded for Public Use)"
			
			gen age = (yrofsurvey - birthyr)
			
		
		keep compact developact manageact multipleact researchact teachact birthplace age highdgrtype uscitizen gender hday5 emplstat  ///
		minrty mr5yr recentdgrtype jobcode dgrmedp reasoncareer reasoncondition reasonfam reasonloc reasonnojob reasonother reasonpay num1reason  noworkfam noworklay ///
		noworknoneed noworkother noworknojob noworkstud racethp id  salary working weight yrofsurvey 
		
		
	}
	
	*FOR 2001 - initial variable list
	if yrofsurvey == 2001 {
		
		
		
		rename actcap compact 
		label var compact "Activity, Computer Applications"

		rename actrdt multipleact
		label var multipleact "Primary/secondary work activity on principal job: basic research/applied research/development/design/teaching"

		rename actded developact
		label var developact "Activity, Development and Design" 

		rename actmgt manageact 
		label var manageact "Activity, Management/sales"

		rename actres researchact
		label var researchact "Activity, Research (Basic and/or Applied)"

		rename acttch teachact 
		label var teachact "Activity, Teaching"
		
		gen birthplace = 1 if bthus == "Y"
		replace birthplace = 0 if bthus == "N"
		replace birthplace = 2 if bthus == "M"
		label var birthplace "Place of Birth"
		
		label define birthplacelabel 0 "Born in the US" 1 "Not born in the US" 2 "Missing"
		label values birthplace birthplacelabel 
		
		rename dgrdg highdgrtype 
		label var highdgrtype "Type of Certificate or Degree, Highest Degree"

		rename ctzusin uscitizen
		label var uscitizen "U.S. Citizenship Status"

		label var gender "Gender" 

		rename lfstat emplstat
		label var emplstat "Employment Status"

		label var minrty "Minority Indicator"

		rename mrdg recentdgrtype
		label var recentdgrtype "Type of Degree, Most Recent Degree"

		rename nrchg reasoncareer
		label var reasoncareer "Reasons for Work Outside of Field: Career Change"

		rename nrcon reasoncondition 
		label var reasoncondition "Reasons for Work Outside of Field: Workding Conditions"

		rename nrfam reasonfam
		label var reasonfam "Reasons for Work Outside of Field: Family"

		rename nrloc reasonloc
		label var reasonloc "Reasons for Work Outside of Field: Location"

		rename nrocna reasonnojob
		label var reasonnojob "Reasons for Work Outside of Field: No Suitable Job"

		rename nrot reasonother
		label var reasonother "Reasons for Work Outside of Field: Other"

		rename nrpay reasonpay
		label var reasonpay "Reasons for Work Outside of Field: Pay/Promotion"

		rename nrrea num1reason
		label var num1reason "Most important Reasons for Work Outside of Field" 

		rename nwfam noworkfam 
		label var noworkfam "Reasons for Not Working: Family"

		rename nwlay noworklay
		label var noworklay "Reasons for Not Working: Layoff" 

		rename nwnond noworknoneed 
		label var noworknoneed "Reasons for Not Working: Not Need/Want work"

		rename nwocna noworknojob
		label var noworknojob "Reasons for Not Working: No Suitiable Job Available"

		rename nwot noworkother
		label var noworkother "Reasons for Not Working: other"
		
		rename nwstu noworkstud 
		label var noworkstud "Reasons for Not Working: Student"
		
		rename refid id 
		label var id "Reference/ID Number"
		 

		rename salarp salary
		label var salary "Salary (Annualized for Public Use)"

		rename wrkg working
		label var working "Working for Pay During Reference Week"

		rename ocprmg jobcode
		label var jobcode "Job Code for Principal Job (Recorded for Public Use)"
		
		
		
		keep compact developact manageact multipleact researchact teachact agep birthplace highdgrtype uscitizen gender hday5 emplstat  ///
		minrty mr5yr recentdgrtype jobcode dgrmedp reasoncareer reasoncondition reasonfam reasonloc reasonnojob reasonother reasonpay num1reason  noworkfam noworklay ///
		noworknoneed noworkother noworknojob noworkstud racethp id salary working wtsurvy yrofsurvey
		
		rename wtsurvy weight 
		label var weight "SESTAT Weight (2001)"
		
		rename agep age 
		label var age "Age"
		
		}
	

	*Rename and label variables to make them easier to read
	*******************************************************************
	*Common changes
	rename hday5 highdgryr5
	label var highdgryr5 "Year of Highest Degree (5-year intevals)"
		
	rename racethp race
	label var race "Race/Ethnicity"
	
	rename mr5yr recentdgryr5
	label var recentdgryr5 "Year of Most Recent Degree (5-year intervals)"
	
	rename dgrmedp highdgrmajor
	label var highdgrmajor "Field of Major for Highest Degree"
	
	*******************************************************************
	*Recoding degree types
	replace highdgrmajor = "1" if highdgrmajor == "19889S" 
	replace highdgrmajor = "2" if highdgrmajor == "22639S" 
	replace highdgrmajor = "3" if highdgrmajor == "29889S" 
	replace highdgrmajor = "4" if highdgrmajor == "318730"
	replace highdgrmajor = "5" if highdgrmajor == "33878S"
	replace highdgrmajor = "6" if highdgrmajor == "39889S"
	replace highdgrmajor = "7" if highdgrmajor == "41929S"
	replace highdgrmajor = "9" if highdgrmajor == "43899S"
	replace highdgrmajor = "10" if highdgrmajor == "44999S"
	replace highdgrmajor = "11" if highdgrmajor == "45939S"
	replace highdgrmajor = "12" if highdgrmajor == "527250"
	replace highdgrmajor = "13" if highdgrmajor == "537260"
	replace highdgrmajor = "14" if highdgrmajor == "547280"
	replace highdgrmajor = "15" if highdgrmajor == "567350"
	replace highdgrmajor = "16" if highdgrmajor == "58799S"
	replace highdgrmajor = "18" if highdgrmajor == "61999S" | highdgrmajor == "61999S"
	replace highdgrmajor = "19" if highdgrmajor == "69999S" 
	replace highdgrmajor = "0" if highdgrmajor == "999999"
	
	destring highdgrmajor, replace
	
	label define highdgrmajorlabel 0 "Missing" 1 "Computer and Mathematical Science" 2 "Biological Sciences" 3 "Other Life & Related Sciences" 4 "Chemistry, except Biochemistry" ///
	5 "Physics and Astronomy" 6 "Other Physical & Related Sciences" 7 "Economics" 8 "Political and Related Sciences" 9 "Psychology" 10 "Sociology & Anthropology" ///
	11 "Other Social Sciences" 12 "Chemical Engineering" 13 "Civil Engineering" 14 "Electrical, Electronics and Communications engineering" 15 "Mechanical Engineering" ///
	16 "Other Engineering" 17 "Health-related Fields" 18 "Management & Administration" 19 "Other Non-Science & Engineering" 20 "Other Science & Engineering-related"
	
	label values highdgrmajor highdgrmajorlabel
	
	replace jobcode = "Computer and mathematical scientists" if jobcode == "1"
	replace jobcode = "Biological, agricultural and other life scientists" if jobcode == "2"
	replace jobcode = "Physical and related scientists" if jobcode == "3"
	replace jobcode = "Social and related scientists" if jobcode == "4"
	replace jobcode = "Engineers" if jobcode == "5"
	*replace jobcode = "S and E related occupations" if jobcode == "6" * only post 2001
	replace jobcode = "Non-S and E Occupations" if jobcode == "6"  /* becomes 7 post 2001 */
	replace jobcode = "Logical Skip" if jobcode == "8"


}

**************
* FOR 2003 

if (yrofsurvey == 2003 | yrofsurvey == 2006 | yrofsurvey == 2008) {
	
	{		
		label var weight "SESTAT Weight"
		
		rename actcap compact 
		label var compact "Activity, Computer Applications"

		rename actrdt multipleact
		label var multipleact "Primary/secondary work activity on principal job: basic research/applied research/development/design/teaching"

		rename actded developact
		label var developact "Activity, Development and Design" 

		rename actmgt manageact 
		label var manageact "Activity, Management/sales"

		rename actres researchact
		label var researchact "Activity, Research (Basic and/or Applied)"

		rename acttch teachact 
		label var teachact "Activity, Teaching"

		gen birthplace = 1 if bthus == "Y"
		replace birthplace = 0 if bthus == "N"
		replace birthplace = 2 if bthus == "M"
		label var birthplace "Place of Birth"
		drop bthus
		
		label define birthplacelabel 0 "Born in the US" 1 "Not born in the US" 2 "Missing"
		label values birthplace birthplacelabel 
		
		rename dgrdg highdgrtype 
		label var highdgrtype "Type of Certificate or Degree, Highest Degree"

		rename ndgmedp highdgrmajor
		label var highdgrmajor "Field of Major for Highest Degree"
	
		
		rename ctzusin uscitizen
		label var uscitizen "U.S. Citizenship Status"

		label var gender "Gender" 

		rename lfstat emplstat
		label var emplstat "Employment Status"

		label var minrty "Minority Indicator"

		rename mrdg recentdgrtype
		label var recentdgrtype "Type of Degree, Most Recent Degree"

		rename nrchg reasoncareer
		label var reasoncareer "Reasons for Work Outside of Field: Career Change"

		rename nrcon reasoncondition 
		label var reasoncondition "Reasons for Work Outside of Field: Workding Conditions"

		rename nrfam reasonfam
		label var reasonfam "Reasons for Work Outside of Field: Family"

		rename nrloc reasonloc
		label var reasonloc "Reasons for Work Outside of Field: Location"

		rename nrocna reasonnojob
		label var reasonnojob "Reasons for Work Outside of Field: No Suitable Job"

		rename nrot reasonother
		label var reasonother "Reasons for Work Outside of Field: Other"

		rename nrpay reasonpay
		label var reasonpay "Reasons for Work Outside of Field: Pay/Promotion"

		rename nrrea num1reason
		label var num1reason "Most important Reasons for Work Outside of Field" 

		rename nwfam noworkfam 
		label var noworkfam "Reasons for Not Working: Family"

		rename nwlay noworklay
		label var noworklay "Reasons for Not Working: Layoff" 

		rename nwnond noworknoneed 
		label var noworknoneed "Reasons for Not Working: Not Need/Want work"

		rename nwocna noworknojob
		label var noworknojob "Reasons for Not Working: No Suitiable Job Available"

		rename nwotp noworkother
		label var noworkother "Reasons for Not Working: other"
		
		rename nwstu noworkstud 
		label var noworkstud "Reasons for Not Working: Student"

		rename refid id 
		label var id "Reference/ID Number"
		 
		
		rename salarp salary
		label var salary "Salary (Annualized for Public Use)"

		rename wrkg working
		label var working "Working for Pay During Reference Week"
	}

	keep compact developact manageact multipleact researchact teachact agep birthplace highdgrtype uscitizen gender hd03y5p emplstat  ///
	minrty mr03y5p recentdgrtype nocprmg highdgrtype reasoncareer reasoncondition reasonfam highdgrmajor ///
	reasonloc reasonnojob reasonother reasonpay num1reason noworkfam noworklay noworknoneed noworknojob noworkother noworkstud racethmp id salary /// 
	working weight yrofsurvey

	*Rename and label variables to make them easier to read
	****************************************************************************
	rename agep age 
	label var age "Age"
	
	rename hd03y5p highdgryr5
	label var highdgryr5 "Year of Highest Degree (5-year intervals)"
	
	rename mr03y5p recentdgryr5
	label var recentdgryr5 "Year of Most Recent Degree (5-year intervals)"

	rename nocprmg jobcode
	label var jobcode "Job Code for Principal Job (Recorded for Public Use)"
	
	rename racethmp race
	label var race "Race/Ethnicity"
	
	*Labeling jobcodes
	replace jobcode = "Computer and mathematical scientists" if jobcode == "1"
	replace jobcode = "Biological, agricultural and other life scientists" if jobcode == "2"
	replace jobcode = "Physical and related scientists" if jobcode == "3"
	replace jobcode = "Social and related scientists" if jobcode == "4"
	replace jobcode = "Engineers" if jobcode == "5"
	replace jobcode = "S and E related occupations" if jobcode == "6"
	replace jobcode = "Non-S and E Occupations" if jobcode == "7"
	replace jobcode = "Logical Skip" if jobcode == "8"
	
	replace highdgrmajor = "1" if highdgrmajor == "19889S"
	replace highdgrmajor = "2" if highdgrmajor == "22639S"
	replace highdgrmajor = "3" if highdgrmajor == "39889S" | highdgrmajor == "29889S"
	replace highdgrmajor = "4" if highdgrmajor == "318730"
	replace highdgrmajor = "5" if highdgrmajor == "33878S"
	replace highdgrmajor = "6" if highdgrmajor == "39899S"
	replace highdgrmajor = "7" if highdgrmajor == "41929S"
	replace highdgrmajor = "8" if highdgrmajor == "42929S"
	replace highdgrmajor = "9" if highdgrmajor == "43899S"
	replace highdgrmajor = "10" if highdgrmajor == "44999S"
	replace highdgrmajor = "11" if highdgrmajor == "45939S"
	replace highdgrmajor = "12" if highdgrmajor == "527250"
	replace highdgrmajor = "13" if highdgrmajor == "537260"
	replace highdgrmajor = "14" if highdgrmajor == "547280"
	replace highdgrmajor = "15" if highdgrmajor == "567350"
	replace highdgrmajor = "16" if highdgrmajor == "58799S"
	replace highdgrmajor = "17" if highdgrmajor == "61199S"
	replace highdgrmajor = "18" if highdgrmajor == "61999S" | highdgrmajor == "61999S" | highdgrmajor == "71999S"
	replace highdgrmajor = "19" if highdgrmajor == "79999S" 
	replace highdgrmajor = "20" if highdgrmajor == "69999S" 	
	
	destring highdgrmajor, replace
	
	label define highdgrmajorlabel 0 "Missing" 1 "Computer and Mathematical Science" 2 "Biological Sciences" 3 "Other Life & Related Sciences" 4 "Chemistry, except Biochemistry" ///
	5 "Physics and Astronomy" 6 "Other Physical & Related Sciences" 7 "Economics" 8 "Political and Related Sciences" 9 "Psychology" 10 "Sociology & Anthropology" ///
	11 "Other Social Sciences" 12 "Chemical Engineering" 13 "Civil Engineering" 14 "Electrical, Electronics and Communications engineering" 15 "Mechanical Engineering" ///
	16 "Other Engineering" 17 "Health-related Fields" 18 "Management & Administration" 19 "Other Non-Science & Engineering" 20 "Other Science & Engineering-related"
	
	label values highdgrmajor highdgrmajorlabel

}
	*******************************************************************

if yrofsurvey == 2010 | yrofsurvey == 2013 {
	
		keep actcap actded actmgt actrdt actres acttch agep bthus dgrdg ctzusin gender hd03y5p ///
		lfstat minrty mr03y5p mrdg n2ocprmg ndgmedp ///
	    nrchg nrcon nrfam nrloc nrocna nrot nrpay nrrea nwfam nwlay nwnond nwocna nwotp ///
		nwstu racethmp refid  salarp wrkg weight yrofsurvey
		
		label var weight "SESTAT Weight"
		
		rename actcap compact 
		label var compact "Activity, Computer Applications"

		rename actrdt multipleact
		label var multipleact "Primary/secondary work activity on principal job: basic research/applied research/development/design/teaching"

		rename actded developact
		label var developact "Activity, Development and Design" 

		rename actmgt manageact 
		label var manageact "Activity, Management/sales"

		rename actres researchact
		label var researchact "Activity, Research (Basic and/or Applied)"

		rename acttch teachact 
		label var teachact "Activity, Teaching"
		
		gen birthplace = 1 if bthus == "Y"
		replace birthplace = 0 if bthus == "N"
		replace birthplace = 2 if bthus == "M"
		label var birthplace "Place of Birth"
		drop bthus
		
		label define birthplacelabel 0 "Born in the US" 1 "Not born in the US" 2 "Missing"
		label values birthplace birthplacelabel 
		

		rename dgrdg highdgrtype 
		label var highdgrtype "Type of Certificate or Degree, Highest Degree"

		rename ctzusin uscitizen
		label var uscitizen "U.S. Citizenship Status"

		label var gender "Gender" 

		rename lfstat emplstat
		label var emplstat "Employment Status"

		label var minrty "Minority Indicator"

		rename mrdg recentdgrtype
		label var recentdgrtype "Type of Degree, Most Recent Degree"

		rename nrchg reasoncareer
		label var reasoncareer "Reasons for Work Outside of Field: Career Change"

		rename nrcon reasoncondition 
		label var reasoncondition "Reasons for Work Outside of Field: Workding Conditions"

		rename nrfam reasonfam
		label var reasonfam "Reasons for Work Outside of Field: Family"

		rename nrloc reasonloc
		label var reasonloc "Reasons for Work Outside of Field: Location"

		rename nrocna reasonnojob
		label var reasonnojob "Reasons for Work Outside of Field: No Suitable Job"

		rename nrot reasonother
		label var reasonother "Reasons for Work Outside of Field: Other"

		rename nrpay reasonpay
		label var reasonpay "Reasons for Work Outside of Field: Pay/Promotion"

		rename nrrea num1reason
		label var num1reason "Most important Reasons for Work Outside of Field" 

		rename nwfam noworkfam 
		label var noworkfam "Reasons for Not Working: Family"

		rename nwlay noworklay
		label var noworklay "Reasons for Not Working: Layoff" 

		rename nwnond noworknoneed 
		label var noworknoneed "Reasons for Not Working: Not Need/Want work"

		rename nwocna noworknojob
		label var noworknojob "Reasons for Not Working: No Suitiable Job Available"

		rename nwstu noworkstud 
		label var noworkstud "Reasons for Not Working: Student"

		rename nwotp noworkother
		label var noworkother "Reasons for Not Working: other"
		
		rename refid id 
		label var id "Reference/ID Number" 
		
		rename salarp salary
		label var salary "Salary (Annualized for Public Use)"

		rename wrkg working
		label var working "Working for Pay During Reference Week"
		
	*Rename and label variables to make them easier to read
	****************************************************************************
	rename agep age 
	label var age "Age"
	
	rename ndgmedp highdgrmajor
	label var highdgrmajor "Field of Major for Highest Degree"

	rename hd03y5p highdgryr5
	label var highdgryr5 "Year of Highest Degree (5-year intervals)"
	
	rename mr03y5p recentdgryr5
	label var recentdgryr5 "Year of Most Recent Degree (5-year intervals)"

	rename n2ocprmg jobcode
	label var jobcode "Job Code for Principal Job (Recorded for Public Use)"

	rename racethmp race
	label var race "Race/Ethnicity"
	
	*Labeling jobcodes
	replace jobcode = "Computer and mathematical scientists" if jobcode == "1"
	replace jobcode = "Biological, agricultural and other life scientists" if jobcode == "2"
	replace jobcode = "Physical and related scientists" if jobcode == "3"
	replace jobcode = "Social and related scientists" if jobcode == "4"
	replace jobcode = "Engineers" if jobcode == "5"
	replace jobcode = "S and E related occupations" if jobcode == "6"
	replace jobcode = "Non-S and E Occupations" if jobcode == "7"
	replace jobcode = "Logical Skip" if jobcode == "8"
	
	
	replace highdgrmajor = "1" if highdgrmajor == "19889S"
	replace highdgrmajor = "2" if highdgrmajor == "22639S"
	replace highdgrmajor = "3" if highdgrmajor == "29889S"
	replace highdgrmajor = "4" if highdgrmajor == "318730"
	replace highdgrmajor = "5" if highdgrmajor == "33878S"
	replace highdgrmajor = "6" if highdgrmajor == "39899S"
	replace highdgrmajor = "7" if highdgrmajor == "41929S"
	replace highdgrmajor = "8" if highdgrmajor == "42929S"
	replace highdgrmajor = "9" if highdgrmajor == "43899S"
	replace highdgrmajor = "10" if highdgrmajor == "44999S"
	replace highdgrmajor = "11" if highdgrmajor == "45939S"
	replace highdgrmajor = "12" if highdgrmajor == "527250"
	replace highdgrmajor = "13" if highdgrmajor == "537260"
	replace highdgrmajor = "14" if highdgrmajor == "547280"
	replace highdgrmajor = "15" if highdgrmajor == "567350"
	replace highdgrmajor = "16" if highdgrmajor == "58799S"
	replace highdgrmajor = "17" if highdgrmajor == "61199S"
	replace highdgrmajor = "18" if highdgrmajor == "61999S" | highdgrmajor == "61999S" | highdgrmajor == "71999S"
	replace highdgrmajor = "19" if highdgrmajor == "79999S" 
	replace highdgrmajor = "20" if highdgrmajor == "69999S" 	

	destring highdgrmajor, replace
	
	label define highdgrmajorlabel 0 "Missing" 1 "Computer and Mathematical Science" 2 "Biological Sciences" 3 "Other Life & Related Sciences" 4 "Chemistry, except Biochemistry" ///
	5 "Physics and Astronomy" 6 "Other Physical & Related Sciences" 7 "Economics" 8 "Political and Related Sciences" 9 "Psychology" 10 "Sociology & Anthropology" ///
	11 "Other Social Sciences" 12 "Chemical Engineering" 13 "Civil Engineering" 14 "Electrical, Electronics and Communications engineering" 15 "Mechanical Engineering" ///
	16 "Other Engineering" 17 "Health-related Fields" 18 "Management & Administration" 19 "Other Non-Science & Engineering" 20 "Other Science & Engineering-related"
	
	label values highdgrmajor highdgrmajorlabel
	
}

*Creating value labels

destring highdgrtype, replace
label define highdgrtypelabel 1 "Bachelor's" 2 "Master's" 3 "Doctorate" 4 "Professional"
label values highdgrtype highdgrtypelabel

destring race, replace
gen racetemp =.
replace racetemp = 1 if race == 2 | race == 5
replace racetemp = 2 if race == 1 | race == 4
replace racetemp = 3 if race == 7
replace racetemp = 4 if race == 6

replace race = racetemp
drop racetemp

* label define racelabel 1 "Asian" 2 "White" 4 "Asian" 5 "White" 6 "Other" 7 "Under-represented minorities" 

label define racelabel 1 "White" 2 "Asian" 3 "Under-represented minorities" 4 "Other"
label values race racelabel

destring emplstat, replace
label define emplstatlabel 1 "Employed" 2 "Unemployed" 3 "Not in Labor Force"
label values emplstat emplstatlabel

gen tempreason =.
replace tempreason = 1 if noworkfam == "N"
replace tempreason = 2 if noworkfam == "Y"
replace tempreason = 3 if noworkfam == "L"

drop noworkfam
rename tempreason noworkfam

label define noworkfamlabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values noworkfam noworkfamlabel

gen tempreason =.
replace tempreason = 1 if noworklay == "N"
replace tempreason = 2 if noworklay == "Y"
replace tempreason = 3 if noworklay == "L"

drop noworklay
rename tempreason noworklay

label define noworklaylabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values noworklay noworklaylabel

gen tempreason =.
replace tempreason = 1 if noworknojob == "N"
replace tempreason = 2 if noworknojob == "Y"
replace tempreason = 3 if noworknojob == "L"

drop noworknojob
rename tempreason noworknojob

label define noworknojoblabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values noworknojob noworknojoblabel 

gen tempreason =.
replace tempreason = 1 if noworkother == "N"
replace tempreason = 2 if noworkother == "Y"
replace tempreason = 3 if noworkother == "L"

drop noworkother
rename tempreason noworkother

label define noworkotherlabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values noworkother noworkotherlabel 

gen tempreason =.
replace tempreason = 1 if reasonfam == "N"
replace tempreason = 2 if reasonfam == "Y"
replace tempreason = 3 if reasonfam == "L"

drop reasonfam
rename tempreason reasonfam

label define reasonfamlabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values reasonfam reasonfamlabel 

gen tempreason =.
replace tempreason = 1 if num1reason == "1"
replace tempreason = 2 if num1reason == "2"
replace tempreason = 3 if num1reason == "3"
replace tempreason = 4 if num1reason == "4"
replace tempreason = 5 if num1reason == "5"
replace tempreason = 6 if num1reason == "6"
replace tempreason = 7 if num1reason == "7"
replace tempreason = 8 if num1reason == "L"

drop num1reason
rename tempreason num1reason

label define num1reasonlabel 1 "Pay, promotion opportunities " 2 "Working conditions [hours, equip.]" 3 "Job location" 4 "Change in career or professional " 5 "Family-related reasons" 6 "Job in doctoral degree field not" 7 "Job location" 8 "Other reason for not working" 
label values num1reason num1reasonlabel 

gen tempreason =.
replace tempreason = 1 if noworknoneed == "N"
replace tempreason = 2 if noworknoneed == "Y"
replace tempreason = 3 if noworknoneed == "L"

drop noworknoneed
rename tempreason noworknoneed

label define noworknoneedlabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values noworknoneed noworknoneedlabel


gen tempreason =.
replace tempreason = 1 if noworkstud == "N"
replace tempreason = 2 if noworkstud == "Y"
replace tempreason = 3 if noworkstud == "L"

drop noworkstud
rename tempreason noworkstud

label define noworkstudlabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values noworkstud noworkstudlabel


gen tempreason =.
replace tempreason = 1 if reasoncareer == "N"
replace tempreason = 2 if reasoncareer == "Y"
replace tempreason = 3 if reasoncareer == "L"

drop reasoncareer
rename tempreason reasoncareer

label define reasoncareerlabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values reasoncareer reasoncareerlabel


gen tempreason =.
replace tempreason = 1 if reasonloc == "N"
replace tempreason = 2 if reasonloc == "Y"
replace tempreason = 3 if reasonloc == "L"

drop reasonloc
rename tempreason reasonloc

label define reasonloclabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values reasonloc reasonloclabel


gen tempreason =.
replace tempreason = 1 if reasonnojob == "N"
replace tempreason = 2 if reasonnojob == "Y"
replace tempreason = 3 if reasonnojob == "L"

drop reasonnojob
rename tempreason reasonnojob

label define reasonnojoblabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values reasonnojob reasonnojoblabel


gen tempreason =.
replace tempreason = 1 if reasonother == "N"
replace tempreason = 2 if reasonother == "Y"
replace tempreason = 3 if reasonother == "L"

drop reasonother
rename tempreason reasonother

label define reasonotherlabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values reasonother reasonotherlabel

gen tempreason =.
replace tempreason = 1 if reasonpay == "N"
replace tempreason = 2 if reasonpay == "Y"
replace tempreason = 3 if reasonpay == "L"

drop reasonpay
rename tempreason reasonpay

label define reasonpaylabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values reasonpay reasonpaylabel

destring recentdgrtype, replace
label define recentdgrtypelabel 1 "Bachelor's" 2 "Master's" 3 "Doctorate" 4 "Professional" 5 "Other"
label values recentdgrtype recentdgrtypelabel

gen tempreason =.
replace tempreason = 1 if reasoncondition == "N"
replace tempreason = 2 if reasoncondition == "Y"
replace tempreason = 3 if reasoncondition == "L"

drop reasoncondition
rename tempreason reasoncondition

label define reasonconditionlabel 1 "No" 2 "Yes" 3 "Logical Skip"
label values reasoncondition reasonconditionlabel

gen sciencegroup =.

replace sciencegroup = 1 if highdgrmajor == 2 | highdgrmajor == 4 | highdgrmajor == 3
replace sciencegroup = 2 if highdgrmajor == 12 | highdgrmajor == 14 | highdgrmajor == 13 | highdgrmajor == 15 | highdgrmajor == 16
replace sciencegroup = 3 if highdgrmajor == 1
replace sciencegroup = 4 if highdgrmajor == 5 | highdgrmajor == 6
replace sciencegroup = 5 if highdgrmajor == 17
replace sciencegroup = 6 if highdgrmajor == 20
replace sciencegroup = 7 if highdgrmajor == 7 | highdgrmajor == 8 | highdgrmajor == 9 | highdgrmajor == 10 | highdgrmajor == 11

label define sciencegrouplabel 1 "Life Sciences" 2 "Engineering" 3 "Computer and Math Sciences" 4 "Physical Sciences" 5 "Health Related Fields" 6 "Other Science and Engineering" 7 "Social Sciences"
label values sciencegroup sciencegrouplabel


********** Labeling and converting all variables into numbers *******************
label variable yrofsur "Year Survey Conducted"
label variable sciencegroup "5 Group STEM Classification"
label variable reasonpay "Reasons for Work Outside of Field: Pay/Promotion"
label variable reasonother "Reasons for Work Outside of Field: Other"
label variable reasonnojob "Reasons for Work Outside of Field: No Jobs Available"
label variable reasonloc "Reasons for Work Outside of Field: Location"
label variable reasonfam "Reasons for Work Outside of Field: Family"
label variable reasoncondition "Reasons for Work Outside of Field: Working Conditions"
label variable reasoncareer "Reasons for Work Outside of Field: Career Interest Change"
label variable num1reason "Most Important Reason for Working Outside of Field"
label variable noworkstud "Reasons for Not Working: Student"
label variable noworkother "Reasons for Not Working: Other"
label variable noworknoneed "Reasons for Not Working: No Need"
label variable noworknojob "Reasons for Not Working: No Jobs Available"
label variable noworklay "Reasons for Not Working: Layoff"
label variable noworkfam "Reasons for Not Working: Family"
label variable age "Age"

replace working = "1" if working == "Y"
replace working = "0" if working == "N"
destring working, replace

gen female = 0
replace female = 1 if gender == "F"
drop gender
label variable female "Female dummy variable"

replace minrty = "1" if minrty == "Y"
replace minrty = "0" if minrty == "N"
destring minrty, replace

replace uscitizen = "1" if uscitizen == "Y"
replace uscitizen = "0" if uscitizen == "N"
destring uscitizen, replace

replace compact = "1" if compact == "Y"
replace compact = "0" if compact == "N"
replace compact = "-1" if compact == "L"
destring compact, replace

label define compactlabels -1 "Logical Skip" 0 "No" 1 "Yes" 
label values compact compactlabels

replace developact = "1" if developact == "Y"
replace developact = "0" if developact == "N"
replace developact = "-1" if developact == "L"
destring developact, replace

label define developactlabels -1 "Logical Skip" 0 "No" 1 "Yes" 
label values developact developactlabels

replace manageact = "1" if manageact == "Y"
replace manageact = "0" if manageact == "N"
replace manageact = "-1" if manageact == "L"
destring manageact, replace

label define manageactlabels -1 "Logical Skip" 0 "No" 1 "Yes" 
label values manageact manageactlabels

replace researchact = "1" if researchact == "Y"
replace researchact = "0" if researchact == "N"
replace researchact = "-1" if researchact == "L"
destring researchact, replace

label define researchactlabels -1 "Logical Skip" 0 "No" 1 "Yes" 
label values researchact researchactlabels

replace teachact = "1" if teachact == "Y"
replace teachact = "0" if teachact == "N"
replace teachact = "-1" if teachact == "L"
destring teachact, replace

label define teachactlabels -1 "Logical Skip" 0 "No" 1 "Yes" 
label values teachact teachactlabels


replace multipleact = "1" if multipleact == "Y"
replace multipleact = "0" if multipleact == "N"
replace multipleact = "-1" if multipleact == "L"
destring multipleact, replace

label define multipleactlabels -1 "Logical Skip" 0 "No" 1 "Yes" 
label values multipleact multipleactlabels


replace jobcode = "1" if jobcode == "Computer and mathematical scientists" 
replace jobcode = "2" if jobcode == "Biological, agricultural and other life scientists"
replace jobcode = "3" if jobcode == "Physical and related scientists"
replace jobcode = "4" if jobcode == "Social and related scientists"
replace jobcode = "5" if jobcode == "Engineers" 
replace jobcode = "6" if jobcode == "S and E related occupations"
replace jobcode = "7" if jobcode == "Non-S and E Occupations"
replace jobcode = "8" if jobcode == "Logical Skip"

destring jobcode, replace

label define jobcodelabel 1 "Computer and mathematical scientists"  2 "Biological, agricultural and other life scientists" ///
3 "Physical and related scientists" 4 "Social and related scientists" 5 "Engineers" 6 "S and E related occupations" 7 "Non-S and E Occupations" 8 "Logical Skip"
label values jobcode jobcodelabel




