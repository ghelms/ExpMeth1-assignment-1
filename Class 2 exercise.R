#Exercise 1
#students with shoesize or bigger
shoe39big <- filter(df,df$shoesize>=39)

#Students who could touch the floor
#for seeing the different factor levels. 
levels(df$touch_floor) 
#There is three ways to do it
touch.the.floor <- filter(df,xor(df$touch_floor=="Yes, of course!!",df$touch_floor== "Yes")) #number 1
touch.the.floor <- filter(df,df$touch_floor =="Yes, of course!!" |df$touch_floor=="Yes") #number 2
touch.the.floor <- filter(df,df$touch_floor ==c("Yes, of course!!","Yes")) #number 3

#Students who were able to hold their breath longer than average
#First i find the average of breathholding time.
mean.breathhold <- mean(df$breath_hold)
#Find the ones who are better than average
Better.breath <- filter(df,df$breath_hold>mean.breathhold)

#Students who can balance a ballon between 13 and 60 seconds
ballon.balance <- filter(df,df$balloon_balance>=13 & df$balloon_balance<=60)

#Students who can do all of the above
all.of.the.above <- filter(df,
                           df$shoesize>=39 &
                             (df$touch_floor =="Yes, of course!!" |df$touch_floor=="Yes") &
                           df$breath_hold>mean.breathhold &
                             (df$balloon_balance>=13 & df$balloon_balance<=60))

#Exercise 2

