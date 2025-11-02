# Hypothesis Testing in R | Comparing Two Means

![Capa](https://i.pinimg.com/1200x/39/4b/84/394b8480a444e9454d6202cfdafeef45.jpg)

## Introduction

This project analyzes whether two different website designs (Model A and
Model B) result in different average times to complete a purchase.\
We simulate an A/B test using fictional data and evaluate multiple
scenarios using t-tests under different assumptions:

-   Equal sample sizes and equal standard deviations\
-   Different sample sizes and equal standard deviations\
-   Different sample sizes and different standard deviations\
-   Equal sample sizes and different standard deviations

Each section contains a short explanation, formula image placeholder,
and the corresponding R code.

------------------------------------------------------------------------

# Scenario 1 | Same Sample Size and Same Standard Deviation

## Formula Introduction

When both groups have the same number of observations and the same
standard deviation, the t-statistic is computed using the pooled
standard deviation and a simplified denominator.

## t-Statistic Formula

![t-test-equal](https://th.bing.com/th/id/R.9fca7ea06d32f576ef7dee69b7c85f85?rik=R1heaAHAUsF2OA&pid=ImgRaw&r=0)

## Code Snippet

``` r
mean_a = 2.3
std_a = 0.6

mean_b = 3.7
std_b = 0.6

samplesize = sqrt(145)

t = mean_a - mean_b
t2 = std_a / samplesize
t3 = t / t2
t3
```

------------------------------------------------------------------------

# Scenario 2 | Different Sample Sizes and Same Standard Deviation

## Formula Introduction

When sample sizes differ but standard deviations are equal, we use the
pooled variance adjusted for different group sizes. The pooled variance
becomes part of the t-test denominator.

## Pooled Standard Deviation Formula

![pooled-same-sd](https://www.qualitygurus.com/wp-content/uploads/2022/12/Two-sample-t-test-formulas.png)

## t-Statistic Formula

![t-test-diff-n-equal-sd](https://vitalflux.com/wp-content/uploads/2022/01/t-statistics-given-the-population-standard-deviations-are-unequal-640x179.jpg)

## Code Snippet

``` r
mean_a = 2.3
std_a = 0.6

mean_b = 3.7
std_b = 0.6

sa = 145
sb = 120

a = sa - 1
b = std_a ** 2
c = sb - 1
d = a * b + c * b
e = sa + sb - 2
f = d / e
g = sqrt(f)
g
```

------------------------------------------------------------------------

# Scenario 3 | Different Sample Sizes and Different Standard Deviations

## Welch's t-test

## Formula Introduction

When both sample size and variability differ, we use Welch's t-test,
which does not assume equal variances.

## Welch t-Statistic

![welch-t](https://1.bp.blogspot.com/-iNRwGLi10aE/Wp5ilbUmAwI/AAAAAAAABDg/3grcLXg1C7QU4J0gFVZZhyuQSwoczTCJgCLcBGAs/s1600/Welch%2Bt-test%2Bformula.jpg)

## Code Snippet

``` r
mean_a = 2.3
std_a = 0.6

mean_b = 3.7
std_b = 0.8

sa = 145
sb = 120

a = std_a ** 2
b = std_b ** 2

c = (a/sa) + (b/sb)
d = sqrt(c)

e = (mean_a - mean_b) / d
```

------------------------------------------------------------------------

# Scenario 4 | Same Sample Size and Different Standard Deviations

## Formula Introduction

When sample sizes are equal but standard deviations differ, we compute
the denominator using the sum of variances divided by the sample size.

## t-Statistic Formula

![t-test-same-n-diff-sd](https://vitalflux.com/wp-content/uploads/2022/01/pooled-t-statistics-640x268.jpg)

## Code Snippet

``` r
mean_a = 2.3
std_a = 0.6

mean_b = 3.7
std_b = 0.8

sa = 145

a = std_a ** 2
b = std_b ** 2
c = a + b
d = c / sa
e = sqrt(d)
f = mean_a - mean_b
t = f / e
t
```

------------------------------------------------------------------------

# Hypotheses Used in All Tests

## Null Hypothesis (H₀)

μₐ = μ_b\
The average completion times are equal.

## Alternative Hypothesis (H₁)

μₐ ≠ μ_b\
The average completion times are different.

------------------------------------------------------------------------

# Conclusion

Across all scenarios, the t-values indicate a strong difference between
the two designs:

-   Model A: faster (2.3 min)\
-   Model B: slower (3.7 min)

This suggests that the redesign increased the time required to complete
a purchase.

------------------------------------------------------------------------
