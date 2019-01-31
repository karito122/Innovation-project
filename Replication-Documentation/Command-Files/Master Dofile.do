********************************************************************************
*******************  Innovation and Firm Behaviour Project  ********************
*********************         Karol Rodriguez               ********************
*********************       Date: 18-Aug-2018             **********************
********************************************************************************

set more off
clear all
macro drop _all

//Contents
*			1. Importing
*			2. Cleaning data set, labeling and inspection
*           3. Sample Filters
*           4. Descriptives 
*           5.1 Estimations: SMEs (Baseline)
*			5.2 Estimations: large firms (Baseline)
*           6.1 Estimations: SMEs (Robustness)
*           6.2 Estimations: large firms (Robustness)


**********************************************************************

//Globals

global path "C:\Users\Rodriguez\Desktop\Project\Replication-Documentation"
**Data Analysis  folder******

global analysis "${path}\Analysis-Data"

**Codes  folder******

global dofiles "${path}\Command-Files"

**Original Data folder ******

global rawdata "${path}\Original-Data"

**Transformed Data folder ******

global Output "${path}\Output"


**Documents folder ******

global document "${path}\Documents"

capture log close

log using "${document}\logs.log", text replace


//Running .do files

//1: importing raw data
	 

do "${dofiles}\1. Import.do"

//2: data cleaning

do "${dofiles}\2. Cleaning.do"

// 3: Sample Filters

do "${dofiles}\3. Sample Filters.do"

// 4: Descriptions

do "${dofiles}\4. Descriptives.do"


// 5: Estimations

// 5.1: Estimations: Baseline- SMEs
do "${dofiles}\5.1 Estimations SMEs (Baseline).do"

// 5.2: Estimations: Baseline- Large firms
do "${dofiles}\5.2 Estimations large (Baseline).do"

// 6: Robustness Checks

// 6.1: Robustness Checks: SMEs
do "${dofiles}\6.1 Estimations SMEs (Robustness).do"

// 6.2: Robustness Checks: Large firms
do "${dofiles}\6.2 Estimations large (Robustness).do"

 
********************************************************************************
********************************************************************************
