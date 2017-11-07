?read.table
read.table
read.table

x<-3
x

#plot(seq(50,100,by=5))

y<-c("A",1:10)
y
summary(
)
summary(y)
str(y)
head(y)
prec_avg<-c(56,46,50,53,69,83,83,80,62,55,60,63)
?c
plot(prec_avg)
prec<-plot (prec_avg,
      pch=19,
      #point type
      cex=2 ,
      #magnify symbols and text
      col="#00ff0060" ,
      #html colour code with translucency in last 2 digits
)
lines(lowess(prec,f=.2)) #line connecting

# install.packages("raster")
#package have been installed
library("raster")


#precipitation in germany, example
germany<- getData("GADM",country="DEU",level=2) #get country borders, other country codes can be found in manual
plot (germany) #plot germany boundaries
prec<-getData("worldclim",var="prec",res=.5,lon=10,lat=51) # get prec data, lon/lat only needed for res=.5
#lon/lat to reduce size of data obtained, else whole world's data will be downloaded
plot(prec) #plot precipitation
germany_st<-getData("GADM",country="DEU",level=1) #get Germany with states
plot(germany_st)
#try to extract bavaria polygon
list(germany_st)
plot(germany_st$polygon)
germany.by <- germany_st[2,1:13] #how to extract? is it in an array? what is an array in R?
plot(germany.by)

prec_ger1<-crop(prec,germany.by) #crop prec to extent of germany
spplot(prec_ger1) #plot 

prec_ger2<-mask(prec_ger1,germany.by) #mask prec to shape of germany
spplot(prec_ger2) #plot
?getData

prec_ger.by1<-crop(prec,germany.by) #crop prec to extent of germany
spplot(prec_ger.by1) #plot 

prec_ger.by2<-mask(prec_ger1,germany.by) #mask prec to shape of germany
spplot(prec_ger.by2) #plot

## R Markdown
#install.packages("rmarkdown")
#package has been installed
library(rmarkdown)

'''{r echo=TRUE,eval=FALSE}
plot(runif(100))
'''
#to make the code run as a chunk, ''' are chunk delimiters, open and end

#install.packages("ggplot2")
#package already installed
library(ggplot2)

ggplot(mpg,aes(x=displ))+
  geom_histogram()
#geom is the geometric options
?help.search()
#explore functions in a package
?ggplot

#bitbucket, from https://bitbucket.org/EAGLE_MSc/steigerwald
#install.packages("devtools")
#package have been installed
library(devtools)
#install_bitbucket("EAGLE_MSc/Steigerwald", build_vignettes = TRUE)
#bitbucket installed
library(st.data)
data("bio_data")
bio_data

#refer to slide
x11() #function creates plots as pop ups
x<-data.frame(x=1,y=1,label="ggplot2 introuction \n@ Eagle")

#using mpg data for fuel economy of car models
head(mpg)
#simple dot plot
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()
#adding info
ggplot(mpg,aes(displ,cty,colour=class))+
  geom_point()
#faceting
#if "+" sign is at the start of code instead of end, will affect code??
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  facet_wrap(~class)+ geom_smooth()
#+ geom_smooth() will add average + sd??
#adding several geom attributes
car.hwy<-ggplot(mpg, aes(class, displ))+
  geom_boxplot(alpha=.5)+
  geom_point(aes(color=hwy), alpha=.7, size=1.5, position=position_jitter(width=.25,height=0))
#unable to run x11() for car.hwy. to troubleshoot 