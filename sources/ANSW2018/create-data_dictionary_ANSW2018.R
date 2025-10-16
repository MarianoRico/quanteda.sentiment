#
#WARNING! The original file (13428_2017_962_MOESM1_ESM.) is codified 
#           as "ANSI" (according to Notepad++). 
#           We have made a conversion to UTF8 with Notepad++.
#           The current file is 13428_2017_962_MOESM1_ESM.UTF8.csv

#This sentiment dictionary is bigger (x10) than its 2013 version. 
#Compared to the previous version, this version do NOT have "concreteness". 

#Requires packages 
# * quanteda
# * quanteda.sentiment

#Leo los datos de 13428_2017_962_MOESM1_ESM.UTF8.csv
#Read datos from 13428_2017_962_MOESM1_ESM.UTF8.csv
df <- read.csv(file = "13428_2017_962_MOESM1_ESM.UTF8.csv", 
               header = TRUE,
               encoding = "UTF-8",
               stringsAsFactors=FALSE # VIP!!!
)
#The columns we are interested in are "Word", 
#                                     "Valence_Mean" 
#                                     "Arousal_Mean",
#                                     "Happiness_Mean",---
#                                     "Disgust_Mean",     |
#                                     "Anger_Mean",       >  5 sentiments
#                                     "Fear_Mean",        |
#                                     "Sadness_Mean",  ---


#Primero, hago el dict con las palabras
#First, I create the dict with the words
library(quanteda) #To know what a dictionary is
data_dictionary_ANSW2018 <- dictionary(list(valence = df$Word))
#Ahora le asigno las valencias
#Now I assign the valences
library(quanteda.sentiment) #To know what is valence()
valence(data_dictionary_ANSW2018) <- list(valence = df$Valence_Mean)

#Copio, cambio nombre y asigno
#Copy, change name and assign
#Arousal
data_dictionary_ANSW2018["arousal"] <- data_dictionary_ANSW2018["valence"]
valence(data_dictionary_ANSW2018)["arousal"] <- list(arousal = df$Arousal_Mean)

#Happiness
data_dictionary_ANSW2018["happiness"] <- data_dictionary_ANSW2018["valence"]
valence(data_dictionary_ANSW2018)["happiness"] <- list(happiness = df$Happiness_Mean)

#Anger
data_dictionary_ANSW2018["anger"] <- data_dictionary_ANSW2018["valence"]
valence(data_dictionary_ANSW2018)["anger"] <- list(anger = df$Anger_Mean)

#Sadness
data_dictionary_ANSW2018["sadness"] <- data_dictionary_ANSW2018["valence"]
valence(data_dictionary_ANSW2018)["sadness"] <- list(sadness = df$Sadness_Mean)

#Fearness
data_dictionary_ANSW2018["fearness"] <- data_dictionary_ANSW2018["valence"]
valence(data_dictionary_ANSW2018)["fearness"] <- list(fearness = df$Fear_Mean)

#Disgust
data_dictionary_ANSW2018["disgust"] <- data_dictionary_ANSW2018["valence"]
valence(data_dictionary_ANSW2018)["disgust"] <- list(disgust = df$Disgust_Mean)


meta(data_dictionary_ANSW2018) <- list(
  title = "Dictionary created from HStadthagen-González H. et al. (2018) 'Norms for 10,491 Spanish words for five discrete emotions: Happiness, disgust, anger, fear, and sadness'.",
  description = "This diccionary has values for valence and arousal, as well as five emotions: happiness, anger, sadness, fearness and disgust.",
  url = "https://link.springer.com/article/10.3758/s13428-017-0962-y",
  reference = "Stadthagen-González, H., Ferré, P., Pérez-Sánchez, M.A. et al. Norms for 10,491 Spanish words for five discrete emotions: Happiness, disgust, anger, fear, and sadness. Behav Res 50, 1943–1952 (2018).",
  license = "For non-profit academic research purposes."
)
usethis::use_data(data_dictionary_ANSW2018, overwrite = TRUE)
