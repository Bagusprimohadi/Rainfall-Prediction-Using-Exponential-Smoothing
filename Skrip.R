lap1 = Data
lap2 = ts(lap1, start=c(1991,1), end=c(2020,12), frequency=12)
lap2

ts.plot(lap2)

lapfore2 = HoltWinters(lap2, alpha=NULL, beta=NULL, gamma=NULL,
                       seasonal = c("additive"))
lapfore2
lapfore2$SSE
op = par(mfrow=c(1,1))
plot(lapfore2, main="Grafik Model Curah Hujan Holt-Winter dan Observasi 1991-2020",
     xlab="Waktu", ylab="Curah Hujan mm/bulan")
legend("bottomright", 
       legend=c("Actual", "Prediksi"), 
       bty="n",
       col=c("black", "red"),
       lty=1, lwd=2)
predict=predict(lapfore2, n.ahead = 12)
predict
plot(predict, 
     main="Prediksi Curah Hujan Bulanan 2021",
     xlab="waktu", ylab="Curah Hujan mm/bulan")
legend("bottomright", 
       legend=c("Prediksi"), 
       bty="n",
       col=c("black"),
       lty=1, lwd=2)
par(op)

res=residuals(lapfore2)
plot(res)

write.table(lapfore2[["fitted"]], "D:/mydata.txt", sep="\t") 
