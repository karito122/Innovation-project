********************************************************************************
********************   6.1 Estimations: Robustness Check I    ******************
********************       Cross Sectional Estimation         ******************
********************                   SMEs		          **********************
********************************************************************************
clear
estimates clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_filtered_SMEs.dta"
set more off
xtset ident year
xtdes


global YTLIST consin1 consin2 failure

global XTLIST1 evolcifra bsupport ln_size ln_age ln_gintidpt depth breadth ////
		financial_constraints knowledge_barriers dominated_barrier //// 
		uncertainty_barrier novedad ln_researchers higher_education group bextranj exporter bip  ////
		ManufAT ManufTM ServAT ServRest z_cost innovative
		

keep ident year $YTLIST $XTLIST1 


*********************************************************************************
********************************************************************************
reshape wide $YTLIST $XTLIST1, i(ident) j(year)
*********************************************************************************
********************************************************************************

global XTLIST1 evolcifra2007 bsupport2007 ln_size2007 ln_age2007 ln_gintidpt2007 ///
				depth2007 breadth2007 financial_constraints2007 knowledge_barriers2007 ///
				dominated_barrier2007 uncertainty_barrier2007 higher_education2007 ///
				bip2007 group2007 bextranj2007 exporter2007 ManufAT2007 ManufTM2007 ///
				ServAT2007 ServRest2007
		
global XTLIST2 z_cost2007 evolcifra2007 bsupport2007 ln_size2007 ln_age2007 ///
				ln_gintidpt2007 depth2007 breadth2007 knowledge_barriers2007 ///
				dominated_barrier2007 uncertainty_barrier2007 higher_education2007 ///
				bip2007 group2007 bextranj2007 exporter2007 ManufAT2007 ManufTM2007 ///
				ServAT2007 ServRest2007

cmp (consin12008= $XTLIST1) (financial_constraints2008=$XTLIST2), ind($cmp_probit $cmp_probit) 
estimates store cProject1
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm1

cmp (consin22008= $XTLIST1) (financial_constraints2008=$XTLIST2), ind($cmp_probit $cmp_probit) 
estimates store cProject2
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm2

cmp (failure2008= $XTLIST1) (financial_constraints2008=$XTLIST2), ind($cmp_probit $cmp_probit)
estimates store cProject3
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm3


global XTLIST1 evolcifra2011 bsupport2011 ln_size2011 ln_age2011 ln_gintidpt2011 ///
				depth2011 breadth2011 financial_constraints2011 knowledge_barriers2011 ///
				dominated_barrier2011 uncertainty_barrier2011 higher_education2011 ///
				bip2011 group2011 bextranj2011 exporter2011 ManufAT2011 ManufTM2011 ///
				ServAT2011 ServRest2011

global XTLIST2 z_cost2011 evolcifra2011 bsupport2011 ln_size2011 ln_age2011 ///
				ln_gintidpt2011 depth2011 breadth2011 knowledge_barriers2011 ///
				dominated_barrier2011 uncertainty_barrier2011 higher_education2011 ///
				bip2011 group2011 bextranj2011 exporter2011 ManufAT2011 ManufTM2011 ///
				ServAT2011 ServRest2011

		
cmp (consin12012= $XTLIST1) (financial_constraints2012=$XTLIST2), ind($cmp_probit $cmp_probit) 
estimates store cProject4
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm4

cmp (consin22012= $XTLIST1) (financial_constraints2012=$XTLIST2), ind($cmp_probit $cmp_probit)
estimates store cProject5
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm5

cmp (failure2012= $XTLIST1) (financial_constraints2012=$XTLIST2), ind($cmp_probit $cmp_probit) 
estimates store cProject6
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm6
		
//Period After crisis: 2013-2015		
global XTLIST1 evolcifra2014 bsupport2014 ln_size2014 ln_age2014 ln_gintidpt2014 ////
				depth2014 breadth2014 financial_constraints2014 knowledge_barriers2014 ////
				dominated_barrier2014 uncertainty_barrier2014 higher_education2014 ///
				bip2014 group2014 bextranj2014 exporter2014 ManufAT2014 ManufTM2014 ///
				ServAT2014 ServRest2014

global XTLIST2 z_cost2014 evolcifra2014 bsupport2014 ln_size2014 ln_age2014 ///
				ln_gintidpt2014 depth2014 breadth2014 knowledge_barriers2014 ///
				dominated_barrier2014 uncertainty_barrier2014 higher_education2014 ///
				bip2014 group2014 bextranj2014 exporter2014 ManufAT2014 ManufTM2014 ///
				ServAT2014 ServRest2014

		
cmp (consin12015= $XTLIST1) (financial_constraints2015=$XTLIST2), ind($cmp_probit $cmp_probit) 
estimates store cProject7
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm7

cmp (consin22015= $XTLIST1) (financial_constraints2015=$XTLIST2), ind($cmp_probit $cmp_probit) 
estimates store cProject8
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm8

cmp (failure2015= $XTLIST1) (financial_constraints2015=$XTLIST2), ind($cmp_probit $cmp_probit) 
estimates store cProject9
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm9		

**Tables 
//Simultaneous Estimation (Robustness)
esttab cProject* using "$Output/tables/table_robustness1_SMEs.tex", starlevels(* 0.10 ** 0.05 *** 0.01) ////
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table A3: Coefficients-Robussness I}) ///
		mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

esttab cProject* using "$Output/tables/table_robustness1_SMEs.csv", starlevels(* 0.10 ** 0.05 *** 0.01) ////
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table A3: Coefficients-Robussness I}) ///
		mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")
		
//Simultaneous Estimation: Marginal effects (Robustness)
esttab cmpm* using "$Output/tables/table_robustness1_ME_SMEs.tex", starlevels(* 0.10 ** 0.05 *** 0.01) ///
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table A3: Marginal effects: Robussness I}) ///
		mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

esttab cmpm* using "$Output/tables/table_robustness1_ME_SMEs.csv", starlevels(* 0.10 ** 0.05 *** 0.01) ///
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table A3: Marginal effects: Robussness I}) ///
		mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

********************************************************************************
********************   6.1 Estimations: Robustness Check II   ******************
********************   Continous Variable for Public Support  ******************
********************                   SMEs		          **********************
********************************************************************************

clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

estimates clear

use  "$Output\Panel_filtered_SMEs.dta"
set more off
xtset ident year
xtdes

	
//For Robustness check
global XTLIST11 evolcifra ln_support_tott_1 ln_sizet_1 ln_age ln_gintidptt_1 depth breadth ////
		financial_constraintst_1 knowledge_barrierst_1 dominated_barriert_1 //// 
		uncertainty_barriert_1 higher_educationt_1  bipt_1 groupt_1 bextranjt_1 exportert_1   ////
		ManufAT ManufTM ServAT ServRest
		
global XTLIST22 z_cost evolcifra ln_support_tott_1 ln_sizet_1 ln_age ln_gintidptt_1 depth breadth ////
		knowledge_barrierst_1 dominated_barriert_1 //// 
		uncertainty_barriert_1  higher_educationt_1  bipt_1 groupt_1 bextranjt_1 exportert_1   ////
		ManufAT ManufTM ServAT ServRest


********************************************************************************
//Period 1: Before Crisis (2005 - 2008)
********************************************************************************

*Simultaneous estimation of Failure and Cost Barriers	
//Robustness Check 1

cmp (consin1p1= $XTLIST11 yearly3 yearly4) (financial_constraints=$XTLIST22 yearly3 yearly4) ///
				if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpr1
margins, dydx (*) predict (eq(#1) pr) post  
estimates store cmprobma1

cmp (consin2p1= $XTLIST11 yearly3 yearly4) (financial_constraints=$XTLIST22 yearly3 yearly4) ///
				if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr2
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma2

cmp (failurep1= $XTLIST11 yearly3 yearly4) (financial_constraints=$XTLIST22 yearly3 yearly4) ///
						if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr3
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma3


********************************************************************************
//Period 2: 2009-2012
********************************************************************************

**CMP Model
**Robustness
cmp (consin1p2= $XTLIST11 yearly6 yearly7 yearly8) (financial_constraints=$XTLIST22 yearly6 yearly7) ///
				if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpr4
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma4

cmp (consin2p2= $XTLIST11 yearly6 yearly7 yearly8) (financial_constraints=$XTLIST22 yearly6 yearly7) ///
				if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr5
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma5

cmp (failurep2= $XTLIST11 yearly6 yearly7 yearly8) (financial_constraints=$XTLIST22 yearly6 yearly7) ///
				if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr6
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma6

********************************************************************************
//2013-2015
********************************************************************************

**CMP Model
**Robustness 1

cmp (consin1p3= $XTLIST11 yearly10 yearly11) (financial_constraints=$XTLIST22 yearly9 yearly10) ///
				if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpr7
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma7

cmp (consin2p3= $XTLIST11 yearly10 yearly11) (financial_constraints=$XTLIST22 yearly9 yearly10) ///
				if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr8
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma8

cmp (failurep3= $XTLIST11 yearly10 yearly11) (financial_constraints=$XTLIST22 yearly9 yearly10) ///
				if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr9
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma9
 
********************************************************************************
//Tables: OUTPUTS
********************************************************************************

//Simultaneous Estimation (Robustness)
esttab cmpr* using "$Output/tables/table_robustness2_SMEs.tex", starlevels(* 0.10 ** 0.05 *** 0.01) ///
	replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
	num title({Table A5: Coefficients SMEs (Robustness: Continous Public Support)}) ///
	mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
	addnotes("Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

esttab cmpr* using "$Output/tables/table_robustness2_SMEs.csv", starlevels(* 0.10 ** 0.05 *** 0.01) ///
	replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
	num title({Table A5: Coefficients SMEs (Robustness: Continous Public Support)}) ///
	mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
	addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

//Simultaneous Estimation: Marginal effects (Robustness)
esttab cmprobma* using "$Output/tables/table_robustness2_marg_SMEs.tex", starlevels(* 0.10 ** 0.05 *** 0.01) ///
	replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
	num title({Table A5: Marginal effects SMEs (Robustness: Continous Public Support)}) ///
	mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
	addnotes("Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

esttab cmprobma* using "$Output/tables/table_robustness2_marg_SMEs.csv", starlevels(* 0.10 ** 0.05 *** 0.01) ///
	replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
	num title({Table A5: Marginal effects SMEs (Robustness: Continous Public Support)}) ///
	mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
	addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

********************************************************************************
********************  6.1 Estimations: Robustness Check III   ******************
********************             SAMPLE SELECTION             ******************
********************                   SMEs		          **********************
********************************************************************************
clear
estimates clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

use  "$Output\Panel_filtered_SMEs_all.dta"
set more off
xtset ident year
xtdes

//Robustness (Selection: innovative firms)
global probit ln_size ln_age ln_gintidpt depth breadth financial_constraints  ///
				higher_education  bip group bextranj exporter ManufAT ManufTM ServAT ServRest

gen indexp1=.

local i=2005
while `i'<=2008 {

	qui probit innovative $probit if year==`i'
	predict yhatp1`i', xb
	replace indexp1=yhatp1`i' if year==`i'

local i=`i'+1
}

gen millsp1=normalden(indexp1)/normal(indexp1) if innovative==1

//Period 2
gen indexp2=.

local i=2009
while `i'<=2012 {

	qui probit innovative $probit if year==`i'
	predict yhatp2`i', xb
	replace indexp2=yhatp2`i' if year==`i'

local i=`i'+1
}

gen millsp2=normalden(indexp2)/normal(indexp2) if innovative==1

//Period 3
gen indexp3=.

local i=2013
while `i'<=2015 {

	qui probit innovative $probit if year==`i'
	predict yhatp3`i', xb
	replace indexp3=yhatp3`i' if year==`i'

local i=`i'+1
}

gen millsp3=normalden(indexp3)/normal(indexp3) if innovative==1


//Baseline
global XTLIST1 evolcifra bsupportt_1 ln_sizet_1 ln_age ln_gintidptt_1 depth ///
		breadth financial_constraintst_1 knowledge_barrierst_1 dominated_barriert_1 //// 
		uncertainty_barriert_1 higher_educationt_1  bipt_1 groupt_1 bextranjt_1 ///
		exportert_1 ManufAT ManufTM ServAT ServRest

		
global XTLIST2 z_cost evolcifra bsupportt_1 ln_sizet_1 ln_age ln_gintidptt_1 ///
		depth breadth knowledge_barrierst_1 dominated_barriert_1 uncertainty_barriert_1 ///
		higher_educationt_1  bipt_1 groupt_1 bextranjt_1 exportert_1  ManufAT ManufTM ServAT ServRest
		
********************************************************************************
//Period 1: Before Crisis (2005 - 2008)
********************************************************************************

*Simultaneous estimation of Failure and Cost Barriers	
cmp (consin1p1= $XTLIST1 yearly3 yearly4 millsp1) ///
	(financial_constraints=$XTLIST2 yearly3 yearly4 millsp1) ///
	if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpc1
margins, dydx (*) predict (eq(#1) pr) post  
estimates store cmpm1

cmp (consin2p1= $XTLIST1 yearly3 yearly4 millsp1) ////
	(financial_constraints=$XTLIST2 yearly3 yearly4 millsp1) ///
	if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc2
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm2

cmp (failurep1= $XTLIST1 yearly3 yearly4 millsp1) ///
	(financial_constraints=$XTLIST2 yearly3 yearly4 millsp1) ///
	if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc3
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm3

//Robustness Check 1

cmp (consin1p1= $XTLIST11 yearly3 yearly4 millsp1) ///
	(financial_constraints=$XTLIST22 yearly3 yearly4 millsp1) ///
	if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpr1
margins, dydx (*) predict (eq(#1) pr) post  
estimates store cmprobma1

cmp (consin2p1= $XTLIST11 yearly3 yearly4 millsp1) ///
	(financial_constraints=$XTLIST22 yearly3 yearly4 millsp1) ///
	if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr2
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma2

cmp (failurep1= $XTLIST11 yearly3 yearly4 millsp1) ///
	(financial_constraints=$XTLIST22 yearly3 yearly4 millsp1) ///
	if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr3
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma3


********************************************************************************
//Period 2: 2009-2012
********************************************************************************

**CMP Model
cmp (consin1p2= $XTLIST1 yearly6 yearly7 yearly8 millsp2) ///
	(financial_constraints=$XTLIST2 yearly6 yearly7 millsp2) ///
	if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpc4
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm4

cmp (consin2p2= $XTLIST1 yearly6 yearly7 yearly8 millsp2) ///
	(financial_constraints=$XTLIST2 yearly6 yearly7 millsp2) ///
	if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc5
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm5

cmp (failurep2= $XTLIST1 yearly6 yearly7 yearly8 millsp2) ///
	(financial_constraints=$XTLIST2 yearly6 yearly7 millsp2) ///
	if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc6
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm6

**Robustness
cmp (consin1p2= $XTLIST11 yearly6 yearly7 yearly8 millsp2) ////
	(financial_constraints=$XTLIST22 yearly6 yearly7 millsp2) ///
	if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpr4
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma4

cmp (consin2p2= $XTLIST11 yearly6 yearly7 yearly8 millsp2) ///
	(financial_constraints=$XTLIST22 yearly6 yearly7 millsp2) ///
	if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr5
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma5

cmp (failurep2= $XTLIST11 yearly6 yearly7 yearly8 millsp2) ///
	(financial_constraints=$XTLIST22 yearly6 yearly7 millsp2) ///
	if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr6
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma6

********************************************************************************
//2013-2015
********************************************************************************

**CMP Model

cmp (consin1p3= $XTLIST1 yearly10 yearly11 millsp3) ///
	(financial_constraints=$XTLIST2 yearly9 yearly10 millsp3) ///
	if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpc7
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm7

cmp (consin2p3= $XTLIST1 yearly10 yearly11 millsp3) ///
	(financial_constraints=$XTLIST2 yearly9 yearly10 millsp3) ///
	if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc8
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm8

cmp (failurep3= $XTLIST1 yearly10 yearly11 millsp3) ///
	(financial_constraints=$XTLIST2 yearly9 yearly10 millsp3) ///
	if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc9
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm9


**Robustness 1

cmp (consin1p3= $XTLIST11 yearly10 yearly11 millsp3) ///
	(financial_constraints=$XTLIST22 yearly9 yearly10 millsp3) ///
	if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpr7
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma7

cmp (consin2p3= $XTLIST11 yearly10 yearly11 millsp3) ///
	(financial_constraints=$XTLIST22 yearly9 yearly10 millsp3) ///
	if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr8
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma8

cmp (failurep3= $XTLIST11 yearly10 yearly11 millsp3) ///
	(financial_constraints=$XTLIST22 yearly9 yearly10 millsp3) ///
	if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpr9
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmprobma9
 
********************************************************************************
//Tables
********************************************************************************


//Simultaneous Estimation
esttab cmpc* using "$Output/tables/tablecmp1.tex", starlevels(* 0.10 ** 0.05 *** 0.01) ///
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table A7: Coefficients Robustness: Sample Selection}) ////
		mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

esttab cmpc* using "$Output/tables/tablecmp1.csv", starlevels(* 0.10 ** 0.05 *** 0.01) ///
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table A7: Coefficients SMEs- Robustness: Sample Selection}) ///
		mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

//Simultaneous Estimation: Marginal effects
esttab cmpm* using "$Output/tables/tablecmpmar1.tex", starlevels(* 0.10 ** 0.05 *** 0.01) ///
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
num title({Table A7: Marginal effects SMEs-Robustness: Sample Selection}) ///
		mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

esttab cmpm* using "$Output/tables/tablecmpmar1.csv", starlevels(* 0.10 ** 0.05 *** 0.01) ///
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table A7: Marginal effects SMEs- Robustness: Sample Selection}) ///
		mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

********************************************************************************
********************************************************************************

