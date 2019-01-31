********************************************************************************
********************		4. DESCRIPTIVES				 ***********************
********************************************************************************

********************************************************************************
//All FIRMS
********************************************************************************

clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_filtered_all.dta"
set more off


//Product and process innovation

table year, contents(mean innova_tech)
table year if tam200==0, contents(mean innova_tech)
table year if tam200==1, contents(mean innova_tech n innova_tech)

table year, contents(mean innprod mean innproc)
table year if tam200==0, contents(mean innprod mean innproc)
table year if tam200==1, contents(mean innprod mean innproc)


//Public Support

table year, contents(mean bsupport n bsupport)
table year if innova_tech==1, contents(mean bsupport n bsupport)
table year if tam200==0 & innova_tech==1, contents(mean bsupport n bsupport)
table year if tam200==1 & innova_tech==1, contents(mean bsupport n bsupport)

//Public Support and Abandon condition

table year, contents(mean consin1 mean consin2 mean failure)
table year if bsupport==1, contents(mean consin1 mean consin2 mean failure)
table year if bsupport==0, contents(mean consin1 mean consin2 mean failure)


********************************************************************************
//SMEs
********************************************************************************

clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_filtered_SMEs.dta"
set more off
xtset ident year
xtdes

//Public Support and Abandon condition
table year, contents(mean consin1 mean consin2 mean failure)
table year if bsupport==1, contents(mean consin1 mean consin2 mean failure)
table year if bsupport==0, contents(mean consin1 mean consin2 mean failure)


table year if bgintid==1, contents(mean consin1 mean consin2 mean failure)
table year if bsupport==1 & bgintid==1, contents(mean consin1 mean consin2 mean failure)
table year if bsupport==0 & bgintid==1, contents(mean consin1 mean consin2 mean failure)


//Transition Probabilities
xttrans failure 
xttrans failure if bsupport==1
xttrans failure if bsupport==0

xttrans failure_overall 
xttrans failure_overall if bsupport==1
xttrans failure_overall if bsupport==0

//Distribution of obervations according with public support and whether they abandon or not a proyect
tab bsupport failure_ord  if year<=2008, chi2 lrchi2 column
tab bsupport failure_ord  if year>=2009 & year<=2012, chi2 lrchi2 column
tab bsupport failure_ord  if year>=2013, chi2 lrchi2 column

//Descriptives by year

global XTLIST consin1 consin2 failure bsupport evolcifra age  ln_age size ln_size ///
		gintidpt ln_gintidpt depth breadth financial_constraints knowledge_barriers dominated_barrier //// 
		uncertainty_barrier novedad higher_education researchers ln_researchers group parque bip bextranj ////
		exporter ManufAT ManufTM ManufRest ServAT ServRest


*2006-2008
estpost sum $XTLIST if year<=2008 
esttab using table2.1.tex, replace cell((mean(fmt(%9.2f)) sd(fmt(%9.2f)))) ///
	nonumber nomtitle compress nogaps

*2009-2011
estpost sum $XTLIST if year>= 2009 & year<=2011
esttab using "${path}\Output\tables\table2.2.rtf", replace cell((mean(fmt(%9.2f)) sd(fmt(%9.2f)) ///
	min(fmt(%9.1f)) max(fmt(%9.1f)))) nonumber nomtitle compress nogaps

*2012-2014
estpost sum $XTLIST if year>= 2012
esttab using "${path}\Output\tables\table2.3.rtf", replace cell((mean(fmt(%9.2f)) sd(fmt(%9.2f)) ///
	min(fmt(%9.1f)) max(fmt(%9.1f)))) nonumber nomtitle compress nogaps

//Correlation Matrix

tetrachoric financial_constraints knowledge_barriers dominated_barrier
spearman $XTLIST, star(0.05)

********************************************************************************
//Large
********************************************************************************

clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_filtered_large.dta"
set more off
xtset ident year
xtdes

//Public Support and Abandon condition

table year, contents(mean consin1 mean consin2 mean failure)
table year if bsupport==1, contents(mean consin1 mean consin2 mean failure)
table year if bsupport==0, contents(mean consin1 mean consin2 mean failure)

table year if bgintid==1, contents(mean consin1 mean consin2 mean failure)
table year if bsupport==1 & bgintid==1, contents(mean consin1 mean consin2 mean failure)
table year if bsupport==0 & bgintid==1, contents(mean consin1 mean consin2 mean failure)

//Transition Probabilities
xttrans failure 
xttrans failure if bsupport==1
xttrans failure if bsupport==0

xttrans failure_overall 
xttrans failure_overall if bsupport==1
xttrans failure_overall if bsupport==0

//Distribution of obervations according with public support and whether they abandon or not a proyect
tab bsupport failure_ord  if year<=2008, chi2 lrchi2 row
tab bsupport failure_ord  if year>=2009 & year<=2012, chi2 lrchi2
tab bsupport failure_ord  if year>=2013, chi2 lrchi2

//Descriptives by year

global XTLIST consin1 consin2 failure bsupport evolcifra age  ln_age size ///
		ln_size gintidpt ln_gintidpt depth breadth financial_constraints knowledge_barriers ///
		dominated_barrier uncertainty_barrier novedad higher_education researchers ///
		ln_researchers group parque bip bextranj exporter ManufAT ManufTM ManufRest ServAT ServRest

*2006-2008
estpost sum $XTLIST if year<=2008 
esttab using table3.1.tex, replace cell((mean(fmt(%9.2f)) sd(fmt(%9.2f)) ///
	min(fmt(%9.1f)) max(fmt(%9.1f)))) nonumber nomtitle compress nogaps

*2009-2011
estpost sum $XTLIST if year>= 2009 & year<=2011
esttab using "${path}\Output\tables\table3.2.rtf", replace cell((mean(fmt(%9.2f)) sd(fmt(%9.2f)) /// 
	min(fmt(%9.1f)) max(fmt(%9.1f)))) nonumber nomtitle compress nogaps

*2012-2014
estpost sum $XTLIST if year>= 2012
esttab using "${path}\Output\tables\table3.3.rtf", replace cell((mean(fmt(%9.2f)) sd(fmt(%9.2f)) ///
	min(fmt(%9.1f)) max(fmt(%9.1f)))) nonumber nomtitle compress nogaps

//Correlation Matrix
tetrachoric financial_constraints knowledge_barriers dominated_barrier
spearman $XTLIST, star(0.05)

********************************************************************************
********************************************************************************
