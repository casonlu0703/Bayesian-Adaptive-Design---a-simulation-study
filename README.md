# Simulation Study on comparing Bayesian Adaptive Design methods of MTPI2 and BOIN

**Background**: 

Phase I studies are designed to identify the maximum tolerated dose (MTD), which is the dose closest to a pre-specified target toxicity rate, and find the RP2D, which is the highest dose with acceptable toxicity. The existing dose-finding methods of 3+3 or model-based Bayesian method, Continual Reassessment Method (CRM), are either simple to implement, but poor in statistical rationale; or too complicated to implement. Two model-assisted methods, the modified toxicity probability interval method (mTPI) and Bayesian Optimal Interval design (BOIN), possess both preferable statistical properties and practical simplicity. In this project, we compared their performance and applied them in a real clinical trial. 

**Method**: 

The mTPI shares simplicity and transparency as 3+3 design and possesses solid theoretical-framework based on Bayes rule. The UPM statistic is the ratio of the probability mass on that interval to the length of the interval, which is proven to be directly related to the underlying probability model of mTPI design, where a proper decision is actually made by choosing the one with smallest posterior expected loss [Ji et al. (2010)]. The Novel Bayesian optimal interval (BOIN) design was promoted by Yuan et al. (2016), the idea is comparing the observed dose-limiting toxicity (DLT) rate, the ratio of the number of patients experiencing DLT at current dose over the total number of patients treated at current dose, which is a point estimate, with prespecified dose escalation and de-escalation boundaries. To compare the operational characteristics (OC) of mTPI and BOIN, we conducted a simulation study to evaluate safety and reliability. The reliability was defined as the percentage of correctly selecting true MTD. Safety is evaluated by the number of patients treated at or below MTD. Thirty-six simulation scenarios were designed to vary on target toxicity probability and sample size.


**Result**: 

The simulation study revealed that mTPI has higher risk of over-dosing, especially when all doses have true toxicity probability above target toxicity probablity. BOIN tended to be more efficient when true toxicity probabilities jump across target. mTPI had higher chance in selecting the dose level than BOIN when the sample is small. However, as sample size increased, the mTPI method appeared to be more conservative. 

**Conclusion**: 

BOIN is preferable than mTPI with respect to safety with fewer over-dosing issues. On the other hand, mTPI is proven to be more robust in contrast with BOIN under certain conditions, such as when the trial has a poor set up to include all inappropriate doses, either too high or too low.

**Reference**

- Ji Y, Liu P, Li Y, Bekele BN. A modified toxicity probability interval method for dose-finding trials. Clin Trials. 2010 Dec;7(6):653-63. doi: 10.1177/1740774510382799. Epub 2010 Oct 8. PMID: 20935021; PMCID: PMC5038924.
- Yuan Y, Hess KR, Hilsenbeck SG, Gilbert MR. Bayesian Optimal Interval Design: A Simple and Well-Performing Design for Phase I Oncology Trials. Clin Cancer Res. 2016 Sep 1;22(17):4291-301. doi: 10.1158/1078-0432.CCR-16-0592. Epub 2016 Jul 12. PMID: 27407096; PMCID: PMC5047439.
