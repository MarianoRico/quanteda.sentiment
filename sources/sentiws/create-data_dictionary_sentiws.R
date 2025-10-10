# SentiWS Dictionary

library("quanteda")
library("dplyr")
library("tidyr")
library("stringr")

read_senti_scores <- function(filename) {
    
    results <- read.delim(filename, header = FALSE, encoding="UTF-8") %>%
        cbind(str_split_fixed(.$V3, "[,-]",50),stringsAsFactors = FALSE) %>%
        mutate(
            V1 = str_sub(str_match(V1,".*\\|"),1,-2),
            nr = row_number()
        ) %>%
        select(-V3) %>%
        mutate(nr = as.character(nr)) %>%
        gather(wordstem,word,V1,1:48, -nr,-V2) %>%
        select(word,V2) %>% rename(score=V2) %>%
        filter(word != "") %>%
        arrange(word)
    
}

positive <- read_senti_scores("sources/sentiws/SentiWS_v2.0_Positive.txt") %>% 
    mutate(sentiment = "positive") %>%
    unique()
negative <- read_senti_scores("sources/sentiws/SentiWS_v2.0_Negative.txt") %>% 
    mutate(sentiment = "negative") %>%
    unique()
sentis <- bind_rows(positive, negative)

data_dictionary_sentiws <- as.dictionary(sentis)

polarity(data_dictionary_sentiws) <- 
    list(pos = c("positive"), neg = c("negative"))
valence(data_dictionary_sentiws) <-
    list(positive = positive[!duplicated(positive$word), "score"], 
         negative = negative[!duplicated(negative$word), "score"])

meta(data_dictionary_sentiws) <- 
    list(
        title = "SentimentWortschatz (SentiWS)",
        description = "SentimentWortschatz, or SentiWS for short, is a publicly available German-language resource for sentiment analysis, opinion mining etc. It lists positive and negative polarity bearing words weighted within the interval of [-1; 1] plus their part of speech tag, and if applicable, their inflections. The current version of SentiWS (v2.0) contains around 1,650 positive and 1,800 negative words, which sum up to around 16,000 positive and around 18,000 negative word forms incl. their inflections, respectively. It not only contains adjectives and adverbs explicitly expressing a sentiment, but also nouns and verbs implicitly containing one.",
        url = "http://wortschatz.uni-leipzig.de/en/download/",
        reference = "Remus, R., Quasthoff U., and Heyer, G. (2010). [SentiWS: a Publicly Available German-language Resource for Sentiment Analysis](http://www.lrec-conf.org/proceedings/lrec2010/pdf/490_Paper.pdf). In _Proceedings of the 7th International Language Ressources and Evaluation (LREC'10)_, 1168--1171.",
        license = "CC-BY-NC-SA 3.0"
    )

usethis::use_data(data_dictionary_sentiws, overwrite = TRUE)

