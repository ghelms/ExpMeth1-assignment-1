#Exercise 1
navn <- c("Andrea","Helle","Maria","Anna","Gustav")
søskende <- c(1,2,0,1,3)
søskende+2
sum(søskende)
søskende[5]*søskende[2]

#Exercise 2
#Create a dataframe with previous two vectors
Studiegruppe <- data.frame(navn,søskende)

#Adding "køn" to the dataframe "Studiegruppe"
køn <- c("female","female","female","female","male")
Studiegruppe$køn <- køn

#Adding a new person to the dataframe
Studiegruppe$navn <- as.character(Studiegruppe$navn) 
Studiegruppe <- rbind(Studiegruppe,c("Jesper",2,"male"))

#What is the mean number of siblings? 
Studiegruppe$søskende <- as.numeric(Studiegruppe$søskende)
mean(Studiegruppe$søskende)

#A guess on how many siblings they had
Studiegruppe$gæt.søskende <-c(2,4,1,1,3,1)

#The difference between the guess of siblings and how many siblings they actually had
Studiegruppe$difference <- (Studiegruppe$gæt.søskende-Studiegruppe$søskende)

#Exercise 3
#Who has 3 siblings
Studiegruppe[Studiegruppe$søskende==3,"navn"]
#or
subset(Studiegruppe, søskende==3,"navn")

#How many people have more than 1 siblings?
Studiegruppe[Studiegruppe$søskende>1,"navn"]

#Create a subset of of the data containing only people you guessed right
subset(Studiegruppe,difference==0,"navn")
#or
Guessed.right <- subset(Studiegruppe,difference==0,)
#or if you wanna only select some of your collums to go into the new df
#Guessed.right <- subset(Studiegruppe,difference==0,select = c("navn","difference"))

#use "?" to find out what these functions do:
?round
#A function that rounds digits up with it's general command:
round(146.562,digits=2) #or
round(156.562,digits = -2)

?length
#See how many objects of numbers there are in a vector e.g.
length(navn)
#in this example it says 5 because there is 5 objects in the vector "navn"

?unique
#The function removes any dublicats e.g.
unique(Studiegruppe$difference)
#In this example one of the "0" has been removed
#The general command of unique is
unique(x,incomparables=FALSE, ...)

?mean
#the nummeric mean of a vector or dataframe
