# 81 languages polar dictionary from:
#  Chen, Y., & Skiena, S. (2014). Building Sentiment Lexicons for All Major Languages. In ACL (2) (pp. 383-389).
#Datasets in Kaggle: https://www.kaggle.com/rtatman/sentiment-lexicons-for-81-languages 

#Read files positive_words_xx.txt and negative_words_xx.txt
#For instance, for the Spanish language there are 1555 positive words and 2720 words negative words

#Test
# es_pos_words <- readLines("positive_words_es.txt") 
# es_neg_words <- readLines("negative_words_es.txt") 
# ca_pos_words <- readLines("positive_words_ca.txt") 
# ca_neg_words <- readLines("negative_words_ca.txt") 
# ga_pos_words <- readLines("positive_words_ga.txt") 
# ga_neg_words <- readLines("negative_words_ga.txt") 
# eu_pos_words <- readLines("positive_words_eu.txt") 
# eu_neg_words <- readLines("negative_words_eu.txt") 


library(quanteda) #To know what is a dictionary
library(quanteda.sentiment) #To know what is polarity()  
# Test
# data_dictionary_ChenSkiena2014 <- dictionary(list(es_neg = es_neg_words,
#                                                   es_pos = es_pos_words,
#                                                   ca_neg = ca_neg_words,
#                                                   ca_pos = ca_pos_words,
#                                                   ga_neg = ga_neg_words,
#                                                   ga_pos = ga_pos_words,
#                                                   eu_neg = eu_neg_words,
#                                                   eu_pos = eu_pos_words
#                                                  )
#                                             )
zip_file_name <- "sentiment-lexicons.zip" #Just the first level in the Kaggle file
df_zip <- unzip(zip_file_name, list = TRUE)#Just get the list of files in the zip
patt = "positive_words_(.*).txt"
pos <- grep(patt, df_zip$Name)
langs <- gsub(patt, "\\1", df_zip$Name[pos])

list_res <- list()
for (i in seq_along(langs)){
  lang <-langs[i]
  pos_words <- readLines(unz(zip_file_name, paste0("positive_words_", lang, ".txt")))
  neg_words <- readLines(unz(zip_file_name, paste0("negative_words_", lang, ".txt")))
  list_res[[2*i]]    <- pos_words
  list_res[[2*i-1]]  <- neg_words
  names(list_res)[2*i]   <- paste0(lang, "_pos")
  names(list_res)[2*i-1] <- paste0(lang, "_neg")
}

data_dictionary_ChenSkiena2014 <- dictionary(list_res)

#Test es
polarity(data_dictionary_ChenSkiena2014) <- list(neg = "es_neg", pos = "es_pos")
textstat_polarity("prueba rápida", dictionary = data_dictionary_ChenSkiena2014) #1.098612
#Test ca
polarity(data_dictionary_ChenSkiena2014) <- list(neg = "ca_neg", pos = "ca_pos")
textstat_polarity("prova ràpida", dictionary = data_dictionary_ChenSkiena2014) #1.098612
#Test ga
polarity(data_dictionary_ChenSkiena2014) <- list(neg = "ga_neg", pos = "ga_pos")
textstat_polarity("proba rápida", dictionary = data_dictionary_ChenSkiena2014) #0
#Test eu
polarity(data_dictionary_ChenSkiena2014) <- list(neg = "eu_neg", pos = "eu_pos")
textstat_polarity("proba azkarra", dictionary = data_dictionary_ChenSkiena2014) #1.098612

meta(data_dictionary_ChenSkiena2014) <- list(
  title = "Dictionary created from Chen, Y., & Skiena, S. (2014). Building Sentiment Lexicons for All Major Languages. In ACL (2) (pp. 383-389).",
  description = "Polar dictionay for Spanish",
  url = "https://www.kaggle.com/rtatman/sentiment-lexicons-for-81-languages",
  reference = "Chen, Y., & Skiena, S. (2014). Building Sentiment Lexicons for All Major Languages. In ACL (2) (pp. 383-389).",
  license = "unknonwn"
)
usethis::use_data(data_dictionary_ChenSkiena2014, overwrite = TRUE)
