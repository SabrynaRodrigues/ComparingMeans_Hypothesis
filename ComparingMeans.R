###############################################
# Comparing Means
# 1) Case where we have same sample size 
#    and same standard deviation
#
# Model A
# - Users: 145
# - Average time: 2.3 min
# - Standard deviation: 0.6 min
#
# Model B  
# - Users: 145
# - Average time: 3.7 min
# - Standard deviation: 0.6 min
###############################################
mean_a = 2.3
std_a = 0.6

mean_b = 3.7
std_b = 0.6

samplesize= sqrt(145)

t = mean_a - mean_b
t2 = std_a / samplesize
t3 = t/t2
t3
###############################################
# 2) Case where we have different sample size 
#    and same standard deviation
#
# Model A
# - Users: 145
# - Average time: 2.3 min
# - Standard deviation: 0.6 min
#
# Model B  
# - Users: 120
# - Average time: 3.7 min
# - Standard deviation: 0.6 min
###############################################
mean_a = 2.3
std_a = 0.6

mean_b = 3.7
std_b = 0.6

samplesize_a = sqrt(145)
sample_size_b = sqrt(120)
sa = 145
sb = 120

a = sa - 1
b = std_a ** 2
c = sb - 1
d = a * b + c * b
e = sa + sb - 2
f = d/e
g = sqrt(f)
g

t = (mean_a - mean_b)
t2 = 1/sa
t3 = 1/sb
t4 = t2 + t3
t5 = sqrt(t4)
t6 = t5 * std_a
t7 = t /t6
t7
###############################################
# 3) Case where we have different sample size 
#    and different standard deviation 
#
# Model A
# - Users: 145
# - Average time: 2.3 min
# - Standard deviation: 0.6 min
#
# Model B  
# - Users: 120
# - Average time: 3.7 min
# - Standard deviation: 0.8 min
###############################################
mean_a = 2.3
std_a = 0.6

mean_b = 3.7
std_b = 0.8

samplesize_a = sqrt(145)
sample_size_b = sqrt(120)
sa = 145
sb = 120

a = std_a ** 2
b = std_b ** 2
c = (a/sa) + (b/sb) 
d = sqrt(c)

e = (mean_a - mean_b)/d 
e

###############################################
# 3) Case where we have same sample size and 
# different standard deviations
#
# Model A
# - Users: 145
# - Average time: 2.3 min
# - Standard deviation: 0.6 min
#
# Model B  
# - Users: 145
# - Average time: 3.7 min
# - Standard deviation: 0.8 min
###############################################
mean_a = 2.3
std_a = 0.6

mean_b = 3.7
std_b = 0.8

samplesize_a = sqrt(145)
sample_size_b = sqrt(120)
sa = 145


a = std_a ** 2
b = std_b ** 2
c = a + b
d = c/sa
e = sqrt(d)
f = mean_a - mean_b
t = f/e
t
