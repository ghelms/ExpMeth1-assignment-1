#Exercise 1
# 1 students with 39 shoesize or bigger
shoe39big <- filter(df,df$shoesize>=39)

#Students who could touch the floor
# 2 for seeing the different factor levels. 
levels(df$touch_floor) 
#There is three ways to do it
touch.the.floor <- filter(df,xor(df$touch_floor=="Yes, of course!!",df$touch_floor== "Yes")) #number 1
touch.the.floor <- filter(df,df$touch_floor =="Yes, of course!!" |df$touch_floor=="Yes") #number 2
touch.the.floor <- filter(df,df$touch_floor ==c("Yes, of course!!","Yes")) #number 3

# 3 Students who were able to hold their breath longer than average
#First i find the average of breathholding time.
mean.breathhold <- mean(df$breath_hold)
#Find the ones who are better than average
Better.breath <- filter(df,df$breath_hold>mean.breathhold)

# 4 Students who can balance a ballon between 13 and 60 seconds
ballon.balance <- filter(df,df$balloon_balance>=13 & df$balloon_balance<=60)

# 5 Students who can do all of the above
all.of.the.above <- filter(df,
                           df$shoesize>=39 &
                             (df$touch_floor =="Yes, of course!!" |df$touch_floor=="Yes") &
                           df$breath_hold>mean.breathhold &
                             (df$balloon_balance>=13 & df$balloon_balance<=60))

#Exercise 2
# 1 Sort data so it starts with the student who was the slowest at tongue twister
descending.tongue.twist <- arrange(df,(df$tongue_twist))

# 2 Sort data by one argument to find the student who performed best in the Romberg task. You define ”best”. 
Best.roomberg <- arrange(df,desc(df$romberg_closed),desc(df$shoesize))
#When entering more than one collumn to arrange the next collum (in this example shoesize) will break 
#the ties from the first arranged collumn (romberg_closed)

# 3 How could you improve your Romberg ranking table? 
#I could break the ties on shoesize and add another column

#Excercise 3
#1 What happens if you select the same column name multiple times?
#Testing the "select"-function
test.select <- select(df,name,gender) 
#here you only imply the two collums mentioned
test.select1 <- select(df,name:gender) 
#here are all the collums between name and gender included
test.select2 <- select(df, -c(name:gender, vis_duck:taste_cola))
#here you select all ofther collums than the ones specified parenteses (NOTICE: the - infront of the c)
test.select3 <- select(df,gender,everything())
#here all the collums are kept because of the "everything()", however gender is moved to the first collumn

#The ""select"-function is for subsetting whole collums where the "subset"-function is for picking out
#specific rows that logically ressonates with the given factor e.g.
example.of.subset <- subset(df,df$romberg_open==160)

#2 Make the following "vars" vector
vars=c("name","shoesize","touch_floor")
vars.df <- select(df,vars)
#You can use vectors inside the "select"-function

#3 Rearrange your dataframe with gender and shoesize first.
gender.shoesize.df <- select(df,gender,shoesize,everything())

#The "Mutate"-function e.g.
mutate(df,breath.hold.min=df$breath_hold/60)
#Here the collumn breath.hold.min is added to the df, and collumn contain the breath.hold in minutes

#Exercise 4
#1 The tongue twister had 99 words. Make a new column called ”words_per_sec” where you calculate how 
#many words each student said per second. 
mutate.df <- mutate(df,words.per.sec=(60/df$tongue_twist)*99) 
select(mutate.df,name,tongue_twist,words.per.sec)
#Here i am selecting the tree relevant collums to check if the formular was correct
mutate.df <- format(mutate.df,digits=0)
#Here i set the digits in the collumn to 0

#2




