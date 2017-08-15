setwd("C:\\Users\\lopezf\\Desktop\\coursera\\spec_data\\specdata")
list.files()


#explore file
samp = read.csv(list.files()[1])
names(samp)


#part 1:means---------------------------------------------------------------------------------------------

#Given a vector monitor ID numbers, 'pollutantmean' 
#reads that monitors' particulate matter data from the directory specified in the 'directory' 

#function---------------------------------------
pollutantmean = function(directory, pollutant, id) {
  #read files
  print(list.files()[id])
  setwd(directory)
  
  #use lapply to run through list
  little_data = rbindlist(
    lapply(list.files()[id], function(x) {
      read.csv(x)  
    })
  )
  
  #calculate mean
  mean(little_data[[pollutant]],na.rm = T)
}


#test both features for id 1:50
for (i in c("sulfate", "nitrate")) {
  print(i)
  print(
    pollutantmean(getwd(),i,70:72)
  )
}

for (i in c("sulfate", "nitrate")) {
  print(i)
  print(
    pollutantmean(getwd(),i,1)
  )
}




#part 2:complete cases---------------------------------------------------------------------------------------------
complete = function(directory, id) {
  #read files
  print(list.files()[id])
  setwd(directory)
  
  #use lapply to run through list
  little_data = rbindlist(
    lapply(list.files()[id], function(x) {
      tiny = read.csv(x)
      
      #table complete cases
      tiny = data.frame("id" = tiny$ID[1],"nobs" = table(!is.na(tiny$sulfate)))
      print(tiny)
    })
  )
  #keep only complete cases and id and count
  little_data = little_data[little_data$nobs.Var1 == "TRUE",c(1,3)]
  names(little_data) = c("id", "nobs")
  #print(little_data)
}

complete(getwd(),1:3)
complete(getwd(), c(1,3,5))
complete(getwd(), c(2, 4, 8, 10, 12))
complete(getwd(), 30:25)
complete(getwd(), 3)



pollutantmean("C:\\Users\\lopezf\\Desktop\\coursera\\spec_data\\specdata"
              ,"nitrate"
              ,1:10)


#part 3----------------------------------------------------------------------------------------------------
corr = function(directory, threshold = 0) {
  #use lapply to run through list
  little_data = rbindlist(
    lapply(list.files(), function(x) {
      tiny = read.csv(x)
      tiny$thresh = rep(nrow(tiny[!is.na(tiny$sulfate),]))
      tiny
    })
  )
  
  little_data = little_data[thresh > threshold,]
  print(little_data)
  #run correlation
  print(
    cor(little_data$nitrate, little_data$sulfate ,use = "everything")
  )
}


corr(getwd(),400)

cr =corr(getwd(), 150)
head(cr)


specdata =getwd()
pollutantmean(getwd(), "sulfate", 34)

cc <- complete(getwd(), c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete(getwd(), 54)



set.seed(42)
cc <- complete(getwd(), 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
