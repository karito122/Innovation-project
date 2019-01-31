********************************************************************************
********************		5.2 Estimations: Baseline     **********************
********************                   Large Firms        **********************
********************************************************************************

clear
global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
global Output "${path}\Output"

estimates clear

use  "$Output\Panel_filtered_large.dta"
set more off
xtset ident year
xtdes

//Baseline

global XTLIST1 evolcifra bsupportt_1 ln_sizet_1 ln_age ln_gintidptt_1 depth breadth ////
		financial_constraintst_1  knowledge_barrierst_1 dominated_barriert_1 //// 
		uncertainty_barriert_1  higher_educationt_1  bipt_1 groupt_1 bextranjt_1 exportert_1   ////
		ManufAT ManufTM ServAT ServRest
		
global XTLIST2 z_cost evolcifra bsupportt_1 ln_sizet_1 ln_age ln_gintidptt_1 depth breadth ////
		knowledge_barrierst_1 dominated_barriert_1 //// 
		uncertainty_barriert_1  higher_educationt_1  bipt_1 groupt_1 bextranjt_1 exportert_1   ////
		ManufAT ManufTM ServAT ServRest
		
********************************************************************************
//Period 1: Before Crisis (2005 - 2008)
********************************************************************************

*Simultaneous estimation of Failure and Cost Barriers	
cmp (consin1p1= $XTLIST1 yearly3 yearly4) (financial_constraints=$XTLIST2 yearly3 yearly4) ///
			   if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpc1
margins, dydx (*) predict (eq(#1) pr) post  
estimates store cmpm1

cmp (consin2p1= $XTLIST1 yearly3 yearly4) (financial_constraints=$XTLIST2 yearly3 yearly4) ///
				if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc2
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm2

cmp (failurep1= $XTLIST1 yearly3 yearly4) (financial_constraints=$XTLIST2 yearly3 yearly4) ///
				if year<=2008, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc3
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm3

********************************************************************************
//Period 2: 2009-2012
********************************************************************************

**CMP Model
cmp (consin1p2= $XTLIST1 yearly6 yearly7 yearly8) (financial_constraints=$XTLIST2 yearly6 yearly7) ///
				if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpc4
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm4

cmp (consin2p2= $XTLIST1 yearly6 yearly7 yearly8) (financial_constraints=$XTLIST2 yearly6 yearly7) ///
				if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc5
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm5

cmp (failurep2= $XTLIST1 yearly6 yearly7 yearly8) (financial_constraints=$XTLIST2 yearly6 yearly7) ///
				if year>=2009 & year<=2012, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc6
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm6

********************************************************************************
//2013-2015
********************************************************************************

**CMP Model

cmp (consin1p3= $XTLIST1 yearly10 yearly11) (financial_constraints=$XTLIST2 yearly9 yearly10) ///
				if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr
estimates store cmpc7
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm7

cmp (consin2p3= $XTLIST1 yearly10 yearly11) (financial_constraints=$XTLIST2 yearly9 yearly10) ///
				if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc8
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm8

cmp (failurep3= $XTLIST1 yearly10 yearly11) (financial_constraints=$XTLIST2 yearly9 yearly10) ///
				if year>=2013, ind($cmp_probit $cmp_probit) cluster(ident) nolr 
estimates store cmpc9
margins, dydx (*) predict (eq(#1) pr) post
estimates store cmpm9


********************************************************************************
//Tables: OUTPUTS
********************************************************************************

//Simultaneous Estimation
esttab cmpc* using "$Output/tables/table_cmp_large.tex", starlevels(* 0.10 ** 0.05 *** 0.01) ///
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table A2: Coefficients -Large firms}) ///
		mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

esttab cmpc* using "$Output/tables/table_cmp_large.csv", starlevels(* 0.10 ** 0.05 *** 0.01) ///
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table A2: Coefficients -Large firms}) mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

//Simultaneous Estimation: Marginal effects
esttab cmpm* using "$Output/tables/table_ME_large.tex", starlevels(* 0.10 ** 0.05 *** 0.01) ///
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table 5.2: Marginal effects -Large firms}) ///
		mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
		addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

esttab cmpm* using "$Output/tables/table_ME_large.csv", starlevels(* 0.10 ** 0.05 *** 0.01) ///
		replace b(3) se(3) stat(N N_clust df_m r2_a widstat j jp, fmt(0 0 0 2 3 3 3)) ///
		num title({Table 5.2: Marginal effects -Large firms}) mtitles("Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall" "Failure conception" "Failure Implementation" "Failure overall") wrap legend nogaps label ///
	addnotes("Source: Author's elaboration, based on The Spanish Technological innovation panel (PITEC).")

********************************************************************************
********************************************************************************
