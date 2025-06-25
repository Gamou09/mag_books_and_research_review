### install the needed package

# Main package : ASTSA
# There is an R package for the text called astsa 
# (Applied Statistical Time Series Analysis)
# install.packages("astsa")

# other packages
# the Technical Trading Rules (TTR) package to download the data from YahooTM 
install.packages("TTR")

# Load the package
library(astsa)

# script
# If you create a .First function as follows, .First
# and save the workspace when you quit, 
# astsa will be loaded at every start until you change .First.
.First <- function(){library(astsa)}

# Data sets in package ‘astsa’:
# data()

# help for R package
# ?plot
# help(plot)
# ?data

### Chapters 1
# Example 1.1 Johnson & Johnson Quarterly Earnings
plot(jj, type="o", ylab="Quarterly Earnings per Share")

# Example 1.2 Global Warming
plot(gtemp_both, type="o", ylab="Global Temperature Deviations")

# Example 1.3 Speech Data
plot(speech)

# Example 1.4 Dow Jones Industrial Average
# option 1 of having the data
library(TTR)
# djia = getYahooData("^DJI", start=20060420, end=20160420, freq="daily") 
# TTR::getYahooData is deprecated and will be removed in a future release.
# Please use quantmod::getSymbols instead.
library(quantmod)
getSymbols("^DJI", start=20060420, end=20160420, freq="daily") 
djiar = diff(log(DJI$DJI.Close))[-1] # approximate returns
plot(djiar, main="DJIA Returns", type="n")
lines(djiar)

# option 2 : data is also available in astsa
library(xts)
djiar_v2 = diff(log(djia$Close))[-1] # approximate returns
plot(djiar_v2, main="DJIA Returns", type="n")
lines(djiar_v2)

# Example 1.5 El Niño and Fish Population
par(mfrow = c(2,1)) # set up the graphics
plot(soi, ylab="", xlab="", main="Southern Oscillation Index") 
plot(rec, ylab="", xlab="", main="Recruitment")

# Example 1.6 fMRI Imaging
par(mfrow=c(2,1))
ts.plot(fmri1[,2:5], col=1:4, ylab="BOLD", main="Cortex") 
ts.plot(fmri1[,6:9], col=1:4, ylab="BOLD", main="Thalamus & Cerebellum")

# Example 1.7 Earthquakes and Explosions
par(mfrow=c(2,1))
plot(EQ5, main="Earthquake")
plot(EXP6, main="Explosion")

# Example 1.8 Gaussian White Noise (3 Flavors)
# option 1 - basic function
# link --> https://www.geo.fu-berlin.de/en/v/soga-r/Advances-statistics/Time-series-analysis/Time-series-statistical-models/White-noise-models/index.html#:~:text=We%20may%20easily%20generate%20a,using%20the%20rnorm()%20function.&text=Let%20us%20plot%20the%20correlogram,provided%20by%20the%20ggfortify%20package.
par(mfrow=c(3,1))
w <- rnorm(n = 100, mean = 0, sd = 1)
plot.ts(w, main = "Gaussian white noise series")
w <- rnorm(n = 100, mean = 0, sd = 1)
plot.ts(w, main = "Gaussian white noise series")
w <- rnorm(n = 100, mean = 0, sd = 1)
plot.ts(w, main = "Gaussian white noise series")

# option 2 - with ARIMA function
# link --> https://financetrain.com/simulate-white-noise-wn-in-r
# we use the knowledge of the ARIMA(p,i,q) model - all to zero we are left 
# with white noise
par(mfrow=c(2,1))

WN <- arima.sim(model = list(order = c(0, 0, 0)), n = 200)
plot.ts(WN,col=4, main="White Noise Series")
arima(WN, order = c(0, 0, 0)) # model fitting

WN_2 <- arima.sim(model = list(order = c(0, 0, 0)), n = 200, mean=50, sd=10)
plot.ts(WN_2,col=4, main="White Noise Series (mean=50, sd=10)")

# Example 1.9 Moving Averages and Filtering
# A linear combination of values in a time series is referred to, generically
# as a filtered series
w = rnorm(500,0,1) # 500 N(0,1) variates 
v = filter(w, sides=2, filter=rep(1/3,3)) # moving average par(mfrow=c(2,1))
plot.ts(w, main="white noise")
plot.ts(v, ylim=c(-3,3), main="moving average")

# Example 1.10 Autoregressions
# As in the previous example, the data are obtained by a filter of white noise. 
# The function filter uses zeros for the initial value
# n this case, x1 = w1, and x2 =x1+w2 =w1+w2,
# and soon,so that the values do not satisfy
# An easy fix is to run the filter for longer than needed 
# and remove the initial values.
w = rnorm(550,0,1) # 50 extra to avoid startup problems 
x = filter(w, filter=c(1,-.9), method="recursive")[-(1:50)] # remove first 50 
plot.ts(x, main="autoregression")

# Example 1.11 Random Walk with Drift
# form one: x_t = δ + x_t_minus_1 + w_t
# form two after induction: x_t = δ*t + sigma of W from 0 to t
# The term random walk comes from the fact that, when δ = 0, 
# the value of the time series at time t is the value of the series at time t − 1 
# plus a completely random movement determined by wt
set.seed(154) # so you can reproduce the results
w = rnorm(200); x = cumsum(w) # two commands in one line
wd = w +.2
xd = cumsum(wd)
plot.ts(xd, ylim=c(-5,55), main="random walk", ylab='')
lines(x, col=4); abline(h=0, col=4, lty=2); abline(a=0, b=.2, lty=2)

# Example 1.12 Signal in Noise
# The he ratio of the amplitude of the signal to σw (or some function of the ratio) 
# is sometimes called the signal-to-noise ratio (SNR); 
# the larger the SNR, the easier it is to detect the signal.
cs = 2*cos(2*pi*1:500/50 + .6*pi) # 1:500 produce a vector of 1 to 500
w = rnorm(500,0,1)
par(mfrow=c(3,1), mar=c(3,2,2,1), cex.main=1.5)
plot.ts(cs, main=expression(2*cos(2*pi*t/50+.6*pi)))
plot.ts(cs+w, main=expression(2*cos(2*pi*t/50+.6*pi) + N(0,1)))
plot.ts(cs+50*w, main=expression(2*cos(2*pi*t/50+.6*pi) + N(0,25)))

# Example 1.24 Prediction Using Cross-Correlation
x = rnorm(100)
y = lag(x, -5) + rnorm(100)
ccf(y, x, ylab='CCovF', type='covariance')

# Example 1.25 Sample ACF and Scatterplots
(r = round(acf(soi, 6, plot=TRUE)$acf[-1], 3)) 
# first 6 sample acf values [1] 0.604 0.374 0.214 0.050 -0.107 -0.187
par(mfrow=c(3,2))
plot(lag(soi,-1), soi)
legend('topleft', legend=r[1]) 
plot(lag(soi,-6), soi)
legend('topleft', legend=r[6])
plot(lag(soi,-2), soi)
legend('topleft', legend=r[2])
plot(lag(soi,-5), soi)
legend('topleft', legend=r[5])
plot(lag(soi,-3), soi)
legend('topleft', legend=r[3])
plot(lag(soi,-4), soi)
legend('topleft', legend=r[4])

# Example 1.26 A Simulated Time Series
par()
set.seed(10101)
x1 = 2*rbinom(11, 1, .5) - 1 # simulated sequence of coin tosses
x2 = 2*rbinom(101, 1, .5) - 1
y1 = 5 + filter(x1, sides=1, filter=c(1,-.7))[-1]
y2 = 5 + filter(x2, sides=1, filter=c(1,-.7))[-1]
# plot both series (not shown) 
c(mean(y1), mean(y2)) # the sample means
plot.ts(y1, type='s'); 
plot.ts(y2, type='s') 
acf(y1, lag.max=4, plot=FALSE) # 1/ 10 = .32
acf(y2, lag.max=4, plot=FALSE) # 1/ 100 = .1 

# Example 1.27 ACF of a Speech Signal
acf(speech, 250)

# Example1.28 SOIandRecruitmentCorrelationAnalysis
par(mfrow=c(3,1))
acf(soi, 48, main="Southern Oscillation Index")
acf(rec, 48, main="Recruitment")
ccf(soi, rec, 48, main="SOI vs Recruitment", ylab="CCF")

# Example1.29 PrewhiteningandCrossCorrelationAnalysis
set.seed(1492)
num=120; t=1:num
X = ts(2*cos(2*pi*t/12) + rnorm(num), freq=12)
Y = ts(2*cos(2*pi*(t+5)/12) + rnorm(num), freq=12)
Yw = resid( lm(Y~ cos(2*pi*t/12) + sin(2*pi*t/12), na.action=NULL) ) 
par(mfrow=c(3,2), mgp=c(1.6,.6,0), mar=c(3,3,1,1) )

plot(X)
plot(Y)
acf(X,48, ylab='ACF(X)')
acf(Y,48, ylab='ACF(Y)')
ccf(X,Y,24, ylab='CCF(X,Y)')
ccf(X,Yw,24, ylab='CCF(X,Yw)', ylim=c(-.6,.6))

# Example 1.30 Soil Surface Temperatures
par()
persp(1:64, 1:36, soiltemp, phi=25, theta=25, scale=FALSE, expand=4, 
      ticktype="detailed", xlab="rows", ylab="cols", zlab="temperature")
plot.ts(rowMeans(soiltemp), xlab="row", ylab="Average Temperature")

# Example 1.31 Sample ACF of the Soil Temperature Series
fs = Mod(fft(soiltemp-mean(soiltemp)))^2/(64*36)
cs = Re(fft(fs, inverse=TRUE)/sqrt(64*36))  # ACovF
rs = cs/cs[1,1]                             # ACF
rs2 = cbind(rs[1:41,21:2], rs[1:41,1:21])
rs3 = rbind(rs2[41:2,], rs2)
par(mar = c(1,2.5,0,0)+.1)
persp(-40:40, -20:20, rs3, phi=30, theta=30, expand=30, scale="FALSE",
      ticktype="detailed", xlab="row lags", ylab="column lags",
      zlab="ACF")

# Problem of chqpter 1

# Answer for Pb 1.1
plot(EQ5, type="l", col=2)
lines(EXP6, cex = .5, col = 3)
legend("topleft", c('EQ5', 'EXP6'), col = 2:3, lty = 1,cex = 0.9)

# Answer for Pb 1.2
# 1.2 - a
set.seed(42)
s = c(rep(0,100), 10*exp(-(1:300)/20)*cos(2*pi*1:300/4))
x = s + rnorm(400)
plot.ts(x)
# 1.2 - b
u = c(rep(0,100), 10*exp(-(1:300)/200)*cos(2*pi*1:300/4))
y = u + rnorm(400)
plot.ts(y)
# 1.2 - c
plot.ts(s, col= 1, cex=4)
lines(u, col= 2)

# Answer for Pb 1.3
# 1.3 - a
w = rnorm(100)
x = filter(w, filter=c(0,-0.9), method="recursive")
v = filter(x, rep(1/4, 4), sides = 1)
plot.ts(x, main="autoregression")
lines(v, col=2)
line(w, col=3)
legend('topleft', c("x", "v", "w"), lty=1, col=1:3)
# 1.3 - a
w = rnorm(100)
x = cos(2*pi*1:100/4) + w
v = filter(x, rep(1/4, 4), sides = 1)
plot.ts(x, main="autoregression")
lines(v, col=2)
lines(w, col=3)
legend('topleft', c("x", "v", "w"), lty=1, col=1:3)
