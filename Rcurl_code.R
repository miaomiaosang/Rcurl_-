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

//发动机产量
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A02083P%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
write(url,"C://Users/elizabeth/Documents/A02083P.txt")

engine<-"zb.A02083P01_sj."
end_point<-"dotcount"
发动机产量<-1.1

material_start_index<-regexpr(engine,url)
end_index<-regexpr(end_point,url)

data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
发动机产量<-temp

i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2

while(i>0) 
{
  material_start_index<-regexpr(engine,url)
  end_index<-regexpr(end_point,url)
  data_single<-substr(url,material_start_index,end_index) 
  temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
  发动机产量<-c(发动机产量,temp)
  url<-substr(url,end_index+5,nchar(url))
  i<-i-1
}

//货物周转量
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A1702%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
write(url,"C://Users/elizabeth/Documents/A1702.txt")

good_turnover<-"zb.A170201_sj."
end_point<-"dotcount"
货物周转量<-1.1

material_start_index<-regexpr(good_turnover,url)
end_index<-regexpr(end_point,url)

data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,38,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
货物周转量<-temp

i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2

while(i>0) 
{
  material_start_index<-regexpr(good_turnover,url)
  end_index<-regexpr(end_point,url)
  data_single<-substr(url,material_start_index,end_index) 
  temp<-as.numeric(substr(data_single,38,nchar(data_single)-3))
  货物周转量<-c(货物周转量,temp)
  url<-substr(url,end_index+5,nchar(url))
  i<-i-1
}

//焦炭产量
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A03010F%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
write(url,"C://Users/elizabeth/Documents/A03010F.txt")

coal<-"zb.A03010F01_sj."
end_point<-"dotcount"
焦炭产量<-1.1

material_start_index<-regexpr(coal,url)
end_index<-regexpr(end_point,url)

data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
焦炭产量<-temp

i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2

while(i>0) 
{
  material_start_index<-regexpr(coal,url)
  end_index<-regexpr(end_point,url)
  data_single<-substr(url,material_start_index,end_index) 
  temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
  焦炭产量<-c(焦炭产量,temp)
  url<-substr(url,end_index+5,nchar(url))
  i<-i-1
}

//汽油产量
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A030107%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
write(url,"C://Users/elizabeth/Documents/A030107.txt")

gasoline<-"zb.A03010701_sj."
end_point<-"dotcount"
汽油产量<-1.1

material_start_index<-regexpr(gasoline,url)
end_index<-regexpr(end_point,url)

data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
汽油产量<-temp

i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2

while(i>0) 
{
  material_start_index<-regexpr(gasoline,url)
  end_index<-regexpr(end_point,url)
  data_single<-substr(url,material_start_index,end_index) 
  temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
  汽油产量<-c(汽油产量,temp)
  url<-substr(url,end_index+5,nchar(url))
  i<-i-1
}

//十种有色金属
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A02083F%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
write(url,"C://Users/elizabeth/Documents/A02083F.txt")

colorful_metal<-"zb.A02083F01_sj."
end_point<-"dotcount"
十种有色金属产量<-1.1

material_start_index<-regexpr(colorful_metal,url)
end_index<-regexpr(end_point,url)

data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
十种有色金属产量<-temp

i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2

while(i>0) 
{
  material_start_index<-regexpr(colorful_metal,url)
  end_index<-regexpr(end_point,url)
  data_single<-substr(url,material_start_index,end_index) 
  temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
  十种有色金属产量<-c(十种有色金属产量,temp)
  url<-substr(url,end_index+5,nchar(url))
  i<-i-1
}

//天然原油产量
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A030102%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
write(url,"C://Users/elizabeth/Documents/A030102.txt")

crude_gas<-"zb.A03010201_sj."
end_point<-"dotcount"
天然原油产量<-1.1

material_start_index<-regexpr(crude_gas,url)
end_index<-regexpr(end_point,url)

data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
天然原油产量<-temp

i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2

while(i>0) 
{
  material_start_index<-regexpr(crude_gas,url)
  end_index<-regexpr(end_point,url)
  data_single<-substr(url,material_start_index,end_index) 
  temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
  天然原油产量<-c(天然原油产量,temp)
  url<-substr(url,end_index+5,nchar(url))
  i<-i-1
}

//铁路货运量
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A1701%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
train_goods<-"zb.A170105_sj."
material_start_index<-regexpr(train_goods,url)
url<-substr(url,material_start_index,nchar(url))
铁路货运量<-1.1
material_start_index<-regexpr(train_goods,url)
end_index<-regexpr(end_point,url)
data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,38,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
铁路货运量<-temp
i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2
while(i>0)
{
material_start_index<-regexpr(train_goods,url)
end_index<-regexpr(end_point,url)
data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,38,nchar(data_single)-3))
铁路货运量<-c(铁路货运量,temp)
url<-substr(url,end_index+5,nchar(url))
i<-i-1
}

//铁路客运量
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A1703%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
train_customers<-"zb.A170305_sj."
material_start_index<-regexpr(train_customers,url)
url<-substr(url,material_start_index,nchar(url))
铁路客运量<-1.1
material_start_index<-regexpr(train_customers,url)
end_index<-regexpr(end_point,url)
data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,38,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
铁路客运量<-temp
i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2
while(i>0)
{
material_start_index<-regexpr(train_customers,url)
end_index<-regexpr(end_point,url)
data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,38,nchar(data_single)-3))
铁路客运量<-c(铁路客运量,temp)
url<-substr(url,end_index+5,nchar(url))
i<-i-1
}

//采购经理人指数
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A1901%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
write(url,"C://Users/elizabeth/Documents/A1901.txt")
PMI<-"zb.A190101_sj."
end_point<-"dotcount"
采购经理人指数<-1.1

material_start_index<-regexpr(PMI,url)
end_index<-regexpr(end_point,url)

data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,38,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
采购经理人指数<-temp

i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2

while(i>0) 
{
  material_start_index<-regexpr(PMI,url)
  end_index<-regexpr(end_point,url)
  data_single<-substr(url,material_start_index,end_index) 
  temp<-as.numeric(substr(data_single,38,nchar(data_single)-3))
  采购经理人指数<-c(采购经理人指数,temp)
  url<-substr(url,end_index+5,nchar(url))
  i<-i-1
}

//中型拖拉机产量
xpath="http://data.stats.gov.cn/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22sj%22%2C%22valuecode%22%3A%222013-%22%7D%2C%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22A020841%22%7D%5D&k1=1472670084714"
url=getURL(xpath,httpheader=myheader)
write(url,"C://Users/elizabeth/Documents/A020841.txt")
source_start<-regexpr("code",url)
souecr_end<-regexpr("wdnodes",url)
mid_tractor<-"zb.A02084101_sj."
end_point<-"dotcount"

material_start_index<-regexpr(mid_tractor,url)
end_index<-regexpr(end_point,url)

data_single<-substr(url,material_start_index,end_index)
temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
url<-substr(url,end_index+5,nchar(url))
中型拖拉机产量<-temp

i<-(year(Sys.Date())-2013)*12+month(Sys.Date())-2

while(i>0) 
{
  material_start_index<-regexpr(mid_tractor,url)
  end_index<-regexpr(end_point,url)
  data_single<-substr(url,material_start_index,end_index) 
  temp<-as.numeric(substr(data_single,40,nchar(data_single)-3))
  中型拖拉机产量<-c(中型拖拉机产量,temp)
  url<-substr(url,end_index+5,nchar(url))
  i<-i-1
}
