# VADER Dictionary

library("quanteda")
library("quanteda.sentiment")

# from https://github.com/nrguimaraes/sentimentSetsR
load("sysdata.rda")

vader_df <- readr::read_tsv(
    "https://raw.githubusercontent.com/cjhutto/vaderSentiment/master/vaderSentiment/vader_lexicon.txt",
    col_names = c("token", "mean_sentiment", "sd", "raw_scores"),
    quote = ""  # important: prevents trouble with brackets and special chars
  )

# Parse raw_scores from string to numeric list
vader_df$raw_scores_list <- lapply(vader_df$raw_scores, function(x) {
  # Remove brackets and parse comma-separated values
  as.numeric(strsplit(gsub("\\[|\\]", "", x), ",\\s*")[[1]])
})

# Merge duplicates by combining raw_scores and recomputing statistics
# There were 14 duplicated tokens, e.g. ":-p"
# > vader_df[120:124, ]
# # A tibble: 5 × 4
# token  mean_sentiment    sd raw_scores                              
# <chr>           <dbl> <dbl> <chr>                                   
# 1 ":-p"             1.2 0.4   [1, 2, 1, 1, 1, 1, 2, 1, 1, 1]          
# 2 ":-["            -1.6 0.490 [-1, -2, -1, -2, -2, -1, -2, -1, -2, -2]
# 3 ":-\\"           -0.9 0.3   [-1, -1, -1, -1, -1, -1, -1, 0, -1, -1] 
# 4 ":-c"            -1.3 0.458 [-1, -1, -1, -2, -2, -1, -2, -1, -1, -1]
# 5 ":-p"             1.5 0.5   [1, 1, 1, 1, 1, 2, 2, 2, 2, 2]          
vader_df <- vader_df |>
  dplyr::group_by(token) |>
  dplyr::summarise(
    raw_scores = list(unlist(raw_scores_list)),
    mean_sentiment = mean(unlist(raw_scores_list)),
    sd = sd(unlist(raw_scores_list)),
    .groups = "drop"
  )

data_dictionary_vader <- dictionary(list("VADER" = vader_df$token))
valence(data_dictionary_vader) <- list("VADER" = vader_df$mean_sentiment)

meta(data_dictionary_vader) <- 
    list(
        title = "VADER Dictionary",
        description = "VADER (Valence Aware Dictionary and sEntiment Reasoner) is a lexicon and rule-based sentiment analysis tool that is specifically attuned to sentiments expressed in social media.",
        url = "https://github.com/cjhutto/vaderSentiment",
        reference = "Hutto, C.J. & Gilbert, E.E. (2014). VADER: A Parsimonious Rule-based Model for Sentiment Analysis of Social Media Text. Eighth International Conference on Weblogs and Social Media (ICWSM-14). Ann Arbor, MI, June 2014. doi: 10.1609/icwsm.v8i1.14550",
        license = "MIT"
    )

usethis::use_data(data_dictionary_vader, overwrite = TRUE)
