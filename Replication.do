


******************************************************
*****ENVIRONMENTAL REGULATION DURING HARD TIMES*******
******************************************************


* FIGURE 1: First Stage

* FIGURE 2: Economic Shocks and Regulatory Enforcement


*** MAIN ANALYSIS ***

use ".../County.dta", clear

* TABLE 1: Economic Shocks and Regulatory Enforcement
ivreghdfe lncwa_total_state  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_state  (std_shock_end_3 = std_shock_exo_3) , cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_state  (std_shock_end_4 = std_shock_exo_4), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_state  (std_shock_end_5 = std_shock_exo_5) , cluster (fips) absorb(fips year) first
sum lncwa_total_state

* TABLE 2: Different Types of Environmental Regulation
ivreghdfe lncwa_formal_action_state  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_informal_action_state  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lnfacilities  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lnpermit_issued_state  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lnpermit_terminated  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
sum lncwa_formal_action_state lncwa_informal_action_state lnfacilities lnpermit_issued_state lnpermit_terminated

* TABLE 3: Environmental Scores - Republicans
use ".../District.dta", clear
xtset district1 year
ivreghdfe score  (std_shock_end_2 = std_shock_exo_2) if party=="R", cluster (district1) absorb(district1 year) first
ivreghdfe score  (std_shock_end_3 = std_shock_exo_3)  if party=="R", cluster (district1) absorb(district1 year) first
ivreghdfe score  (std_shock_end_4 = std_shock_exo_4) if party=="R", cluster (district1) absorb(district1 year) first
ivreghdfe score  (std_shock_end_5 = std_shock_exo_5)  if party=="R", cluster (district1) absorb(district1 year) first
preserve
keep if party=="R"
sum score
restore

* TABLE 4: Individual Assessment of Environmental Policy
use ".../Individual.dta", clear
ivreg2 jobs_env (std_shock_end_2 = std_shock_exo_2) educ ideo5 gender age pid7 i.state1 i.year, cluster(fips) first
ivreg2 jobs_env (std_shock_end_3 = std_shock_exo_3) educ ideo5 gender age pid7 i.state1 i.year, cluster(fips) first
ivreg2 jobs_env (std_shock_end_4 = std_shock_exo_4) educ ideo5 gender age pid7 i.state1 i.year, cluster(fips) first
ivreg2 jobs_env (std_shock_end_5 = std_shock_exo_5) educ ideo5 gender age pid7 i.state1 i.year, cluster(fips) first
preserve
drop if missing(jobs_env)
drop if missing(std_shock_end_2)
sum jobs_env
restore



*** APPENDIX ***

* TABLE A1: Descriptive Statistics 

use ".../County.dta", clear

* TABLE A2: Economic Shocks and Regulatory Enforcement - Formal Actions
ivreghdfe lncwa_formal_action_state  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_formal_action_state  (std_shock_end_3 = std_shock_exo_3) , cluster (fips) absorb(fips year) first
ivreghdfe lncwa_formal_action_state  (std_shock_end_4 = std_shock_exo_4), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_formal_action_state  (std_shock_end_5 = std_shock_exo_5) , cluster (fips) absorb(fips year) first

* TABLE A3: Economic Shocks and Regulatory Enforcement - Informal Actions
ivreghdfe lncwa_informal_action_state  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_informal_action_state  (std_shock_end_3 = std_shock_exo_3) , cluster (fips) absorb(fips year) first
ivreghdfe lncwa_informal_action_state  (std_shock_end_4 = std_shock_exo_4), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_informal_action_state  (std_shock_end_5 = std_shock_exo_5) , cluster (fips) absorb(fips year) first

* TABLE A4: Economic Shocks and Regulatory Enforcement - Regulated Facilities
ivreghdfe lnfacilities  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lnfacilities  (std_shock_end_3 = std_shock_exo_3) , cluster (fips) absorb(fips year) first
ivreghdfe lnfacilities  (std_shock_end_4 = std_shock_exo_4), cluster (fips) absorb(fips year) first
ivreghdfe lnfacilities  (std_shock_end_5 = std_shock_exo_5) , cluster (fips) absorb(fips year) first

* TABLE A5: Economic Shocks and Regulatory Enforcement - Permits Issued
ivreghdfe lnpermit_issued_state  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lnpermit_issued_state  (std_shock_end_3 = std_shock_exo_3) , cluster (fips) absorb(fips year) first
ivreghdfe lnpermit_issued_state  (std_shock_end_4 = std_shock_exo_4), cluster (fips) absorb(fips year) first
ivreghdfe lnpermit_issued_state  (std_shock_end_5 = std_shock_exo_5) , cluster (fips) absorb(fips year) first

* TABLE A6: Economic Shocks and Regulatory Enforcement - Permits Terminated
ivreghdfe lnpermit_terminated  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lnpermit_terminated  (std_shock_end_3 = std_shock_exo_3) , cluster (fips) absorb(fips year) first
ivreghdfe lnpermit_terminated  (std_shock_end_4 = std_shock_exo_4), cluster (fips) absorb(fips year) first
ivreghdfe lnpermit_terminated  (std_shock_end_5 = std_shock_exo_5) , cluster (fips) absorb(fips year) first

* TABLE A7: Economic Shocks and Regulatory Enforcement - OLS
xtreg lncwa_total_state std_shock_end_2 i.year, fe robust
xtreg lncwa_total_state std_shock_end_3 i.year, fe robust
xtreg lncwa_total_state std_shock_end_4 i.year, fe robust
xtreg lncwa_total_state std_shock_end_5 i.year, fe robust

* TABLE A8: Economic Shocks and Regulatory Enforcement - Actions per Facility
ivreghdfe lncwa_pc  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_pc  (std_shock_end_3 = std_shock_exo_3) , cluster (fips) absorb(fips year) first
ivreghdfe lncwa_pc  (std_shock_end_4 = std_shock_exo_4), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_pc  (std_shock_end_5 = std_shock_exo_5) , cluster (fips) absorb(fips year) first

* TABLE A9: Economic Shocks and Regulatory Enforcement - Pre 2008
ivreghdfe lncwa_total_state  (std_shock_end_2 = std_shock_exo_2) if year < 2008, cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_state  (std_shock_end_3 = std_shock_exo_3) if year < 2008, cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_state  (std_shock_end_4 = std_shock_exo_4) if year < 2008, cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_state  (std_shock_end_5 = std_shock_exo_5) if year < 2008, cluster (fips) absorb(fips year) first

* TABLE A10: Economic Shocks and Regulatory Enforcement - EPA Enforcement
ivreghdfe lncwa_total_epa  (std_shock_end_2 = std_shock_exo_2), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_epa  (std_shock_end_3 = std_shock_exo_3) , cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_epa  (std_shock_end_4 = std_shock_exo_4), cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_epa  (std_shock_end_5 = std_shock_exo_5) , cluster (fips) absorb(fips year) first

* TABLE A11: Effects by Legislative Majorities
ivreghdfe lncwa_total_state  (std_shock_end_2 = std_shock_exo_2) if house_rep==1, cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_state  (std_shock_end_2 = std_shock_exo_2) if senate_rep==1, cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_state  (std_shock_end_2 = std_shock_exo_2) if house_rep==0, cluster (fips) absorb(fips year) first
ivreghdfe lncwa_total_state  (std_shock_end_2= std_shock_exo_2) if senate_rep==0, cluster (fips) absorb(fips year) first
univar lncwa_total_state, by(house_rep)
univar lncwa_total_state, by(senate_rep)

* TABLE A12: Environmental Scores - All
use ".../District.dta", clear
xtset district1 year
ivreghdfe score  (std_shock_end_2 = std_shock_exo_2), cluster (district1) absorb(district1 year) first
ivreghdfe score  (std_shock_end_3 = std_shock_exo_3) , cluster (district1) absorb(district1 year) first
ivreghdfe score  (std_shock_end_4 = std_shock_exo_4), cluster (district1) absorb(district1 year) first
ivreghdfe score  (std_shock_end_5 = std_shock_exo_5) , cluster (district1) absorb(district1 year) first
sum score

* TABLE A13: Environmental Scores - Democrats
use "/.../District.dta", clear
xtset district1 year
ivreghdfe score  (std_shock_end_2 = std_shock_exo_2) if party=="D", cluster (district1) absorb(district1 year) first
ivreghdfe score  (std_shock_end_3 = std_shock_exo_3)  if party=="D", cluster (district1) absorb(district1 year) first
ivreghdfe score  (std_shock_end_4 = std_shock_exo_4) if party=="D", cluster (district1) absorb(district1 year) first
ivreghdfe score  (std_shock_end_5 = std_shock_exo_5)  if party=="D", cluster (district1) absorb(district1 year) first
preserve
keep if party=="D"
sum score
restore





























