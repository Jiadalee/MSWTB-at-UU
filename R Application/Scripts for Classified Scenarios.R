#Scenarios 1,2.3
C1 <- read.csv('C:/Users/user/Desktop/combination1.csv')

names(C1) <- c("Time","MFlow","Mflow","MVolume","EFlow","Eflow","EVolume")

library(ggplot2)

l <- ggplot(data = C1)+geom_line(aes(x=Time,y=MFlow,color="MFlow"))+geom_line(aes(x=Time,y=EFlow,color="EFlow"))

l <- l+labs(title="Flow Rate on Scenarios 1,2,3", x="Time/s", y="Flow Rate/(L/m)")

print(l)

#Scenarios 4,5,6
C2 <- read.csv('C:/Users/user/Desktop/combination2.csv')

names(C2) <- c("Time","MFlow","Mflow","MVolume","EFlow","Eflow","EVolume")

library(ggplot2)

m <- ggplot(data = C2)+geom_line(aes(x=Time,y=MFlow,color="MFlow"))+geom_line(aes(x=Time,y=EFlow,color="EFlow"))

m <- m+labs(title="Flow Rate on Scenarios 4,5,6", x="Time/s", y="Flow Rate/(L/m)")

print(m)

#Scenarios 7,8,9
C3 <- read.csv('C:/Users/user/Desktop/combination3.csv')

names(C3) <- c("Time","MFlow","Mflow","MVolume","EFlow","Eflow","EVolume")

library(ggplot2)

n <- ggplot(data = C3)+geom_line(aes(x=Time,y=MFlow,color="MFlow"))+geom_line(aes(x=Time,y=EFlow,color="EFlow"))

n <- n+labs(title="Flow Rate on Scenarios 7,8,9", x="Time/s", y="Flow Rate/(L/m)")

print(n)
