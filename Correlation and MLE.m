% Calculate Pearson Correlation for Gaussian Copula
% Convert to uniform data, the 5 Us are so called pseudo sample
u1 = ksdensity(streturns.GOOG, streturns.GOOG, Function="cdf", bandwidth=1.e-3);
u2 = ksdensity(streturns.AMZN, streturns.AMZN, Function="cdf", bandwidth=1.e-3);
u3 = ksdensity(streturns.MSFT, streturns.MSFT, Function="cdf", bandwidth=1.e-3);
u4 = ksdensity(streturns.AAPL, streturns.AAPL, Function="cdf", bandwidth=1.e-3);
u5 = ksdensity(streturns.NFLX, streturns.NFLX, Function="cdf", bandwidth=1.e-3);
figure;
histogram(u1)
histogram(u2)
histogram(u3)
histogram(u4)
histogram(u5)
% Scatter & histogram (scatterhist) can also be ploted 
% Apply Inverse Normal CDF
% Null hypothesis of K-S: the data in vector x comes from a standard normal distribution
n1 = norminv(u1);
figure
histogram(n1)
n1_t = kstest(n1);
n1_t;
n2 = norminv(u2);
figure
histogram(n2)
n2_t = kstest(n2);
n2_t;
n3 = norminv(u3);
figure
histogram(n3)
n3_t = kstest(n3);
n3_t;
n4 = norminv(u4);
figure
histogram(n4)
n4_t = kstest(n4);
n4_t;
n5 = norminv(u5);
figure
histogram(n5)
n5_t = kstest(n5);
n5_t;
They are now all normal

Z = [n1, n2, n3, n4, n5]; 
corr_pearson = corr(Z, type="Pearson"); % Pearson
corr_pearson;
St_r = [streturns.GOOG, streturns.AMZN, streturns.MSFT, streturns.AAPL, streturns.NFLX];
corr_kendall = corr(St_r, type="Kendall");
corr_kendall_l = sin(pi/2.*corr_kendall); % convert to linear

[rho, nu] = copulafit("t", [u1, u2, u3, u4, u5], 'Method','ML'); % use maximum likelihood to estimate degree of freedom









