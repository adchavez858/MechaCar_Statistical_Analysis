# MechaCar_Statistical_Analysis

## Overview of Project:
A few weeks after starting his new role, Jeremy is approached by upper management about a special project. AutosRUs’ newest prototype, the MechaCar, is suffering from production troubles that are blocking the manufacturing team’s progress. AutosRUs’ upper management has called on Jeremy and the data analytics team to review the production data for insights that may help the manufacturing team.

In this challenge, you’ll help Jeremy and the data analytics team do the following:

* Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes
* Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots
* Run t-tests to determine if the manufacturing lots are statistically different from the mean population
* Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. For each statistical analysis, you’ll write a summary interpretation of the findings.

## Deliverables:
* Data Source: MechaCar_mpg.csv and Suspension_Coil.csv
* Data Tools: tidyverse, dplyr, ggplot2 and MechaCarChallenge.RScript.
* Software: RStudio and R

## Linear Regression to Predict MPG
1. Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
The vehicle length / ground clearance have the highest influence on predicting mpg with very small p-values. Any non-negligible change in one of these variables results in a 6.2671 and 3.5455 increase in mpg respectively. 
2. Is the slope of the linear model considered to be zero? Why or why not?
mpg = 6.26713(vl) + 0.00125(vw) + 0.06877(sa) + 3.54553(gc) - 3.41150(AWD) - 103.96398 
All coefficients of our predictor varaiables are non-zero, therefore the slope of our linear model is also non-zero.
The correlation matrix shows very weak to moderate correlation between the predicting variables and mpg. 
3. Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
With very small p-values for vehicle length and ground clearance, our model explaines 75% of the relationship between mpg and the predictor variables. Vehicle weight, spoiler angle, and AWD variables do not have a statistical significance. 


## Summary Statistics on Suspension Coils
1. The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?
Visually inspecting the total summary, we see that the total summary variance is 62.29356 (within design specification). Variances for Lot1 and Lot2 are within design specification. Lot3 however, has a high variance at 170.2861


## T-Tests on Suspension Coils
1. Determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
Our p-value is above our significance level (if significance level was the common 0.05 percent). We do not have sufficient evidence to reject the null hypothesis in this case, therefore the two means are statistically similar.
2. Determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
Lot 1: our p-value is above our significance level. We do not have sufficient evidence to reject the null hypothesis in this case, therefore the two means are statistically similar.
Lot 2: our p-value is above our significance level. We do not have sufficient evidence to reject the null hypothesis in this case, therefore the two means are statistically similar.
Lot 3: our p-value is below our significance level. We do have sufficient evidence to reject the null hypothesis, therefore the two means are not statistically similar.

## Study Design: MechaCar vs Competition
Since our study design seeks to improve MecharCar against competition, we would look to study metrics such as cost, city or highway fuel efficiency, horse power, maintenance cost, or safety rating.

1. Research Question
Are there differences average city or highway fuel effiency between MecharCar vehicles and competition vehicles?
2. Forming Our Hypothesis
Null Hyothesis: There is no difference between average city or highway fuel efficiency between MecharCar and Competition vehicles
Alternative Hypothesis: There is difference between average city or highway fuel efficiency between MecharCar and Competition vehicles
3. Statistical Test
Since we are dealing with dichotomous data, (sample A vs Sample B), and our dependent variable (city or highway fuel efficiency) is continous, we would employ the Two-sample t-test to evaluate if there are differences in fuel effieciency between MecharCar and competition vehicles
4. Data Requirement
Sample A: sufficiently large MecharCar sample data set of fuel efficiency
Sample B: sufficiently large competition sample data set of fuel efficiency
