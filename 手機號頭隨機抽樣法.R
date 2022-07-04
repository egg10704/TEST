library("readxl")
library("stringr")

##NCC公布手機前五碼資料讀取
data<-read_excel(":/行動電話號頭.xlsx")
a<-as.matrix(data)
b<-a[,1]
##資料筆數設定隨機產生四千筆
c<-sample(b,size=40000,replace=T)
c<-as.matrix(c)
##手機後五碼
x<-as.matrix(sample(0:99999,length(c) , replace=TRUE))
y <- as.matrix(str_pad( x, width = 5, pad = 0))
z <- cbind(as.character(c),as.character(y))
A<-list(paste(as.character(c),as.character(y)))
##寫成CSV以利SQL讀取
write.table(A,file=":/手機抽樣.csv",sep=",",row.names=F,col.names=F, na = "NA")

