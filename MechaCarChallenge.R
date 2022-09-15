---
title: "MechaCar_Statistical_Analysis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


```{r}
options("scipen"=100, "digits"=7)
```


loading required library

```{r}
library(dplyr) # loading required library
library(tidyverse)
```



Reading data file
```{r}
MechaCar_mpg_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
```


Correlation Matrix

```{r}
MecharCar_mpg_matrix <- as.matrix(MechaCar_mpg_df[,c("vehicle_length","vehicle_weight","spoiler_angle","ground_clearance","AWD","mpg")])
cor_MecharCar_mpg_matrix <- cor(MecharCar_mpg_matrix)
cor_MecharCar_mpg_matrix
```

```{r}
mpg_matrix <- cor(MechaCar_mpg_df)
mpg_matrix
```


Fitting a Linear Regression

```{r}
lm_MecharCar_mpg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg_df)
lm_MecharCar_mpg
```

R-squared and p-value

```{r}
summary_lm_MecharCar_mpg <- summary(lm_MecharCar_mpg)
summary_lm_MecharCar_mpg
```

Read the data file


```{r}
Suspension_Coil_df <- read.csv(file='Suspension_Coil.csv',stringsAsFactors = F)
head(Suspension_Coil_df)
```



summary statistics


```{r}
total_summary <- summarize(Suspension_Coil_df, Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
total_summary
```



```{r}
lot_summary <- Suspension_Coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
lot_summary
```


To determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch, we would compare sample mean to the population mean of 1,500 PSI

create a sample dataset using dplyr's sample_n()function
#randomly sample 50 data points


```{r}
sample_table <- Suspension_Coil_df %>% sample_n(50)
head(sample_table)
```

Qualitative Test for Normality

#import dataset into ggplot2


```{r}
plt <- ggplot(sample_table,aes(x=PSI))
```

Qualitative Test for Normality
#visualize distribution using density plot


```{r}
plt + geom_density()
```

Although our data distribution does not perfectly match the normal bell curve shape, the distribution does approximate a normal distribution and could be used for further analysis.

Forming our Hypothesis
H0 : There is no statistical difference between the observed sample mean and its presumed population mean 1500 PSI.
Ha : There is a statistical difference between the observed sample mean and its presumed population mean of 1500 PSI.


```{r}
t.test(sample_table$PSI,mu=1500)
```
Assuming our significance level was the common 0.05 percent, our p-value is above our significance level. Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar.


Determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.

Forming our Hypothesis
H0 : There is no statistical difference between the observed sample mean for each lot and its presumed population mean 1500 PSI.
Ha : There is a statistical difference between the observed sample mean for each lot and its presumed population mean of 1500 PSI.



t.test on Lot1

```{r}
t.test(subset(Suspension_Coil_df$PSI,Suspension_Coil_df$Manufacturing_Lot=="Lot1"),mu=1500)
```
Assuming our significance level was the common 0.05 percent, our p-value is above our significance level. Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar.



t.test on Lot2

```{r}
t.test(subset(Suspension_Coil_df$PSI,Suspension_Coil_df$Manufacturing_Lot=="Lot2"),mu=1500)
```

Assuming our significance level was the common 0.05 percent, our p-value is above our significance level. Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar.


t.test on Lot3


```{r}
t.test(subset(Suspension_Coil_df$PSI,Suspension_Coil_df$Manufacturing_Lot=="Lot3"),mu=1500)
```
Assuming our significance level was the common 0.05 percent, our p-value is below our significance level. Therefore, we have sufficient evidence to reject the null hypothesis, and we would state that the two means are not statistically similar.