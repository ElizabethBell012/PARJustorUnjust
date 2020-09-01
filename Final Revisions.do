use "C:\Users\Ebell\Dropbox\OKProjects\Admin Burden\Data\CodedDataMerged_seda_subgroups_incomplete.dta", clear

*standardizing variables 
*reg burdenindex white ed inc male ideol tenure npcollab time_req_1 resources , vce(cluster schoolid) 

sum white ed inc male ideol tenure npcollab time_req_1 resources republican
gen ideol_stand=(ideol-4.62)/1.65
gen ed_stand=(ed-6.92)/0.547
gen inc_stand=(inc-2.208)/0.797
gen tenure_stand=(tenure-3.098)/0.895
gen resources_stand=(resources-3.539)/0.921
gen time_stand=(time_req_1-43.48)/24.17

*standardized dummy variables
gen white_stand=(white-0.78)/0.415
gen male_stand=(male-0.084)/0.279
gen npcollab_stand=(npcollab-0.149)/0.356
gen partyid_stand=(republican-0.524)/0.5005


*main models

reg burdenindex ///
white_stand ed_stand inc_stand male_stand ideol_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand , vce(cluster schoolid) 
   outreg2 using "C:\Users\Ebell\Dropbox\OKProjects\Politics & Beliefs about Burden Paper\PAR RR\Index", ///
title(Regression Results) excel append
 
reg burdenindex ///
white_stand ed_stand inc_stand male_stand ideol_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand i.countyid , vce(cluster schoolid) 
   outreg2 using "C:\Users\Ebell\Dropbox\OKProjects\Politics & Beliefs about Burden Paper\PAR RR\Index", ///
title(Regression Results) excel append
 
 *breaking it down by each burden
 
 reg change_inccheck ///
white_stand ed_stand inc_stand male_stand ideol_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand i.countyid , vce(cluster schoolid)
 
  reg change_sap ///
white_stand ed_stand inc_stand male_stand ideol_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand i.countyid , vce(cluster schoolid) 
 
   reg change_undoc ///
white_stand ed_stand inc_stand male_stand ideol_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand i.countyid , vce(cluster schoolid) 
 
  reg change_remedial ///
white_stand ed_stand inc_stand male_stand ideol_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand i.countyid , vce(cluster schoolid) 
 
 *dummy models for appendix
 
  reg inccheck ///
white_stand ed_stand inc_stand male_stand ideol_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand i.countyid , vce(cluster schoolid)
 
  reg sap ///
white_stand ed_stand inc_stand male_stand ideol_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand i.countyid , vce(cluster schoolid) 
 
   reg undoc ///
white_stand ed_stand inc_stand male_stand ideol_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand i.countyid , vce(cluster schoolid) 
 
  reg remedial ///
white_stand ed_stand inc_stand male_stand ideol_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand i.countyid , vce(cluster schoolid) 
 
*****seeing if results are consistent when we use party ID

reg burdenindex ///
white_stand ed_stand inc_stand male_stand partyid_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand , vce(cluster schoolid) 
     outreg2 using "C:\Users\Ebell\Dropbox\OKProjects\Politics & Beliefs about Burden Paper\PAR RR\Party", ///
title(Regression Results) excel append

   reg burdenindex ///
white_stand  ed_stand inc_stand male_stand partyid_stand tenure_stand ///
npcollab_stand time_stand ///
 resources_stand i.countyid, vce(cluster schoolid)
     outreg2 using "C:\Users\Ebell\Dropbox\OKProjects\Politics & Beliefs about Burden Paper\PAR RR\Party", ///
title(Regression Results) excel append
