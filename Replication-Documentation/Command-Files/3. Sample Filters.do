********************************************************************************
********************          3. SAMPLE FILTERS      		  ******************
********************************************************************************


clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_sample.dta"
set more off

//Generating three-year period variable
gen failurep1= failure if year==2008
replace failurep1 = failurep1[_n+3] if missing(failurep1) & year==2005
replace failurep1 = failurep1[_n+2] if missing(failurep1) & year==2006
replace failurep1 = failurep1[_n+1] if missing(failurep1) & year==2007
replace failurep1 = failurep1[_n-1] if missing(failurep1) & year==2009
replace failurep1 = failurep1[_n-2] if missing(failurep1) & year==2010
replace failurep1 = failurep1[_n-3] if missing(failurep1) & year==2011
replace failurep1 = failurep1[_n-4] if missing(failurep1) & year==2012
replace failurep1 = failurep1[_n-5] if missing(failurep1) & year==2013
replace failurep1 = failurep1[_n-6] if missing(failurep1) & year==2014
replace failurep1 = failurep1[_n-7] if missing(failurep1) & year==2015

gen consin1p1= consin1 if year==2008
replace consin1p1 = consin1p1[_n+3] if missing(consin1p1) & year==2005
replace consin1p1 = consin1p1[_n+2] if missing(consin1p1) & year==2006
replace consin1p1 = consin1p1[_n+1] if missing(consin1p1) & year==2007
replace consin1p1 = consin1p1[_n-1] if missing(consin1p1) & year==2009
replace consin1p1 = consin1p1[_n-2] if missing(consin1p1) & year==2010
replace consin1p1 = consin1p1[_n-3] if missing(consin1p1) & year==2011
replace consin1p1 = consin1p1[_n-4] if missing(consin1p1) & year==2012
replace consin1p1 = consin1p1[_n-5] if missing(consin1p1) & year==2013
replace consin1p1 = consin1p1[_n-6] if missing(consin1p1) & year==2014
replace consin1p1 = consin1p1[_n-7] if missing(consin1p1) & year==2015

gen consin2p1= consin2 if year==2008
replace consin2p1 = consin2p1[_n+3] if missing(consin2p1) & year==2005
replace consin2p1 = consin2p1[_n+2] if missing(consin2p1) & year==2006
replace consin2p1 = consin2p1[_n+1] if missing(consin2p1) & year==2007
replace consin2p1 = consin2p1[_n-1] if missing(consin2p1) & year==2009
replace consin2p1 = consin2p1[_n-2] if missing(consin2p1) & year==2010
replace consin2p1 = consin2p1[_n-3] if missing(consin2p1) & year==2011
replace consin2p1 = consin2p1[_n-4] if missing(consin2p1) & year==2012
replace consin2p1 = consin2p1[_n-5] if missing(consin2p1) & year==2013
replace consin2p1 = consin2p1[_n-6] if missing(consin2p1) & year==2014
replace consin2p1 = consin2p1[_n-7] if missing(consin2p1) & year==2015

gen failurep2= failure if year==2012
replace failurep2 = failurep2[_n+7] if missing(failurep2) & year==2005
replace failurep2 = failurep2[_n+6] if missing(failurep2) & year==2006
replace failurep2 = failurep2[_n+5] if missing(failurep2) & year==2007
replace failurep2 = failurep2[_n+4] if missing(failurep2) & year==2008
replace failurep2 = failurep2[_n+3] if missing(failurep2) & year==2009
replace failurep2 = failurep2[_n+2] if missing(failurep2) & year==2010
replace failurep2 = failurep2[_n+1] if missing(failurep2) & year==2011
replace failurep2 = failurep2[_n-1] if missing(failurep2) & year==2013
replace failurep2 = failurep2[_n-2] if missing(failurep2) & year==2014
replace failurep2 = failurep2[_n-3] if missing(failurep2) & year==2015

gen consin1p2= failure if year==2012
replace consin1p2 = consin1p2[_n+7] if missing(consin1p2) & year==2005
replace consin1p2 = consin1p2[_n+6] if missing(consin1p2) & year==2006
replace consin1p2 = consin1p2[_n+5] if missing(consin1p2) & year==2007
replace consin1p2 = consin1p2[_n+4] if missing(consin1p2) & year==2008
replace consin1p2 = consin1p2[_n+3] if missing(consin1p2) & year==2009
replace consin1p2 = consin1p2[_n+2] if missing(consin1p2) & year==2010
replace consin1p2 = consin1p2[_n+1] if missing(consin1p2) & year==2011
replace consin1p2 = consin1p2[_n-1] if missing(consin1p2) & year==2013
replace consin1p2 = consin1p2[_n-2] if missing(consin1p2) & year==2014
replace consin1p2 = consin1p2[_n-3] if missing(consin1p2) & year==2015

gen consin2p2= failure if year==2012
replace consin2p2 = consin2p2[_n+7] if missing(consin2p2) & year==2005
replace consin2p2 = consin2p2[_n+6] if missing(consin2p2) & year==2006
replace consin2p2 = consin2p2[_n+5] if missing(consin2p2) & year==2007
replace consin2p2 = consin2p2[_n+4] if missing(consin2p2) & year==2008
replace consin2p2 = consin2p2[_n+3] if missing(consin2p2) & year==2009
replace consin2p2 = consin2p2[_n+2] if missing(consin2p2) & year==2010
replace consin2p2 = consin2p2[_n+1] if missing(consin2p2) & year==2011
replace consin2p2 = consin2p2[_n-1] if missing(consin2p2) & year==2013
replace consin2p2 = consin2p2[_n-2] if missing(consin2p2) & year==2014
replace consin2p2 = consin2p2[_n-3] if missing(consin2p2) & year==2015

gen failurep3= failure if year==2015
replace failurep3 = failurep3[_n+10] if missing(failurep3) & year==2005
replace failurep3 = failurep3[_n+9] if missing(failurep3) & year==2006
replace failurep3 = failurep3[_n+8] if missing(failurep3) & year==2007
replace failurep3 = failurep3[_n+7] if missing(failurep3) & year==2008
replace failurep3 = failurep3[_n+6] if missing(failurep3) & year==2009
replace failurep3 = failurep3[_n+5] if missing(failurep3) & year==2010
replace failurep3 = failurep3[_n+4] if missing(failurep3) & year==2011
replace failurep3 = failurep3[_n+3] if missing(failurep3) & year==2012
replace failurep3 = failurep3[_n+2] if missing(failurep3) & year==2013
replace failurep3 = failurep3[_n+1] if missing(failurep3) & year==2014

gen consin1p3= consin1 if year==2015
replace consin1p3 = consin1p3[_n+10] if missing(consin1p3) & year==2005
replace consin1p3 = consin1p3[_n+9] if missing(consin1p3) & year==2006
replace consin1p3 = consin1p3[_n+8] if missing(consin1p3) & year==2007
replace consin1p3 = consin1p3[_n+7] if missing(consin1p3) & year==2008
replace consin1p3 = consin1p3[_n+6] if missing(consin1p3) & year==2009
replace consin1p3 = consin1p3[_n+5] if missing(consin1p3) & year==2010
replace consin1p3 = consin1p3[_n+4] if missing(consin1p3) & year==2011
replace consin1p3 = consin1p3[_n+3] if missing(consin1p3) & year==2012
replace consin1p3 = consin1p3[_n+2] if missing(consin1p3) & year==2013
replace consin1p3 = consin1p3[_n+1] if missing(consin1p3) & year==2014

gen consin2p3= consin2 if year==2015
replace consin2p3 = consin2p3[_n+10] if missing(consin2p3) & year==2005
replace consin2p3 = consin2p3[_n+9] if missing(consin2p3) & year==2006
replace consin2p3 = consin2p3[_n+8] if missing(consin2p3) & year==2007
replace consin2p3 = consin2p3[_n+7] if missing(consin2p3) & year==2008
replace consin2p3 = consin2p3[_n+6] if missing(consin2p3) & year==2009
replace consin2p3 = consin2p3[_n+5] if missing(consin2p3) & year==2010
replace consin2p3 = consin2p3[_n+4] if missing(consin2p3) & year==2011
replace consin2p3 = consin2p3[_n+3] if missing(consin2p3) & year==2012
replace consin2p3 = consin2p3[_n+2] if missing(consin2p3) & year==2013
replace consin2p3 = consin2p3[_n+1] if missing(consin2p3) & year==2014

gen failure_overall=  failurep1 if year<=2008
replace failure_overall = failurep2 if year>=2009 & year<=2012
replace failure_overall = failurep3 if year>=2013

rangestat (mean) z_cost = financial_constraints, interval( year -1 1) by(act) excludeself
label var z_cost "Averaged Cost Barriers"


save   "$Output\Panel_sample_est.dta", replace

********************************************************************************
********************************************************************************
********************************************************************************

//Filter 0: all

//Sample Filters: Firms with innovation expenditures
keep if innovative==1


* Balanced Panel- Restriction
bysort ident: gen nyear=[_N]
browse ident year nyear
tab nyear 
keep if nyear==11

sort year
by year: tab muestra 
by year: tab tam200 
by year: tab tech

//Sample Analysis****
label define muestra1 1 "Only MEG" 2 "Only MID" 3 "MED & MID" 4 "MIDE" 5 "MEP" 
label values muestra muestra1
xttab muestra
sort year
by year: tab muestra
//Setting the panel data
sort ident year
xtset ident year
xtdes

**Saving Completed panel
*sort ident year
save   "$Output\Panel_filtered_all.dta", replace

********************************************************************************
********************************************************************************
//Filter 1: SME

clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_sample_est.dta"
set more off

//Sample Filters: Firms with innovation expenditures
keep if innovative==1
keep if tam200==0

* Balanced Panel- Restriction
bysort ident: gen nyear=[_N]
browse ident year nyear
tab nyear 
keep if nyear==11

sort year
by year: tab muestra 
by year: tab tam200 
by year: tab tech

//Sample Analysis****
label define muestra1 1 "Only MEG" 2 "Only MID" 3 "MED & MID" 4 "MIDE" 5 "MEP" 
label values muestra muestra1
xttab muestra
sort year
by year: tab muestra
//Setting the panel data
sort ident year
xtset ident year
xtdes

**Saving Completed panel
*sort ident year
save   "$Output\Panel_filtered_SMEs.dta", replace

clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_sample_est.dta"
set more off

//Sample Filters: Firms with innovation expenditures
keep if tam200==0
save   "$Output\Panel_filtered_SMEs_all.dta", replace



********************************************************************************
********************************************************************************
//Filter 2: Large

clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_sample_est.dta"
set more off

//Sample Filters: Firms with innovation expenditures
keep if tam200==1
keep if innovative==1

* Balanced Panel- Restriction
bysort ident: gen nyear=[_N]
browse ident year nyear
tab nyear 
keep if nyear==11

sort year
by year: tab muestra 
by year: tab tam200 
by year: tab tech

//Sample Analysis****
label define muestra1 1 "Only MEG" 2 "Only MID" 3 "MED & MID" 4 "MIDE" 5 "MEP" 
label values muestra muestra1
xttab muestra
sort year
by year: tab muestra
//Setting the panel data
sort ident year
xtset ident year
xtdes

**Saving Completed panel
*sort ident year
save "$Output\Panel_filtered_large.dta", replace


clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_sample_est.dta"
set more off

//Sample Filters: Firms with innovation expenditures
keep if tam200==1
save "$Output\Panel_filtered_large_all.dta", replace


********************************************************************************
********************************************************************************
//Filter 3: Manufacturing

clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_sample_est.dta"
set more off

//Sample Filters: Firms with innovation expenditures
keep if manufacturing==1
keep if innovative==1

* Balanced Panel- Restriction
bysort ident: gen nyear=[_N]
browse ident year nyear
tab nyear 
keep if nyear==11

sort year
by year: tab muestra 
by year: tab tam200 
by year: tab tech

//Sample Analysis****
label define muestra1 1 "Only MEG" 2 "Only MID" 3 "MED & MID" 4 "MIDE" 5 "MEP" 
label values muestra muestra1
xttab muestra
sort year
by year: tab muestra
//Setting the panel data
sort ident year
xtset ident year
xtdes

**Saving Completed panel
*sort ident year
save "$Output\Panel_filtered_manuf.dta", replace


********************************************************************************
********************************************************************************
//Filter 4: Services

clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_sample_est.dta"
set more off

//Sample Filters: Firms with innovation expenditures
keep if services==1
keep if innovative==1

* Balanced Panel- Restriction
bysort ident: gen nyear=[_N]
browse ident year nyear
tab nyear 
keep if nyear==11

sort year
by year: tab muestra 
by year: tab tam200 
by year: tab tech

//Sample Analysis****
label define muestra1 1 "Only MEG" 2 "Only MID" 3 "MED & MID" 4 "MIDE" 5 "MEP" 
label values muestra muestra1
xttab muestra
sort year
by year: tab muestra
//Setting the panel data
sort ident year
xtset ident year


**Saving Completed panel
*sort ident year
save "$Output\Panel_filtered_serv.dta", replace

********************************************************************************
********************************************************************************
********************************************************************************
