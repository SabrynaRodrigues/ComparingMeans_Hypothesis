# **Hypothesis Testing for Website Design Performance | An A/B Test Analysis**

![Capa](https://i.pinimg.com/1200x/39/4b/84/394b8480a444e9454d6202cfdafeef45.jpg)

## **Project Overview**

This project conducts a statistical analysis to determine if a new website design (Model B) leads to a statistically significant change in the average time users take to complete a purchase, compared to the original design (Model A). Using simulated A/B test data, we perform two-sample t-tests under four different assumptions about sample sizes and variances to ensure robust conclusions.

---

## **Global Hypotheses**

*   **Null Hypothesis (H₀):** μₐ = μ_b (The average completion times for Model A and Model B are equal).
*   **Alternative Hypothesis (H₁):** μₐ ≠ μ_b (The average completion times for Model A and Model B are different).
*   **Significance Level (α):** 0.05

---

## **Scenario 1: Equal Sample Sizes and Equal Standard Deviations**

### **Introduction**
This scenario assumes both user groups are of identical size and exhibit the same variability in completion times. The standard two-sample t-test with pooled variance is used.

### **t-Statistic Formula**
![t-test-equal](https://th.bing.com/th/id/R.9fca7ea06d32f576ef7dee69b7c85f85?rik=R1heaAHAUsF2OA&pid=ImgRaw&r=0)

### **Code Snippet**
``` r
mean_a = 2.3
std_a = 0.6
mean_b = 3.7
std_b = 0.6
samplesize = sqrt(145)

t_statistic = (mean_a - mean_b) / (std_a / samplesize)
t_statistic
```

### **Scenario Conclusion**
The calculated t-statistic is extremely large and negative (e.g., -28.09). The corresponding p-value is effectively zero, which is less than α=0.05.

**Therefore, we reject the null hypothesis.** There is a statistically significant difference in the average completion time between Model A and Model B under these conditions.

---

## **Scenario 2: Different Sample Sizes and Equal Standard Deviations**

### **Introduction**
Here, the group sizes differ, but the variability is assumed equal. We calculate a pooled standard deviation that weights the variance of each group by its sample size.

### **Pooled Standard Deviation Formula**
![pooled-same-sd](https://www.qualitygurus.com/wp-content/uploads/2022/12/Two-sample-t-test-formulas.png)

### **Code Snippet**
``` r
mean_a = 2.3
std_a = 0.6
mean_b = 3.7
std_b = 0.6
n_a = 145
n_b = 120

# Calculate pooled standard deviation
pooled_variance = ( ( (n_a - 1) * std_a^2 ) + ( (n_b - 1) * std_b^2 ) ) / (n_a + n_b - 2)
pooled_std = sqrt(pooled_variance)

# Calculate t-statistic
standard_error = pooled_std * sqrt( (1/n_a) + (1/n_b) )
t_statistic = (mean_a - mean_b) / standard_error
t_statistic
```

### **Scenario Conclusion**
The calculated t-statistic is again extremely large and negative (e.g., -18.9). The p-value is less than α=0.05.

**Therefore, we reject the null hypothesis.** The difference in average completion times remains statistically significant when accounting for different sample sizes with equal variance.

---

## **Scenario 3: Different Sample Sizes and Different Standard Deviations (Welch's t-test)**

### **Introduction**
This is the most common and recommended scenario for real-world data, as it does not assume equal variances. We use Welch's t-test, which adjusts the degrees of freedom to account for the unequal variability.

### **Welch t-Statistic Formula**
![welch-t](https://1.bp.blogspot.com/-iNRwGLi10aE/Wp5ilbUmAwI/AAAAAAAABDg/3grcLXg1C7QU4J0gFVZZhyuQSwoczTCJgCLcBGAs/s1600/Welch%2Bt-test%2Bformula.jpg)

### **Code Snippet**
``` r
mean_a = 2.3
std_a = 0.6
mean_b = 3.7
std_b = 0.8
n_a = 145
n_b = 120

# Calculate standard error for Welch's test
se_welch = sqrt( (std_a^2 / n_a) + (std_b^2 / n_b) )

# Calculate Welch's t-statistic
t_statistic = (mean_a - mean_b) / se_welch
t_statistic
```

### **Scenario Conclusion**
Even with different standard deviations, the calculated t-statistic is large and negative (e.g., -15.83). The p-value is less than α=0.05.

**Therefore, we reject the null hypothesis.** The significant difference persists when using the more conservative Welch's test, reinforcing the result's robustness.

---

## **Scenario 4: Equal Sample Sizes and Different Standard Deviations**

### **Introduction**
This scenario tests the effect of differing variability between groups when their sizes are the same.

### **t-Statistic Formula**
![t-test-same-n-diff-sd](https://vitalflux.com/wp-content/uploads/2022/01/pooled-t-statistics-640x268.jpg)

### **Code Snippet**
``` r
mean_a = 2.3
std_a = 0.6
mean_b = 3.7
std_b = 0.8
n = 145

# Calculate standard error
standard_error = sqrt( (std_a^2 + std_b^2) / n )

# Calculate t-statistic
t_statistic = (mean_a - mean_b) / standard_error
t_statistic
```

### **Scenario Conclusion**
The calculated t-statistic remains large and negative (e.g., -16.85). The p-value is less than α=0.05.

**Therefore, we reject the null hypothesis.** The result is consistent across all tested scenarios.

---

## **Final Business Conclusion and Recommendation**

### **Summary of Findings**
Across all four statistical scenarios—varying sample sizes and standard deviations—the result was unequivocal: **we consistently reject the null hypothesis.** The average time to complete a purchase is statistically significantly different between Model A (2.3 minutes) and Model B (3.7 minutes).

### **Which Model is Better and Why?**
The data clearly indicates that **Model A is the superior model.** Users complete their purchases faster on Model A (2.3 minutes) compared to Model B (3.7 minutes). In the context of e-commerce and user experience, a shorter completion time is a key performance indicator (KPI) for a smoother, more efficient user journey. A faster process typically leads to higher conversion rates and reduced cart abandonment.

### **Business Recommendation**
Based on this rigorous analysis, the business should **not proceed with implementing Model B.** The new design appears to have introduced friction or complexity that significantly slows down users.

**The recommended course of action is:**
1.  **Retain Model A** as the primary website design.
2.  **Investigate the root cause** of the slowdown in Model B through user feedback, session recordings, or usability testing to understand what specific elements caused the increased completion time.
3.  **Iterate and Retest:** Use these insights to create a new, improved design (Model C) and run another A/B test against the current Model A.

This data-driven approach ensures that business decisions are based on statistical evidence, minimizing risk and focusing resources on changes that genuinely improve performance.

---
![Statistical Decision](https://tse3.mm.bing.net/th/id/OIP.G7ZqlKHXry4BSkQ2QvNnSwHaKA?rs=1&pid=ImgDetMain&o=7&rm=3)
