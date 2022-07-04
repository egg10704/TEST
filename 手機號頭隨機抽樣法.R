library("readxl")
library("stringr")

'-----號頭資料筆數設定-----------'

data<-read_excel("T:/Public (WINDOWS-4E2081D)/電話資料庫/手機電話資料庫/@抽樣系統/1100512data.xlsx")
a<-as.matrix(data)
b<-a[,1]
c<-sample(b,size=40000,replace=T)
c<-as.matrix(c)
'-----後5碼-----------'
x<-as.matrix(sample(0:99999,length(c) , replace=TRUE))
y <- as.matrix(str_pad( x, width = 5, pad = 0))
z <- cbind(as.character(c),as.character(y))
A<-list(paste(as.character(c),as.character(y)))
write.table(A,file="T:/Public (WINDOWS-4E2081D)/Survey/中央健康保險署/111年運用資料治理建置健保政策應用及監測模式/第一次即時民調/TEL/手機/手機抽樣.csv",sep=",",row.names=F,col.names=F, na = "NA")

