
#1a)

#read in the csv 
news_CSV = read.csv("C:/Users/pedbv9699/Documents/GitHub/ds710assignment9/new_usnews")

#attach the csv in R
attach(new_usnews)


#2a
#get rid of the > 100 plus graduation rate
Graduation.Name[which(Graduation.rate > 100)] =NA
> summary(Graduation.rate)
 
#again look at the percent of Professors or faculty with PhDs, you can't have 105%
summary(Pct.of.faculty.with.PhDs)
> summary(Pct.of.faculty.with.PhDs)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   8.00   57.00   71.00   68.65   82.00  105.00      32   
   
# everything above 100 percent is changed to NA(non applicable) because it makes no sense
Pct.of.faculty.with.PhDs[which(Pct.of.faculty.with.PhDs > 100)] = 100.
> summary(Pct.of.faculty.with.PhDs)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   8.00   57.00   71.00   68.65   82.00  105.00      32 
> Pct.of.faculty.with.PhDs[which(Pct.of.faculty.with.PhDs > 100)] = 100
> summary(Pct.of.faculty.with.PhDs)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   8.00   57.00   71.00   68.64   82.00  100.00      32 
   
   
 # a quick summary of percent who donate
> summary(Pct.alumni.who.donate)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   0.00   11.00   19.00   20.91   29.00   81.00     222 )
   
#percent who are public universities that are donated to
> public_Donations = mean(Pct.alumni.who.donate[which(Private.or.Public == 'Public')], na.rm = T)
> public_Donations
[1] 13.44944

#percent who are private universities that are donated to
> private_Donations = mean(Pct.alumni.who.donate[which(Private.or.Public == 'Private')], na.rm = T)
> private_Donations
[1] 24.58287




#H0: mu[Public_Donor] = mu[Private_Donor]
#H1: mu[public_donor != muprivate_Donor]
> t.test(Pct.alumni.who.donate ~ Private.or.Public, alternative = "two.sided")

        Welch Two Sample t-test

data:  Pct.alumni.who.donate by Private.or.Public
t = 17.3168, df = 1018.898, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
  9.871826 12.395044
sample estimates:
mean in group Private  mean in group Public 
             24.58287              13.44944 
			 

#csv 
write.csv(news_CSV, file = 'C:/Users/pedbv9699/Documents/GitHub/ds710assignment9/US_news.csv', quote = F, row.names = F)			 
			 
			 
> write.csv(news_CSV, file = 'C:/Users/pedbv9699/Documents/GitHub/ds710assignment9/US_news.csv', quote = F, row.names = F)

			 
cps_CSV = read.csv("C:/Users/pedbv9699/Documents/GitHub/ds710assignment9/cps.csv")	
		 
> cps_CSV = read.csv("C:/Users/pedbv9699/Documents/GitHub/ds710assignment9/cps.csv")
> 
> attach(cps_CSV)
> head(cps_CSV)
  wage educ race sex hispanic south married exper union age   sector
1  9.0   10    W   M       NH    NS Married    27   Not  43    const
2  5.5   12    W   M       NH    NS Married    20   Not  38    sales
3  3.8   12    W   F       NH    NS  Single     4   Not  22    sales
4 10.5   12    W   F       NH    NS Married    29   Not  47 clerical
5 15.0   12    W   M       NH    NS Married    40 Union  58    const
6  9.0   16    W   F       NH    NS Married    27   Not  49 clerical
> 			 
	
	
 > model = lm(wage~educ)
> plot(educ, wage, main = "Wages vs. Edu", xlab = "Education(Time in Years)" , ylab = "Wage($dollars)")
> abline(model,col = "green")
> legend("topleft",legend = "Linear Regression", col = "green", lwd = 1)


> par(mfrow = c(2,2))
> plot(model)
> 
 
 > log_wage = log(wage)
> plot(log_wage ~ educ, main = "Log_Wages vs. Edu", xlab = "Education(Time in Years)" , ylab = "Wage($dollars) Log")
> model = lm(log_wage~educ)
> legend("topleft",legend = "Linear Regression with Log", col = "green", lwd = 1)
> abline(model, col = "green")


(mfrow = c(2,2))
> plot(model)


> head(cps_CSV)
  wage educ race sex hispanic south married exper union age   sector
1  9.0   10    W   M       NH    NS Married    27   Not  43    const
2  5.5   12    W   M       NH    NS Married    20   Not  38    sales
3  3.8   12    W   F       NH    NS  Single     4   Not  22    sales
4 10.5   12    W   F       NH    NS Married    29   Not  47 clerical
5 15.0   12    W   M       NH    NS Married    40 Union  58    const
6  9.0   16    W   F       NH    NS Married    27   Not  49 clerical
> time = 1 / wage
> head(time)
[1] 0.11111111 0.18181818 0.26315789 0.09523810 0.06666667 0.11111111


plot(educ, time, main = "Time vs Edu", xlab = "Yeard of Edu", ylab = "Time(hr/$dollar)")




> mod = lm(time ~ educ)
> plot(educ, time, main = "Time vs Edu", xlab = "Yeard of Edu", ylab = "Time(hr/$dollar)")
> abline(mod, col = "orange")
> legend("topleft",legend = "Linear Regression", col = "orange", lwd = 1)
> 

