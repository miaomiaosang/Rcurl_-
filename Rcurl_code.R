library(RCurl)
library(lubridate)
myheader<-c("User-Agent"="Mozilla/5.0 (Windows NT 6.1; rv:47.0) Gecko/20100101 Firefox/47.0","Accept"="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8","Accetp-Language"="zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3","Accept-Encoding"="gzip, deflate","Connection"="keep-alive")

//大型拖拉机
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A020840%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
write(url,"C://Users/elizabeth/Documents/A020840.txt")
source_start<-regexpr("code",url)
souecr_end<-regexpr("wdnodes",url)
big_tractor<-"zb.A02084001_sj."
end_point<-"dotcount"

material_start_index<-regexpr(big_tractor,url)
end_index<-regexpr(end_point,url)

data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
大型拖拉机产量<-temp

i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2

while(i>0) 
{
  material_start_index<-regexpr(big_tractor,url)
  end_index<-regexpr(end_point,url)
  data_single<-substr(url,material_start_index,end_index) 
  temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
  大型拖拉机产量<-c(大型拖拉机产量,temp)
  url<-substr(url,end_index+5,nchar(url))
  i<-i-1
}

//发电量
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A03010G%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
write(url,"C://Users/elizabeth/Documents/A03010G.txt")

electricity<-"zb.A03010G01_sj."
end_point<-"dotcount"
发电量<-1.1

material_start_index<-regexpr(electricity,url)
end_index<-regexpr(end_point,url)

data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
发电量<-temp

i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2

while(i>0) 
{
  material_start_index<-regexpr(electricity,url)
  end_index<-regexpr(end_point,url)
  data_single<-substr(url,material_start_index,end_index) 
  temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
  发电量<-c(发电量,temp)
  url<-substr(url,end_index+5,nchar(url))
  i<-i-1
}

