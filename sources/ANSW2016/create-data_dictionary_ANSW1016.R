### Creación de un diccionarios ES de valencias para quanteda usando datos de Hinojosa et al. 2016
### Creation of an ES valence dictionary for quanteda using data from Hinojosa et al. 2016

### Contact: mariano.rico@upm.es

#Requires packages 
# * xlsx
# * quanteda
# * quanteda.sentiment

#Leo los datos de Hinojosa2016.xlsx
#Read datos from Hinojosa2016.xlsx
library(xlsx)
df1 <- read.xlsx(file = "Hinojosa2016.xlsx",
                 sheetIndex = 1, 
                 startRow=1,         
                 skipEmptyRows=FALSE, 
                 colNames=TRUE,
                 stringsAsFactors=FALSE # VIP!!!
)
#Las columnas que nos interesan son "Word", "Val_Mn", "Ar_Mn", "Hap_Mn", "Ang_Mn", "Sad_Mn", "Fear_Mn", "Disg_Mn", "Con_Mn"
#The colums we are interrested in are "Word", "Val_Mn", "Ar_Mn", "Hap_Mn", "Ang_Mn", "Sad_Mn", "Fear_Mn", "Disg_Mn", "Con_Mn"

#Primero, hago el dict con las palabras
#First, I create the dict with the words
library(quanteda) #To know what a dictionary is
data_dictionary_ANSW2016 <- dictionary(list(valence = df1$Word))
#Ahora le asigno las valencias
#Now I assign the valences
library(quanteda.sentiment) #To know what is valence()
valence(data_dictionary_ANSW2016) <- list(valence = df1$Val_Mn)

#Copio, cambio nombre y asigno
#Copy, change name and assign
#Arousal
data_dictionary_ANSW2016["arousal"] <- data_dictionary_ANSW2016["valence"]
valence(data_dictionary_ANSW2016)["arousal"] <- list(arousal = df1$Ar_Mn)

#Happiness
data_dictionary_ANSW2016["happiness"] <- data_dictionary_ANSW2016["valence"]
valence(data_dictionary_ANSW2016)["happiness"] <- list(happiness = df1$Hap_Mn)

#Anger
data_dictionary_ANSW2016["anger"] <- data_dictionary_ANSW2016["valence"]
valence(data_dictionary_ANSW2016)["anger"] <- list(anger = df1$Ang_Mn)

#Sadness
data_dictionary_ANSW2016["sadness"] <- data_dictionary_ANSW2016["valence"]
valence(data_dictionary_ANSW2016)["sadness"] <- list(sadness = df1$Sad_Mn)

#Fearness
data_dictionary_ANSW2016["fearness"] <- data_dictionary_ANSW2016["valence"]
valence(data_dictionary_ANSW2016)["fearness"] <- list(fearness = df1$Fear_Mn)

#Disgust
data_dictionary_ANSW2016["disgust"] <- data_dictionary_ANSW2016["valence"]
valence(data_dictionary_ANSW2016)["disgust"] <- list(disgust = df1$Disg_Mn)

#Concreteness
data_dictionary_ANSW2016["concreteness"] <- data_dictionary_ANSW2016["valence"]
valence(data_dictionary_ANSW2016)["concreteness"] <- list(concreteness = df1$Con_Mn)

meta(data_dictionary_ANSW2016) <- list(
  title = "Dictionary created from Hinojosa, J. A. et al. (2016) 'Affective norms of 875 Spanish words for five discrete emotional categories and two emotional dimensions'.",
  description = "This diccionary has values for valence, arousal, concreteness, as well as five emotions: happiness, anger, sadness, fearness and disgust.",
  url = "https://link.springer.com/article/10.3758/s13428-015-0572-5",
  reference = "Hinojosa, J.A., Martínez-García, N., Villalba-García, C. et al. Affective norms of 875 Spanish words for five discrete emotional categories and two emotional dimensions. Behav Res 48, 272–284 (2016)",
  license = "unknonwn"
)
usethis::use_data(data_dictionary_ANSW2016, overwrite = TRUE)
