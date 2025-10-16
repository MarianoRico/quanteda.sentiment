#Spanish polar dictionary from:
#  Chen, Y., & Skiena, S. (2014). Building Sentiment Lexicons for All Major Languages. In ACL (2) (pp. 383-389).
#Datasets in Kaggle: https://www.kaggle.com/rtatman/sentiment-lexicons-for-81-languages 

#Read files positive_words_es.txt and negative_words_es.txt
#Leo ficheros positive_words_es.txt y negative_words_es.txt
pos_words <- readLines("positive_words_es.txt") #1555 words
neg_words <- readLines("negative_words_es.txt") #2720 words

library(quanteda) #To know what is a dictionary
library(quanteda.sentiment) #To know what is polarity()  
data_dictionary_Chen2014 <- dictionary(list(neg = neg_words,
                                            pos = pos_words))
polarity(data_dictionary_Chen2014) <- list(neg = "neg", pos = "pos")
meta(data_dictionary_Chen2014) <- list(
  title = "Dictionary created from Chen, Y., & Skiena, S. (2014). Building Sentiment Lexicons for All Major Languages. In ACL (2) (pp. 383-389).",
  description = "Polar dictionay for Spanish",
  url = "https://www.kaggle.com/rtatman/sentiment-lexicons-for-81-languages",
  reference = "Chen, Y., & Skiena, S. (2014). Building Sentiment Lexicons for All Major Languages. In ACL (2) (pp. 383-389).",
  license = "unknonwn"
)
usethis::use_data(data_dictionary_Chen2014, overwrite = TRUE)
