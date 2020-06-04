library(tidycensus)
library(plotly)

county18<-get_acs("county",survey = "acs1", key = "993d02931a941bd1f5af535c637800916aa504b2",variables=c("B28002_001","B28002_013","S1701_C03_002"))

cty18_wide<-data.frame(county18$GEOID[county18$variable=="B28002_001"],
                       county18$NAME[county18$variable=="B28002_001"],
                       county18$estimate[county18$variable=="B28002_001"],
                       county18$estimate[county18$variable=="B28002_013"],
                       county18$estimate[county18$variable=="S1701_C03_002"])

names(cty18_wide)<-c("GEOID","NAME","TOTPOP","NOINT","POVPCT")

cty18_wide$INTPCT<- with(cty18_wide,round((1-(NOINT/TOTPOP))*100,1))


plot_ly(x=cty18_wide$POVPCT,y=cty18_wide$INTPCT, type='scatter',mode='marker')                 
                 