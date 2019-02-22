
#Load RMySQL package
library(RMySQL)

d <- dbDriver("MySQL")

#Conect R with MySQL
con <- dbConnect(d,user='root',password='kd542507',host='localhost')

#Ask the permission for using hydroclass odm
sqlstmtdb <- dbSendQuery(con,"Use hydroclass;")

#query SQL temp data from Loganriver near Tony Grove
sqlstmt1 <- dbSendQuery(con, "SELECT DateTime, DataValue FROM DataValues 
                        WHERE 
                        Sites_SiteID2 = 1 AND 
                        variables_VariableID =1 AND DataValue <> -9999 
                        ORDER BY DateTime" )
#Use dbFetch functions to execute SQL queries and return results
Mflow <- dbFetch(sqlstmt1, n=-1)

names(Mflow) <- c("time","Mflow")

sqlstmt2 <- dbSendQuery(con, "SELECT DateTime, DataValue FROM DataValues 
                        WHERE 
                        Sites_SiteID2 = 1 AND 
                        variables_VariableID = 2 AND DataValue <> -9999 
                        ORDER BY DateTime" )
Eflow <- dbFetch(sqlstmt2, n=-1)

names(Eflow) <- c("time","Eflow")


Series <- merge(Mflow,Eflow,by="time")


library(ggplot2)

m <- ggplot(data = Series)+geom_point(aes(x=time,y=Mflow,color="Mflow"))+geom_point(aes(x=time,y=Eflow,color="Eflow"))

m <- m+labs(title="Flow Rate on all Scenarios ", x="Time/s", y="Flow Rate/(L/m)")

print(m)
